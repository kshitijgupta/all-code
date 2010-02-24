
CREATE TRIGGER LUOLEI.DELETEREPLY 
	AFTER  DELETE  ON LUOLEI.NEWSUBJECT  
	REFERENCING  OLD AS orow  FOR EACH ROW  MODE DB2SQL 
BEGIN ATOMIC
delete from reply
            where reply.id in (
	select subjectandreply.replyid
	from subjectandreply
	where subjectandreply.subjectid = orow.id);
delete from subjectandreply
            where subjectandreply.subjectid = orow.id;
END@