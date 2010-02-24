create procedure getNumView(IN v_moduleID INT,
			    OUT v_numView INT)
language sql
specific getNumView

begin
	declare v  INT default -1;
	declare v2 INTEGER default 0;
	declare v4 INT default 0;
	declare v3 INT default 0;
	declare count INT default 0;
	declare c1 cursor for
		select  subjectid from modulesubject where moduleid = v_moduleid;


	open c1;
	
	select count(*) into v4 from modulesubject where moduleid = v_moduleid;
	
	while(v3<v4)
	do
		fetch c1 into v;
		
		 select clickamount into v2 from newsubject where id = v;
		set count = count + v2;
		set v3    = v3 + 1;
		
	end while;

	close c1;
	
	set v_numview = count;
end@