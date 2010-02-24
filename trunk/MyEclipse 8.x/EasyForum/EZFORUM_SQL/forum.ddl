-- �� CLP �ļ���ʹ�� DB2LOOK �汾������ 9.5
-- ʱ�����: 2008-11-18 20:21:26
-- ���ݿ�����: EZFORUM        
-- ���ݿ�������汾: DB2/NT Version 9.5.0          
-- ���ݿ����ҳ: 1386
-- ���ݿ�����˳��Ϊ: UNIQUE


CONNECT TO EZFORUM;

------------------------------------
-- TABLESPACES �� DDL ��� --
------------------------------------


CREATE REGULAR TABLESPACE FORUMTABLESPACE IN DATABASE PARTITION GROUP IBMDEFAULTGROUP 
	 PAGESIZE 4096 MANAGED BY AUTOMATIC STORAGE 
	 AUTORESIZE YES 
	 INITIALSIZE 32 M 
	 MAXSIZE NONE 
	 EXTENTSIZE 8
	 PREFETCHSIZE 8
	 BUFFERPOOL IBMDEFAULTBP
	 OVERHEAD 12.670000
	 TRANSFERRATE 0.180000 
	 DROPPED TABLE RECOVERY ON;


CREATE LARGE TABLESPACE SYSTOOLSPACE IN DATABASE PARTITION GROUP IBMCATGROUP 
	 PAGESIZE 4096 MANAGED BY AUTOMATIC STORAGE 
	 AUTORESIZE YES 
	 INITIALSIZE 32 M 
	 MAXSIZE NONE 
	 EXTENTSIZE 4
	 PREFETCHSIZE AUTOMATIC
	 BUFFERPOOL IBMDEFAULTBP
	 OVERHEAD 7.500000
	 TRANSFERRATE 0.060000 
	 DROPPED TABLE RECOVERY ON;


-- ģ���ռ�

ALTER TABLESPACE SYSCATSPACE
      PREFETCHSIZE AUTOMATIC
      OVERHEAD 7.500000
      FILE SYSTEM CACHING 
      TRANSFERRATE 0.060000;


ALTER TABLESPACE TEMPSPACE1
      PREFETCHSIZE AUTOMATIC
      OVERHEAD 7.500000
      FILE SYSTEM CACHING 
      TRANSFERRATE 0.060000;


ALTER TABLESPACE USERSPACE1
      PREFETCHSIZE AUTOMATIC
      OVERHEAD 7.500000
      FILE SYSTEM CACHING 
      TRANSFERRATE 0.060000;




------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."USERTABLE"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."USERTABLE"  (
		  "USERID" INTEGER NOT NULL , 
		  "USERNAME" VARCHAR(20) NOT NULL , 
		  "PASSWORD" VARCHAR(14) NOT NULL , 
		  "SUBJECTNUM" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "RENUM" BIGINT NOT NULL WITH DEFAULT 0 , 
		  "SCORE" INTEGER NOT NULL WITH DEFAULT 100 )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."USERTABLE" IS '��̳�û���';


-- ���������� DDL ��� "LUOLEI  "."USERTABLE"

ALTER TABLE "LUOLEI  "."USERTABLE" 
	ADD CONSTRAINT "CC1227008843390" PRIMARY KEY
		("USERID");


-- ���ϵ�ΨһԼ���� DDL ��� "LUOLEI  "."USERTABLE"


ALTER TABLE "LUOLEI  "."USERTABLE" 
	ADD CONSTRAINT "CC1227008849437" UNIQUE
		("USERNAME");


------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."MODULE"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."MODULE"  (
		  "MODULEID" INTEGER NOT NULL , 
		  "MODULENAME" VARCHAR(20) NOT NULL )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."MODULE" IS '��̳ģ���';


-- ���������� DDL ��� "LUOLEI  "."MODULE"

ALTER TABLE "LUOLEI  "."MODULE" 
	ADD CONSTRAINT "CC1227009050718" PRIMARY KEY
		("MODULEID");


-- ���ϵ�ΨһԼ���� DDL ��� "LUOLEI  "."MODULE"


ALTER TABLE "LUOLEI  "."MODULE" 
	ADD CONSTRAINT "CC1227009053671" UNIQUE
		("MODULENAME");


------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."NEWSUBJECT"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."NEWSUBJECT"  (
		  "ID" INTEGER NOT NULL , 
		  "TITLE" VARCHAR(30) NOT NULL , 
		  "CONTENT" VARCHAR(3000) NOT NULL , 
		  "SUBMITDATE" DATE NOT NULL , 
		  "AUTHOR" VARCHAR(20) NOT NULL , 
		  "CLICKAMOUNT" INTEGER NOT NULL WITH DEFAULT 0 , 
		  "REPLYAMOUNT" INTEGER NOT NULL WITH DEFAULT 0 )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."NEWSUBJECT" IS '��̳������';


-- ���������� DDL ��� "LUOLEI  "."NEWSUBJECT"

ALTER TABLE "LUOLEI  "."NEWSUBJECT" 
	ADD CONSTRAINT "CC1227009798906" PRIMARY KEY
		("ID");



------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."REPLY"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."REPLY"  (
		  "ID" INTEGER NOT NULL , 
		  "CONTENT" VARCHAR(3000) NOT NULL , 
		  "AUTHOR" VARCHAR(20) NOT NULL , 
		  "REDATE" DATE NOT NULL )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."REPLY" IS '��̳������';


-- ���������� DDL ��� "LUOLEI  "."REPLY"

ALTER TABLE "LUOLEI  "."REPLY" 
	ADD CONSTRAINT "CC1227010071203" PRIMARY KEY
		("ID");



------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."MODULESUBJECT"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."MODULESUBJECT"  (
		  "MODULEID" INTEGER NOT NULL , 
		  "SUBJECTID" INTEGER NOT NULL )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."MODULESUBJECT" IS '��̳���������ϵ��';






------------------------------------------------
-- ��� DDL ��� "LUOLEI  "."SUBJECTANDREPLY"
------------------------------------------------
 

CREATE TABLE "LUOLEI  "."SUBJECTANDREPLY"  (
		  "SUBJECTID" INTEGER NOT NULL , 
		  "REPLYID" INTEGER NOT NULL )   
		 IN "FORUMTABLESPACE" ; 

COMMENT ON TABLE "LUOLEI  "."SUBJECTANDREPLY" IS '�����ͻ�����ϵ��';












COMMIT WORK;

CONNECT RESET;

TERMINATE;

-- ָ����ģʽΪ: LUOLEI
-- ���ڴ������ DDL

-- ���ϲ��ֵ�ģʽ��������
;