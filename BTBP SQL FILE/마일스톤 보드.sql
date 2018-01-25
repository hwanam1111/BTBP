12. 마일스톤 보드
create sequence seq_cpp_milestone_row_no

DROP TABLE SCOTT.CPP_MILESTONE_BOARD CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_MILESTONE_BOARD
(
  PROJECT_NO  NUMBER,
  ROW_NO      NUMBER,
  ROW_NAME    VARCHAR2(40 BYTE),
  ROW_STATUS  VARCHAR2(20 BYTE),
  ROW_GOOD    VARCHAR2(2000 BYTE),
  ROW_BAD     VARCHAR2(2000 BYTE)
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


ALTER TABLE SCOTT.CPP_MILESTONE_BOARD ADD (
  CONSTRAINT FK_CPP_MILESTONE_BOARD_PRO_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);
