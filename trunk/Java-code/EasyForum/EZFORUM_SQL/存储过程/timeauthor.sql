create procedure last(IN   v_moduleID    INT,
			OUT v_time1	  TIMESTAMP,
			OUT v_author1     VARCHAR(20),
			OUT v_time2       TIMESTAMP,
			OUT v_author2     VARCHAR(20))

language sql
specific last

begin
	declare sqlcode  integer default 0; 
	DECLARE sqlstate CHAR(5) default '00000';

	DECLARE EXIT HANDLER FOR sqlstate '02000'

    		BEGIN NOT ATOMIC                  
      			
			set v_time1 =  '2008-01-01-11.11.11.000000';   
			set v_time2 =  '2008-01-01-11.11.11.000000';   
			set v_author1 = '';
			set v_author2 = '';     
   		 END;                        



	--获取新主题中最近发布的时间和作者
	select newsubject.submitdate ,newsubject.author  into v_time1, v_author1 
			from newsubject join modulesubject on newsubject.id = modulesubject.subjectid  
			where modulesubject.moduleid = v_moduleID order by  newsubject.submitdate desc
			fetch first 1 rows only;
	--获取跟帖中最近发布的时间和作者

	select reply.redate , reply.author into v_time2 , v_author2
		from   reply join subjectandreply on reply.id = subjectandreply.replyid
		where  subjectandreply.subjectid in (select  subjectid from modulesubject where moduleid = v_moduleID)
		order by reply.redate desc
		fetch first 1 rows only;


end@