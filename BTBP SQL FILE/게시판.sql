8. 게시판
create sequence seq_cpp_board_no

ALTER TABLE SCOTT.CPP_BOARD
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_BOARD CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_BOARD
(
  BOARD_NO        NUMBER,
  MEMBER_ID       VARCHAR2(20 BYTE),
  PROJECT_NO      NUMBER,
  BOARD_TYPE      VARCHAR2(20 BYTE),
  BOARD_TITLE     VARCHAR2(200 BYTE),
  BOARD_CONTENT   VARCHAR2(2000 BYTE),
  BOARD_CNT       NUMBER,
  FILE_NAME       VARCHAR2(100 BYTE),
  FILE_PATH       VARCHAR2(200 BYTE),
  CREATE_DATE     DATE,
  FILE_SAVE_NAME  VARCHAR2(100 BYTE),
  FILE_SIZE       NUMBER
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


#NAME?
#NAME?

ALTER TABLE SCOTT.CPP_BOARD ADD (
  PRIMARY KEY
  (BOARD_NO)
  USING INDEX
    TABLESPACE USERS
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
                BUFFER_POOL      DEFAULT
               )
  ENABLE VALIDATE);

ALTER TABLE SCOTT.CPP_BOARD ADD (
  CONSTRAINT FK_CPP_BOARD_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_BOARD_PROJECT_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);
