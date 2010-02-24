CREATE PROCEDURE shortsubject (IN v_moduleid INT )

RESULT SETS 1
LANGUAGE SQL
specific shortsubject

P1:BEGIN
	
	declare lasttime TIMESTAMP;
	declare lastauthor VARCHAR(20);
	declare num_c1	INT	default 0;
	--�α�c1��ָ�����id����ȫ����Ӧ����
	declare c1 cursor for
		select  subjectid from modulesubject where moduleid = v_moduleid;
	select count(*) into num_c1 from modulesubject where moduleid = v_moduleid;
	--����Ҫ���ص���ʱ��������ɾ��
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
		--Ҫ���ص��α�		
		DECLARE r_CURSOR CURSOR WITH RETURN TO CLIENT FOR
    			SELECT * FROM SESSION.TEMP ORDER BY LASTTIME DESC
   			FOR READ ONLY;
		

		set i = 0;
		open c1;
		--����ÿ������������һ��ѭ��
		while(i<num_c1)
		do
			set i = i + 1 ;
			fetch c1 into SUBJECTID;
			--��ָ����������id��ȡ���������Ŀ�����ߣ���������ظ���
			select title, author,clickamount, replyamount
					INTO V_TITLE, V_AUTHOR, V_CLICKAMOUNT,  V_REPLYAMOUNT
				from newsubject 
				where id = SUBJECTID;
			--����p3Ϊ�����쳣������ѭ��
			p3:BEGIN
				--�����쳣�������ܳ��쳣λ���ǲ�������ظ�����
				--��Ϊ�����޻����������׳��쳣����ô������ʱ�������һ�����������ӵ����ߺ�ʱ��
				DECLARE EXIT HANDLER FOR sqlstate '02000'

		    		BEGIN NOT ATOMIC                  
					select author , submitdate into lastauthor,lasttime 
						from newsubject
						where id = SUBJECTID;
   				END;
				--��ȡ���������ʱ������ߣ��������쳣
				select reply.redate, reply.author into lasttime  , lastauthor  
					from reply join subjectandreply on reply.id = subjectandreply.replyid 
					where subjectandreply.subjectid = SUBJECTID
					order by reply.redate desc 
					fetch first 1 rows only;

			END p3;

			--�ѻ�ȡ��ֵ������ʱ��
			insert into SESSION.TEMP values(SUBJECTID, V_TITLE, V_AUTHOR, V_CLICKAMOUNT, 
							V_REPLYAMOUNT, lasttime, lastauthor);
			

		end while;	
		close c1;
		
		open r_cursor;
	END P2;	

END P1@