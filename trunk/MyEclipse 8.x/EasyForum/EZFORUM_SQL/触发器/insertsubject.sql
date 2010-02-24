--插入新帖子，要给用户发贴数+1，积分加10
CREATE TRIGGER LUOLEI.INSERTSUBJECT 
	AFTER  INSERT  ON LUOLEI.NEWSUBJECT  
	REFERENCING  NEW AS nrow  FOR EACH ROW  MODE DB2SQL 

BEGIN ATOMIC

update usertable set score =  score+10,subjectnum = subjectnum + 1
	where usertable.username = nrow.author;
END@
