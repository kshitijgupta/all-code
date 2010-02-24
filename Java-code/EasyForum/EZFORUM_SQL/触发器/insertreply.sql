--插入回复帖子发帖人回复数加1，积分加5
CREATE TRIGGER LUOLEI.INSERTREPLY 
	AFTER  INSERT  ON LUOLEI.REPLY  
	REFERENCING  NEW AS nrow  FOR EACH ROW  MODE DB2SQL 
BEGIN ATOMIC

update usertable set score = score + 5, renum= renum+1
	where usertable.username = nrow.author;


END@