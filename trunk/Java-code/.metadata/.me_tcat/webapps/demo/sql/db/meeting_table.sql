/*==============================================================*/
/* DBMS name:      ORACLE Version 9i                            */
/* Created on:     2008-7-29 7:32:22                            */
/*==============================================================*/


ALTER TABLE FACILITY_APPLY
   DROP CONSTRAINT FA_APP_MF;

ALTER TABLE FACILITY_APPLY
   DROP CONSTRAINT FA_APP_MI;

ALTER TABLE FILE_INFO
   DROP CONSTRAINT MI_FI_RS;

ALTER TABLE MEET_FACILITY
   DROP CONSTRAINT MF_FT_RS;

ALTER TABLE MEET_FACILITY
   DROP CONSTRAINT MR_MF_RS;

ALTER TABLE MEETING_APPLY
   DROP CONSTRAINT MI_MR_RS;

ALTER TABLE MEETING_APPLY
   DROP CONSTRAINT MI_UI_RS;

ALTER TABLE MODULE_INFO
   DROP CONSTRAINT FK_MODULE_GRP;

ALTER TABLE ROLE_MODULE
   DROP CONSTRAINT FK_ROLE;

ALTER TABLE ROLE_MODULE
   DROP CONSTRAINT FK_MODULE;

ALTER TABLE ROLE_USER
   DROP CONSTRAINT FK_ROLE_USER_1;

ALTER TABLE ROLE_USER
   DROP CONSTRAINT FK_ROLE_USER_2;

DROP INDEX MI_FI_RS_FK;

DROP INDEX MR_MF_RS_FK;

DROP INDEX MI_MR_RS_FK;

DROP INDEX MI_UI_RS_FK;

DROP TABLE FACILITY_APPLY CASCADE CONSTRAINTS;

DROP TABLE FACILITY_TYPE CASCADE CONSTRAINTS;

DROP TABLE FILE_INFO CASCADE CONSTRAINTS;

DROP TABLE MEET_FACILITY CASCADE CONSTRAINTS;

DROP TABLE MEETING_APPLY CASCADE CONSTRAINTS;

DROP TABLE MEETING_ROOM CASCADE CONSTRAINTS;

DROP TABLE MODULE_GROUP CASCADE CONSTRAINTS;

DROP TABLE MODULE_INFO CASCADE CONSTRAINTS;

DROP TABLE ROLE_INFO CASCADE CONSTRAINTS;

DROP TABLE ROLE_MODULE CASCADE CONSTRAINTS;

DROP TABLE ROLE_USER CASCADE CONSTRAINTS;

DROP TABLE USER_INFO CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: FACILITY_APPLY                                        */
/*==============================================================*/
CREATE TABLE FACILITY_APPLY  (
   MF_MEET_ID           INTEGER,
   MF_FACILITY_ID       INTEGER
);

/*==============================================================*/
/* Table: FACILITY_TYPE                                         */
/*==============================================================*/
CREATE TABLE FACILITY_TYPE  (
   FT_ID                INTEGER                         NOT NULL,
   FT_NAME              VARCHAR2(30),
   CONSTRAINT FA_TY PRIMARY KEY (FT_ID)
);

/*==============================================================*/
/* Table: FILE_INFO                                             */
/*==============================================================*/
CREATE TABLE FILE_INFO  (
   FILE_ID              INTEGER                         NOT NULL,
   FILE_MEETID          INTEGER,
   FILE_NAME            VARCHAR2(30),
   FILE_SIZE            VARCHAR(40),
   FILE_FORMAT          VARCHAR2(10),
   FILE_PATH            VARCHAR(300),
   FILE_UPLOADTIME      DATE,
   CONSTRAINT PK_FILE_INFO PRIMARY KEY (FILE_ID)
);

/*==============================================================*/
/* Index: MI_FI_RS_FK                                           */
/*==============================================================*/
CREATE INDEX MI_FI_RS_FK ON FILE_INFO (
   FILE_MEETID ASC
);

/*==============================================================*/
/* Table: MEET_FACILITY                                         */
/*==============================================================*/
CREATE TABLE MEET_FACILITY  (
   FC_ID                INTEGER                         NOT NULL,
   FC_MEETROOM_ID       INTEGER                        DEFAULT 0,
   FC_TYPE_ID           INTEGER,
   FC_NUM               VARCHAR2(30),
   FC_BUY_TIME          DATE,
   FC_STATE             CHAR(1),
   CONSTRAINT ME_FA PRIMARY KEY (FC_ID)
);

/*==============================================================*/
/* Index: MR_MF_RS_FK                                           */
/*==============================================================*/
CREATE INDEX MR_MF_RS_FK ON MEET_FACILITY (
   FC_MEETROOM_ID ASC
);

/*==============================================================*/
/* Table: MEETING_APPLY                                         */
/*==============================================================*/
CREATE TABLE MEETING_APPLY  (
   MI_ID                INTEGER                         NOT NULL,
   MI_USER_ID           INTEGER,
   MI_MEETROOM_ID       INTEGER,
   MI_TITLE             VARCHAR2(40),
   MI_DEGREE            CHAR(1),
   MI_CONTENT           VARCHAR2(100),
   MI_START_TIME        DATE,
   MI_END_TIME          DATE,
   MI_ACTOR             VARCHAR2(500),
   MI_COUNT             INTEGER,
   MI_STATE             VARCHAR2(10),
   MI_IDEA              VARCHAR2(100),
   CONSTRAINT ME_IN PRIMARY KEY (MI_ID)
);

