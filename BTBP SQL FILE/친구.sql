5. 친구
DROP TABLE SCOTT.CPP_FRIEND CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_FRIEND
(
  MEMBER_ID    VARCHAR2(20 BYTE),
  FRIEND_ID    VARCHAR2(50 BYTE),
  CREATE_DATE  DATE
)
TABLESPACE USERS
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
MONITORING;


ALTER TABLE SCOTT.CPP_FRIEND ADD (
  CONSTRAINT FK_CPP_FRIEND_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE);
