13. 마일스톤 보드 카드
create sequence seq_cpp_milestone_cart_no

ALTER TABLE SCOTT.CPP_MILESTONE_BOARD_CARD
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_MILESTONE_BOARD_CARD CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_MILESTONE_BOARD_CARD
(
  MILESTONE_BOARD_CARD_NO  NUMBER,
  PROJECT_NO               NUMBER,
  ROW_NO                   NUMBER,
  CARD_NO                  VARCHAR2(20 BYTE),
  CHECK1_POINT             NUMBER,
  CHECK2_POINT             NUMBER,
  CHECK3_POINT             NUMBER,
  CHECK4_POINT             NUMBER,
  CHECK5_POINT             NUMBER,
  CHECK6_POINT             NUMBER,
  CHECK7_POINT             NUMBER,
  CHECK8_POINT             NUMBER,
  CHECK9_POINT             NUMBER,
  CHECK10_POINT            NUMBER,
  CHECK11_POINT            NUMBER,
  CHECK12_POINT            NUMBER
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

ALTER TABLE SCOTT.CPP_MILESTONE_BOARD_CARD ADD (
  PRIMARY KEY
  (MILESTONE_BOARD_CARD_NO)
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

ALTER TABLE SCOTT.CPP_MILESTONE_BOARD_CARD ADD (
  CONSTRAINT FK_CPP_BOARD_CARD_NO 
  FOREIGN KEY (CARD_NO) 
  REFERENCES SCOTT.CPP_MILESTONE_CARD_INFO (CARD_NO)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_BOARD_CARD_PRO_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);