/*==============================================================*/
/* Index: MI_MR_RS_FK                                           */
/*==============================================================*/
CREATE INDEX MI_MR_RS_FK ON MEETING_APPLY (
   MI_MEETROOM_ID ASC
);

/*==============================================================*/
/* Index: MI_UI_RS_FK                                           */
/*==============================================================*/
CREATE INDEX MI_UI_RS_FK ON MEETING_APPLY (
   MI_USER_ID ASC
);

/*==============================================================*/
/* Table: MEETING_ROOM                                          */
/*==============================================================*/
CREATE TABLE MEETING_ROOM  (
   MR_ID                INTEGER                         NOT NULL,
   MR_ADDRESS           VARCHAR2(40),
   MR_NAME              VARCHAR2(40),
   MR_COUNT             INTEGER,
   MR_DESC              VARCHAR(500),
   CONSTRAINT ME_RO PRIMARY KEY (MR_ID)
);

/*==============================================================*/
/* Table: MODULE_GROUP                                          */
/*==============================================================*/
CREATE TABLE MODULE_GROUP  (
   MGRP_ID              INTEGER                         NOT NULL,
   MGRP_NAME            VARCHAR(100),
   MGRP_URL             VARCHAR(200),
   MGRP_DESC            VARCHAR(500),
   CONSTRAINT PK_MODULE_GROUP PRIMARY KEY (MGRP_ID)
);

/*==============================================================*/
/* Table: MODULE_INFO                                           */
/*==============================================================*/
CREATE TABLE MODULE_INFO  (
   MODULE_ID            INTEGER                         NOT NULL,
   MODULE_GRPID         INTEGER,
   MODULE_NAME          VARCHAR(100),
   MODULE_URL           VARCHAR(200),
   MODULE_DESC          VARCHAR(500),
   CONSTRAINT PK_MODULE_INFO PRIMARY KEY (MODULE_ID)
);

/*==============================================================*/
/* Table: ROLE_INFO                                             */
/*==============================================================*/
CREATE TABLE ROLE_INFO  (
   ROLE_ID              INTEGER                         NOT NULL,
   ROLE_NAME            VARCHAR(100),
   ROLE_DESC            VARCHAR(500),
   CONSTRAINT PK_ROLE_INFO PRIMARY KEY (ROLE_ID)
);

/*==============================================================*/
/* Table: ROLE_MODULE                                           */
/*==============================================================*/
CREATE TABLE ROLE_MODULE  (
   MR_ROLEID            INTEGER,
   MR_MODULEID          INTEGER
);

/*==============================================================*/
/* Table: ROLE_USER                                             */
/*==============================================================*/
CREATE TABLE ROLE_USER  (
   UR_ROLEID            INTEGER,
   UR_USERID            INTEGER
);

/*==============================================================*/
/* Table: USER_INFO                                             */
/*==============================================================*/
CREATE TABLE USER_INFO  (
   UI_ID                INTEGER                         NOT NULL,
   UI_ACCOUNT           VARCHAR2(30),
   UI_PWD               VARCHAR2(30),
   UI_NAME              VARCHAR2(30),
   UI_DEPARTMENT        VARCHAR2(30),
   CONSTRAINT PK_USER_INFO PRIMARY KEY (UI_ID)
);

ALTER TABLE FACILITY_APPLY
   ADD CONSTRAINT FA_APP_MF FOREIGN KEY (MF_FACILITY_ID)
      REFERENCES MEET_FACILITY (FC_ID);

ALTER TABLE FACILITY_APPLY
   ADD CONSTRAINT FA_APP_MI FOREIGN KEY (MF_MEET_ID)
      REFERENCES MEETING_APPLY (MI_ID);

ALTER TABLE FILE_INFO
   ADD CONSTRAINT MI_FI_RS FOREIGN KEY (FILE_MEETID)
      REFERENCES MEETING_APPLY (MI_ID);

ALTER TABLE MEET_FACILITY
   ADD CONSTRAINT MF_FT_RS FOREIGN KEY (FC_TYPE_ID)
      REFERENCES FACILITY_TYPE (FT_ID);

ALTER TABLE MEET_FACILITY
   ADD CONSTRAINT MR_MF_RS FOREIGN KEY (FC_MEETROOM_ID)
      REFERENCES MEETING_ROOM (MR_ID);

ALTER TABLE MEETING_APPLY
   ADD CONSTRAINT MI_MR_RS FOREIGN KEY (MI_MEETROOM_ID)
      REFERENCES MEETING_ROOM (MR_ID);

ALTER TABLE MEETING_APPLY
   ADD CONSTRAINT MI_UI_RS FOREIGN KEY (MI_USER_ID)
      REFERENCES USER_INFO (UI_ID);

ALTER TABLE MODULE_INFO
   ADD CONSTRAINT FK_MODULE_GRP FOREIGN KEY (MODULE_GRPID)
      REFERENCES MODULE_GROUP (MGRP_ID);

ALTER TABLE ROLE_MODULE
   ADD CONSTRAINT FK_ROLE FOREIGN KEY (MR_ROLEID)
      REFERENCES ROLE_INFO (ROLE_ID);

ALTER TABLE ROLE_MODULE
   ADD CONSTRAINT FK_MODULE FOREIGN KEY (MR_MODULEID)
      REFERENCES MODULE_INFO (MODULE_ID);

ALTER TABLE ROLE_USER
   ADD CONSTRAINT FK_ROLE_USER_1 FOREIGN KEY (UR_USERID)
      REFERENCES USER_INFO (UI_ID);

ALTER TABLE ROLE_USER
   ADD CONSTRAINT FK_ROLE_USER_2 FOREIGN KEY (UR_ROLEID)
      REFERENCES ROLE_INFO (ROLE_ID);

