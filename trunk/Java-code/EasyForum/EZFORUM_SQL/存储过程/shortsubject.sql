CREATE PROCEDURE shortsubject (IN v_moduleid INT )

RESULT SETS 1
LANGUAGE SQL
specific shortsubject

P1:BEGIN
	
	declare lasttime TIMESTAMP;
	declare lastauthor VARCHAR(20);
	declare num_c1	INT	default 0;
	--游标c1从指定板块id查找全部对应主题
	declare c1 cursor for
		select  subjectid from modulesubject where moduleid = v_moduleid;
	select count(*) into num_c1 from modulesubject where moduleid = v_moduleid;
	--定义要返回的临时表，结束后删除
	DECLARE GLOBAL TEMPORARY TABLE SESSION.TEMP
    	(
		ID		INT,
		TITLE		VARCHAR(30), 
       		AUTHOR		VARCHAR(20),
		CLICKAMOUNT	INTEGER,
		REPLYAMOUNT	INTEGER,
		LASTTIME	TIMESTAMP,
		LASTAUTHOR	VARCHAR(20)
    	)
    	WITH REPLACE
    	NOT LOGGED;
	

	p2:BEGIN
		DECLARE i	INT	default 0;
		DECLARE SUBJECTID INT ;
		DECLARE V_TITLE VARCHAR(30) ;
		DECLARE V_AUTHOR VARCHAR(20) ;
		DECLARE V_CLICKAMOUNT INT DEFAULT 0;
		DECLARE V_REPLYAMOUNT INT DEFAULT 0;
		--要返回的游标		
		DECLARE r_CURSOR CURSOR WITH RETURN TO CLIENT FOR
    			SELECT * FROM SESSION.TEMP ORDER BY LASTTIME DESC
   			FOR READ ONLY;
		

		set i = 0;
		open c1;
		--对于每个主题帖子做一次循环
		while(i<num_c1)
		do
			set i = i + 1 ;
			fetch c1 into SUBJECTID;
			--从指定主题帖子id获取该主题的题目，作者，点击数，回复数
			select title, author,clickamount, replyamount
					INTO V_TITLE, V_AUTHOR, V_CLICKAMOUNT,  V_REPLYAMOUNT
				from newsubject 
				where id = SUBJECTID;
			--设置p3为了让异常不跳出循环
			p3:BEGIN
				--定义异常处理：可能出异常位置是捕获最晚回复帖子
				--因为可能无回帖，所以抛出异常，那么最晚发布时间和作者一定是主题帖子的作者和时间
				DECLARE EXIT HANDLER FOR sqlstate '02000'

		    		BEGIN NOT ATOMIC                  
					select author , submitdate into lastauthor,lasttime 
						from newsubject
						where id = SUBJECTID;
   				END;
				--获取最晚回帖的时间和作者，可能有异常
				select reply.redate, reply.author into lasttime  , lastauthor  
					from reply join subjectandreply on reply.id = subjectandreply.replyid 
					where subjectandreply.subjectid = SUBJECTID
					order by reply.redate desc 
					fetch first 1 rows only;

			END p3;

			--把获取的值插入临时表
			insert into SESSION.TEMP values(SUBJECTID, V_TITLE, V_AUTHOR, V_CLICKAMOUNT, 
							V_REPLYAMOUNT, lasttime, lastauthor);
			

		end while;	
		close c1;
		
		open r_cursor;
	END P2;	

END P1@