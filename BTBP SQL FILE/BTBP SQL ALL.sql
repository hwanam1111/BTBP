-- 1. 메시지
DROP TABLE SCOTT.CPP_MESSAGE CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_MESSAGE
(
  SEND_ID     VARCHAR2(20 BYTE),
  RECEIVE_ID  VARCHAR2(20 BYTE),
  MESSAGE     VARCHAR2(200 BYTE),
  MDATE       DATE,
  READ        VARCHAR2(2 BYTE)
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



-- 2. 회원
ALTER TABLE SCOTT.CPP_MEMBER
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_MEMBER CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_MEMBER
(
  MEMBER_ID               VARCHAR2(20 BYTE),
  MEMBER_PW               VARCHAR2(30 BYTE),
  MEMBER_NAME             VARCHAR2(20 BYTE),
  MEMBER_GENDER           VARCHAR2(10 BYTE),
  MEMBER_PHONE            VARCHAR2(15 BYTE),
  MEMBER_EMAIL            VARCHAR2(100 BYTE),
  MEMBER_COMPANY          VARCHAR2(50 BYTE),
  MEMBER_DEPT             VARCHAR2(50 BYTE),
  MEMBER_RANK             VARCHAR2(50 BYTE),
  CREATE_DATE             DATE,
  LAST_LOGIN_DATE         DATE,
  LEAVE_DATE              DATE,
  MEMBER_STATUS           VARCHAR2(4 BYTE),
  MEMBER_IMAGE_NAME       VARCHAR2(50 BYTE),
  MEMBER_IMAGE_SAVE_NAME  VARCHAR2(100 BYTE),
  MEMBER_IMAGE_PATH       VARCHAR2(50 BYTE),
  MEMBER_IMAGE_SIZE       NUMBER,
  SEARCH_STATUS           VARCHAR2(4 BYTE)
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

ALTER TABLE SCOTT.CPP_MEMBER ADD (
  PRIMARY KEY
  (MEMBER_ID)
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



-- 3. 프로젝트정보
create sequence seq_cpp_project_no

ALTER TABLE SCOTT.CPP_PROJECT
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_PROJECT CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_PROJECT
(
  PROJECT_NO      NUMBER,
  PROJECT_NAME    VARCHAR2(50 BYTE),
  PROJECT_STATUS  VARCHAR2(20 BYTE),
  PROJECT_DETAIL  VARCHAR2(400 BYTE),
  ORDER_COMPANY   VARCHAR2(50 BYTE),
  OBTAIN_COMPANY  VARCHAR2(50 BYTE),
  PROJECT_BUDGET  NUMBER,
  START_DATE      DATE,
  END_DATE        DATE,
  MEMBER_ID       VARCHAR2(40 BYTE)
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

ALTER TABLE SCOTT.CPP_PROJECT ADD (
  PRIMARY KEY
  (PROJECT_NO)
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



-- 4. 로그인
DROP TABLE SCOTT.CPP_LOGIN CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_LOGIN
(
  MEMBER_ID    VARCHAR2(20 BYTE),
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


ALTER TABLE SCOTT.CPP_LOGIN ADD (
  CONSTRAINT FK_CPP_LOGIN_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE);

GRANT DELETE, INSERT, SELECT, UPDATE ON SCOTT.CPP_LOGIN TO SYSTEM;



-- 5. 친구
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



-- 6. 채팅
DROP TABLE SCOTT.CPP_CHATTING CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_CHATTING
(
  MEMBER_ID     VARCHAR2(20 BYTE),
  PROJECT_NO    NUMBER,
  CHAT_MESSAGE  VARCHAR2(100 BYTE),
  CREATE_DATE   DATE
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


ALTER TABLE SCOTT.CPP_CHATTING ADD (
  CONSTRAINT FK_CPP_CHATTING_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_CHATTING_PROJECT_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);



-- 7. 프로젝트 멤버
DROP TABLE SCOTT.CPP_PROJECT_MEMBER CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_PROJECT_MEMBER
(
  MEMBER_ID    VARCHAR2(20 BYTE),
  PROJECT_NO   NUMBER,
  GRADE        VARCHAR2(20 BYTE),
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


ALTER TABLE SCOTT.CPP_PROJECT_MEMBER ADD (
  CONSTRAINT FK_CPP_PROJECTMB_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_PROJECTMB_PROJECT_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);



-- 8. 게시판
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



-- 9. 댓글
create sequence seq_cpp_reply_no

ALTER TABLE SCOTT.CPP_REPLY
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_REPLY CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_REPLY
(
  REPLY_NO       NUMBER,
  BOARD_NO       NUMBER,
  MEMBER_ID      VARCHAR2(20 BYTE),
  REPLY_CONTENT  VARCHAR2(2000 BYTE),
  CREATE_DATE    DATE
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

ALTER TABLE SCOTT.CPP_REPLY ADD (
  PRIMARY KEY
  (REPLY_NO)
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

ALTER TABLE SCOTT.CPP_REPLY ADD (
  CONSTRAINT FK_CPP_REPLY_BOARD_NO 
  FOREIGN KEY (BOARD_NO) 
  REFERENCES SCOTT.CPP_BOARD (BOARD_NO)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_REPLY_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE);



-- 10. 업무
create sequence seq_cpp_job_no

ALTER TABLE SCOTT.CPP_JOB
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_JOB CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_JOB
(
  JOB_NO       NUMBER,
  MEMBER_ID    VARCHAR2(20 BYTE),
  PROJECT_NO   NUMBER,
  JOB_TITLE    VARCHAR2(200 BYTE),
  JOB_CONTENT  VARCHAR2(2000 BYTE),
  CREATE_DATE  DATE,
  START_DATE   DATE,
  END_DATE     DATE,
  JOB_TYPE     VARCHAR2(30 BYTE),
  JOB_STATUS   VARCHAR2(30 BYTE)
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

ALTER TABLE SCOTT.CPP_JOB ADD (
  PRIMARY KEY
  (JOB_NO)
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

ALTER TABLE SCOTT.CPP_JOB ADD (
  CONSTRAINT FK_CPP_JOB_MEMBER_ID 
  FOREIGN KEY (MEMBER_ID) 
  REFERENCES SCOTT.CPP_MEMBER (MEMBER_ID)
  ENABLE VALIDATE,
  CONSTRAINT FK_CPP_JOB_PROJECT_NO 
  FOREIGN KEY (PROJECT_NO) 
  REFERENCES SCOTT.CPP_PROJECT (PROJECT_NO)
  ENABLE VALIDATE);



-- 11. 마일스톤 카드 리스트
ALTER TABLE SCOTT.CPP_MILESTONE_CARD_INFO
 DROP PRIMARY KEY CASCADE;

DROP TABLE SCOTT.CPP_MILESTONE_CARD_INFO CASCADE CONSTRAINTS;

CREATE TABLE SCOTT.CPP_MILESTONE_CARD_INFO
(
  CARD_NO     VARCHAR2(20 BYTE),
  CARD_GROUP  VARCHAR2(20 BYTE),
  CHECK1      VARCHAR2(200 BYTE),
  CHECK2      VARCHAR2(200 BYTE),
  CHECK3      VARCHAR2(200 BYTE),
  CHECK4      VARCHAR2(200 BYTE),
  CHECK5      VARCHAR2(200 BYTE),
  CHECK6      VARCHAR2(200 BYTE),
  CHECK7      VARCHAR2(200 BYTE),
  CHECK8      VARCHAR2(200 BYTE),
  CHECK9      VARCHAR2(200 BYTE),
  CHECK10     VARCHAR2(200 BYTE),
  CHECK11     VARCHAR2(200 BYTE),
  CHECK12     VARCHAR2(200 BYTE),
  CARD_TITLE  VARCHAR2(40 BYTE)
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

ALTER TABLE SCOTT.CPP_MILESTONE_CARD_INFO ADD (
  PRIMARY KEY
  (CARD_NO)
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

 -- 데이터 입력
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('이해-1', '이해관계자', '소프트웨어 시스템을 개발하거나 운영함으로써 영향을 받거나, 영향을 받게 될 모든 이해관계자들이 식별된다', '대표해야 할 이해관계자 그룹에 대한 합의가 된다. 최소한 시스템에 펀딩하고, 사용하고, 지원하고 유지할 이해관계자 그룹은 고려된다 ', '이해관계자 대표들의 책임이 정의된다', 
    '식별');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('이해-2', '이해관계자', '이해관계자 대표들이 그들의 책임을 맡는 것에 동의한다', '이해관계자 대표들이 그들의 책임을 수행할 권한을 부여 받는다', '이해관계자 대표들간의 협업 방식이 합의된다', 
    '이해관계자 대표들이 팀의 일하는 방식을 지원하고 존중한다', '대표선출');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('이해-3', '이해관계자', '이해관계자 대표들이 그들의 책임에 부합하게 팀을 돕는다 ', '이해관계자 대표들은 적절한 방법으로 의사결정에 참여하고, 피드백을 제공한다', '이해관계자 대표들은 그들이 대표하는 그룹에 영향을 주는 변화에 대해 즉각적으로 의사소통한다', 
    '작업참여');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CARD_TITLE)
 Values
   ('이해-4', '이해관계자', '이해관계자 대표들은 새로운 시스템의 다음 배포를 위한 최소한의 기대수준에 합의한다', '이해관계자 대표들은 작업에 참여하는 것에 만족한다', '이해관계자 대표들은 자신들의 인풋이 팀에 의해 평가받는것에 합의한다', 
    '팀원들은 자신들의 인풋이 이해관계자 대표들에 의해 평가받는것에 합의한다', '이해관계자 대표들은 서로 다른 우선 순위와 관점들을 팀의 명확한 방향성을 제시하기 위해 균형을 맞추는 방안에 합의한다.', '배포기준 합의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CARD_TITLE)
 Values
   ('이해-5', '이해관계자', '이해관계자 대표들은 시스템에 대해 본인들이 대표하는 그룹의 관점으로 피드백을 제공한다', '이해관계자 대표들은 시스템이 배포 준비가 되었다고 합의한 것을 확인한다', '배포합의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CARD_TITLE)
 Values
   ('이해-6', '이해관계자', '이해관계자들이 새로운 시스템을 사용하고 그들의 경험에 대한 피드백을 제공한다', '이해관계자들이 새로운 시스템이 그들의 기대 수준에 부합한다고 확인한다', '사용만족');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('기회-1', '기회', '작업방식에 대한 개선 방안, 시장 점유율 향상 방안, 신규 혹은 향상된 소프트웨어 시스템 적용 등을 위한 아이디어가 식별된다', '최소한 한명 이상의 이해관계자가 소개된 아이디어와 관련된 기회와 그 가치에 대해 더 알기 위해 투자 하기를 원한다', '그 기회를 공유할 다른 이해관계자들이 식별된다', 
    '기회식별');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CARD_TITLE)
 Values
   ('기회-2', '기회', '기회 및 제안 솔루션에 관련된 이해관계자들이 식별된다', '기회를 생성할 이해관계자들의 니즈가 인정된다', '근본적인 문제와 근본 원인들이 식별된다', 
    '소프트웨어 기반의 솔루션이 필요하다는 것이 확인된다', '적어도 한 개의 소프트웨어 기반의 솔루션이 제안된다', '솔루션 필요성 확인');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CARD_TITLE)
 Values
   ('기회-3', '기회', '기회를 해결함으로써 얻는 가치가 절대적 기준, 이익 창출 기준 혹은 기간 대비 절약 기준 등 관점에서 양으로 측정이 된다', '이해관계자들에게 미치는 솔루션의 영향이 인지된다', '자금을 제공하고, 소프트웨어 시스템을 이용하는 이해관계자들에게 소프트웨어 시스템이 주는 가치가 인정된다', 
    '소프트웨어 시스템의 개발을 평가할 성공 기준이 명확해진다', '솔루션에 요구되는 바람직한 결과물이 명확해지고 정량화된다.', '솔루션 가치 확인');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('기회-4', '기회', '솔루션의 윤곽이 잡힌다', '솔루션이 일정 제약 조건 내에서 개발 가능하고 배포 가능하다는 징후가 보인다', '솔루션과 관계된 위험이 수용가능하고 관리 가능하다', 
    '솔루션의 (예산 안에 있는) 직접적인 비용이 기회로 부터 창출이 예상되는 가치보다 적다', '소프트웨어 기반 솔루션 개발에 대한 이유를 팀원들이 이해한다', '기회를 추구함이 실행 가능하다는 것이 명확하다', '솔루션 타당성 검증');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('기회-5', '기회', '기회를 명확히 해결해 주는 시스템이 사용 가능하다', '이해관계자들은 사용 가능한 솔루션이 배포할 가치가 있음에 대해 합의한다', '이해관계자들은 솔루션이 기회를 해결하는데 대해 만족한다', 
    '솔루션 개발');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CARD_TITLE)
 Values
   ('기회-6', '기회', '이해관계자들을 위한 이익이 창출되도록 솔루션을 사용하기 시작한다', '투자 수익률은 적어도 예상했던 것 만큼은 좋다', '이익 발생');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('요구사항-1', '요구사항', '초기의 이해관계자들이 시스템 개발에 합의한다', '새로운 시스템을 사용할 이해관계자들이 식별된다', '새로운 시스템의 초기 작업에 펀딩할 이해관계자가 식별된다', 
    '새로운 시스템의 도입으로 해결되는 기회가 명확하다', '개념 정의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CHECK8, 
    CHECK9, CARD_TITLE)
 Values
   ('요구사항-2', '요구사항', '새로운 시스템 개발에 참여하는 이해관계자들이 식별된다', '이해관계자들은 새로운 시스템의 목적에 대해 합의한다', '새로운 시스템에 대한 성공이 무엇인지 명확하다', 
    '이해관계자들은 제안된 솔루션의 범위에 대해 공감한다', '요구사항을 설명하는 방식이 합의된다', '요구사항을 관리하는 메커니즘이 준비되어 있다', '우선순위 스키마가 명확하다', '제약 사항이 식별되고 고려되어 진다', 
    '가정이 명시된다', '범위 정의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CHECK8, 
    CHECK9, CARD_TITLE)
 Values
   ('요구사항-3', '요구사항', '요구사항들이 수집되고 팀과 이해관계자들에게 공유 된다', '요구사항들의 원천이 명확하다', '요구사항들의 근거가 명확하다', 
    '상충되는 요구사항들이 식별되고 처리된다', '요구사항들이 개발해야할 시스템의 본질적인 특성을 설명해준다', '시스템의 중요한 사용 시나리오 대부분이 설명될 수 있다', '요구사항들의 우선순위가 명확하다', '요구사항들에 대한 구현 영향도가 이해되어 진다', 
    '팀은 무엇이 개발되어야 하는 지를 이해하고 그것을 개발하는 것에 대해 합의한다', '요건정의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CARD_TITLE)
 Values
   ('요구사항-4', '요구사항', '이해 관계자들은 요구사항들이 수용 가능한 솔루션을 묘사하고 있다는데 동의한다', '합의된 요구사항들에 대한 변경률이 상대적으로 낮고 관리 가능하다', '요구사항들을 구현함으로써 제공되는 가치가 명확하다', 
    '요구사항들에 의해 만족되어지는 기회의 범위가 명확하다', '요구사항들은 테스트가 가능하다', '요건합의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('요구사항-5', '요구사항', '이해관계자들이 목표 시스템을 위한 충분한 요구사항이 구현되었다는 것을 수용한다', '이해관계자들이 시스템이 무엇을 하고 무엇을 하지 말아야 할지 정확하게 반영하고 있는 요구사항들을 수용한다', '구현된 요구사항 아이템 세트가 이해관계자들에게 명확한 가치를 제공한다', 
    '이해관계자들이 요구사항들을 구현한 시스템이 운영할 만한 가치가 있다는 것을 수용한다', '요건구현');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('요구사항-6', '요구사항', '새로운 시스템을 위한 니즈를 모두 만족 시키기 위해 그들에 어떤 것이 필요한지 정확하게 요구사항들을 포착했다는데 대해 이해관계자들이 수용한다', '요구사항들이 완전히 만족된다는 것을 부인할 만한 주요한 요구사항이 남아 있지 않다', '시스템이 요구사항들을 모두 만족시킨다고 이해관계자들이 수용한다', 
    '니즈충족');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CARD_TITLE)
 Values
   ('소프트웨어시스템-1', '소프트웨어시스템', '아키텍처를 선택 시 사용할 기준에 합의한다', '하드웨어 플랫폼이 확인된다', '프로그래밍 언어 및 기술이 선택된다', 
    '시스템 바운더리가 공지된다', '시스템 구성에 대한 주요한 의사결정이 이루어진다', '구매, 개발과 재사용에 대한 의사결정이 이루어진다', '주요 기술 위험이 합의된다', '아키텍처 선정');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('소프트웨어시스템-2', '소프트웨어시스템', '주요 아키텍처 특성들이 입증된다', '시스템이 실행 가능하고 그 성능이 측정될 수 있다', '주요한 하드웨어 컨피그레이션이 입증된다', 
    '주요한 인터페이스가 입증된다', '기존 시스템들과의 통합이 입증된다', '관련된 이해관계자들이 입증된 아키텍처가 적당하다고 합의한다', '아키텍처 검증');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CARD_TITLE)
 Values
   ('소프트웨어시스템-3', '소프트웨어시스템', '시스템이 그것을 사용할 이해관계자들에 의해 운영 가능하다', '시스템이 제공하는 기능들은 테스트 되었다', '이해관계자들이 시스템의 성능을 수용한다', 
    '이해관계자들이 결함 레벨을 수용한다', '시스템에 대해 모든 문서화가 완료된다', '출시되는 컨텐츠가 공지된다', '시스템이 제공하는 부가적인 가치가 명확하다', '사용 가능');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('소프트웨어시스템-4', '소프트웨어시스템', '설치 관련 문서 및 기타 사용자 문서가 준비된다', '이해관계자 대표들은 시스템이 목적에 부합한다는 것을 수용한다', '이해관계자 대표들은 시스템이 가동되는 것을 바란다', 
    '운영을 위한 지원이 준비된다', '배포준비');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('소프트웨어시스템-5', '소프트웨어시스템', '시스템을 사용하기로한 이해관계자들에게 해당 시스템이 제공된다', '적어도 시스템의 한 개 사용 예가 완전히 작동한다', '시스템이 서비스 레벨에 부합할 수 있도록 완전히 지원된다', 
    '운영');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('소프트웨어시스템-6', '소프트웨어시스템', '시스템이 교체되거나 사용 중단된다', '시스템을 더 이상 지원하지 않는다', '시스템을 더 이상 사용하는 공식적인 이해 관계자가 없다', 
    '시스템 업데이트가 더 이상 지원되지 않는다', '운영 종료');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CHECK8, 
    CHECK9, CHECK10, CHECK11, CARD_TITLE)
 Values
   ('팀-1', '팀', '기회 및 결과 관점으로 팀의 미션이 정의된다', '팀 운영의 제약 사항이 공지된다', '팀을 성장시킬 메커니즘이 준비된다', 
    '팀의 구성요소가 정의된다', '작업을 어디서, 어떻게 수행할 것인지에 대한 제약 사항들이 정의된다', '팀의 책임들이 설명된다', '팀의 책무 레벨이 명확하다', '필요한 역량이 확인된다', 
    '팀의 크기가 결정된다', '거버넌스 룰이 정의된다', '리더십 모델이 선정된다', '팀요건 정의');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CHECK8, 
    CHECK9, CHECK10, CARD_TITLE)
 Values
   ('팀-2', '팀', '개개인의 책임이 인지된다', '작업 진행이 가능할 수 있을 만큼 충분한 팀원이 채용된다', '각각의 팀원은 팀이 어떻게 조직되며 각 개인의 역할이 무엇인지 이해한다', 
    '모든 팀원은 작업을 어떻게 수행할 지 이해한다', '팀의 멤버들이 서로 만나고 (아마도 가상으로) 서로를 알아가기 시작한다', '팀원들이 그들의 책임을 이해하고, 그들의 능력을 어떻게 조화롭게 균형을 맞출지 이해한다', '팀원들은 작업을 수용한다', '외부 협업자들(조직, 팀 그리고 개인)이 식별된다', 
    '팀의 커뮤니케이션 메커니즘이 정의된다', '각 팀원은 정의된대로 팀의 작업을 수행한다', '팀구성');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('팀-3', '팀', '팀은 하나의 유기적 단위로 작업을 한다', '의사소통은 열려 있으며 정직하다', '팀은 팀의 미션 달성에 집중한다', 
    '팀원들은 서로에 대해 잘 안다', '팀빌딩');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CARD_TITLE)
 Values
   ('팀-4', '팀', '팀은 팀의 책무를 일관되게 준수한다', '팀은 변화하는 상황에 지속적으로 적응한다', '팀은 외부의 도움 없이 문제를 식별하고 해결한다', 
    '백 트레킹과 재작업을 최소화하며 효과적으로 일을 진행시킨다', '낭비 작업과 향후 낭비가 될 잠재적 작업들을 지속적으로 제거해나간다', '작업수행');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('팀-5', '팀', '팀의 책임이 완료되거나 다른 곳에 넘겨진다', '팀의 멤버들이 다른 팀에 할당될 수 있다', '미션을 완성하기 위해 더 이상 팀의 노력이 필요하지 않다', 
    '팀해산');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CARD_TITLE)
 Values
   ('작업-1', '작업', '착수되는 작업에 요구되는 결과가 명확하다', '작업 수행의 제약 사항들이 명확히 식별된다', '자금을 제공할 이해관계자들이 확인된다', 
    '작업 개시자가 명확하게 공지된다', '결과를 수용할 이해관계자가 확인된다', '자금의 원천이 명확하다', '작업 우선순위가 명확하다', '과업확정');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CHECK8, 
    CHECK9, CHECK10, CHECK11, CHECK12, CARD_TITLE)
 Values
   ('작업-2', '작업', '책무가 확정된다', '작업의 비용과 노력(일의 강도)이 추정된다', '사용 가능한 자원이 확인된다', 
    '거버넌스 정책과 절차가 명확하다', '노출되는 위험이 확인된다', '인수 기준이 정의되고 고객에 의해 합의된다', '일을 생산적으로 수행하기 충분할 만큼의 크기로 작업이 세분화된다', '팀과 이해관계자들이 타스크를 식별하고 우선순위를 정한다', 
    '신뢰할 수 있는 계획이 준비된다', '작업을 시작하기 위한 펀딩이 준비된다', '팀 또는 적어도 팀원들 중 일부가 작업을 시작할 수 있도록 준비가 되어 있다', '통합 및 전달 시점이 정의된다', '사전준비');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('작업-3', '작업', '개발 작업이 시작된다', '작업 진행이 모니터링 된다', '작업이 작업 완료에 대한 명확한 정의와 함께 수행 가능한 항목으로 상세화된다', 
    '팀원들은 작업 항목을 수용하고 타스크를 수행한다', '작업시작');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CHECK7, CARD_TITLE)
 Values
   ('작업-4', '작업', '타스크가 완료된다', '계획되지 않은 일은 통제된다', '위험이 발생하거나 발생될 개연성은 수용할 수 있는 수준으로 감소되어 있어 위험이 그 영향도 측면으로 통제된다', 
    '팀의 성과 반영을 위해 측정 척도가 수정된다', '작업 진행과 속도를 보여주기 위한 측정이 가능하다', '재작업은 통제 된다', '타스크는 예상한대로 일관성 있게 제시간에 완료된다', '작업진행');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('작업-5', '작업', '남아 있는 모든 타스크들은 행정적인 관리이거나 다음 작업 준비와 관련된 것이다. (즉, 행정적인 관리 업무 및 다음 작업 준비 업무를 제외하고는 모두 타스크가 완료되었다)', '작업 결과가 달성 된다', '이해관계자(들)이 소프트웨어 시스템의 결과를 수용한다', 
    '목표달성');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('작업-6', '작업', '교훈이 아이템화되고 기록되고 토의된다', '측정 방법이 사용가능하다', '관련된 모든 문서들을 저장한다', 
    '예산 결산을 하고 예산이 회수된다', '팀이 해산된다', '더 이상 남아 있거나 완성되지 못한 타스크는 존재하지 않는다', '작업종료');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('작업방식-1', '작업방식', '팀에 의해 원칙과 제약 사항이 수립된다', '이해관계자들이 원칙과 제약 사항을 합의한다', '작업을 위해 필요한 툴과 그와 관련된 이해관계자들이 합의된다 ', 
    '수행 방안에 대한 추천이 유효하다', '팀의 작업 환경이 확인된다', '프렉티스와 툴에 대한 선택, 구매 및 사용에 적용할 제약조건이 공지된다', '원칙 수립');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('작업방식-2', '작업방식', '작업방식의 기초를 이룰 주요한 프랙티스 및 툴이 선택된다', '작업을 시작하기 위한 충분한 프랙티스가 팀에 의해 합의된다', '협상이 안되는 모든 프랙티스와 툴들이 식별된다', 
    '사용 가능한 프랙티스와 툴들이 분석되고,  둘 간에 존재하는 갭이 분석되고 인지된다', '원하는 작업방식을 수행하기 위해 필요한 능력과 실제 팀의 능력 수준의 갭이 분석되고 인지된다', '선택한 프랙티스와 툴들을 사용 가능한 작업방식 수립을 위해 통합한다', '작업방식 확정');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CHECK5, CHECK6, CARD_TITLE)
 Values
   ('작업방식-3', '작업방식', '프랙티스와 툴들이 실제 작업을 수행을 위해 사용되고 있다', '선택된 툴과 프랙티스의 사용이 정기적으로 점검되고 있다', '프랙티스와 툴들을 팀의 상황에 맞도록 적응시키고 있다', 
    '팀이 프랙티스와 툴의 사용을 지원한다', '팀의 작업방식에 대한 피드백을 처리할 수 있는 절차가 준비되어 있다', '프랙티스와 툴들은 팀의 커뮤니케이션과 협업을 지원한다', '시범적용');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CARD_TITLE)
 Values
   ('작업방식-4', '작업방식', '팀 전체가 작업 수행을 위해서 프랙티스와 툴들을 사용하고 있다', '모든 팀의 멤버가 작업 수행을 위해 필요한 프랙티스와 툴들에 접근한다', '팀 전체가 작업방식의 검사 및 채택에 관여한다', 
    '전체적용');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CHECK3, 
    CHECK4, CARD_TITLE)
 Values
   ('작업방식-5', '작업방식', '팀원들은 계획한 대로 자신들의 현재 상황에 맞도록 작업방식을 사용하고 적용해 나가고 있다', '팀은 별다른 생각 없이도 프랙티스를 자연스럽게 적용한다', '툴이 자연스럽게 팀이 일하는 방식을 지원한다', 
    '팀이 지속적으로 프랙티스와 툴의 사용을 조율한다', '작업방식 내재화');
Insert into SCOTT.CPP_MILESTONE_CARD_INFO
   (CARD_NO, CARD_GROUP, CHECK1, CHECK2, CARD_TITLE)
 Values
   ('작업방식-6', '작업방식', '팀의 작업방식이 더 이상 사용되지 않는다', '교훈이 미래의 사용을 위해 공유된다', '사용종료');
COMMIT;



-- 12. 마일스톤 보드
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



-- 13. 마일스톤 보드 카드
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
