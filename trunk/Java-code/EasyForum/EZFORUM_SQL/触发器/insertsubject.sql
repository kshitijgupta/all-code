--���������ӣ�Ҫ���û�������+1�����ּ�10
CREATE TRIGGER LUOLEI.INSERTSUBJECT 
	AFTER  INSERT  ON LUOLEI.NEWSUBJECT  
	REFERENCING  NEW AS nrow  FOR EACH ROW  MODE DB2SQL 

BEGIN ATOMIC

update usertable set score =  score+10,subjectnum = subjectnum + 1
	where usertable.username = nrow.author;
END@
