--根据板块id计算出改板块的主题数和总帖数和最后发帖时间和作者
create procedure total(IN   v_moduleID    INT,
		       OUT  v_subject	  INT,
		       OUT  v_total	  INT
			)

language sql
specific total

begin
	--计算出改板块的主题数和总帖数
	declare sqlcode  integer default 0; 
	
	declare v1 INT default 0;
	declare v2 INT default 0;
	declare v3 INT default 0;
	declare v4 INT default 0;
	declare c1 cursor for
		select  subjectid from modulesubject where moduleid = v_moduleid;
	
	

	open c1;

	
	cursorloop:
	loop
		fetch c1 into v3;
		if sqlcode=100 then leave cursorLoop;
		end if;
		select count(*) into v4 from subjectandreply where subjectid = v3;
		set v2 = v2 + v4;
	end loop;
	close c1;
	set v_total = v2;

	
	
	
	select count(*) into v_subject from modulesubject where moduleid = v_moduleID;
	set v2 = v_subject;

	
	

end@