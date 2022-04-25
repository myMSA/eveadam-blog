-- CREATE board TABLE

DROP TABLE board CASCADE CONSTRAINTS;

CREATE TABLE board (
    board_subject  VARCHAR2(100),
    password       VARCHAR2(128) NOT NULL,
    regdate        DATE DEFAULT sysdate
);

ALTER TABLE board ADD CONSTRAINT pk_board PRIMARY KEY ( board_subject );

-- CREATE article TABLE

DROP TABLE article CASCADE CONSTRAINTS;

CREATE TABLE article (
    article_id     NUMBER,
    board_subject  VARCHAR2(100) NOT NULL,
    title          VARCHAR2(100) NOT NULL,
    name           VARCHAR2(20) NOT NULL,
    content        CLOB NOT NULL,
    regdate        DATE DEFAULT sysdate,
    readcount      NUMBER DEFAULT 0,
    password       VARCHAR2(128) NOT NULL
);

ALTER TABLE article ADD CONSTRAINT pk_article PRIMARY KEY ( article_id );

ALTER TABLE article
    ADD CONSTRAINT fk_article FOREIGN KEY ( board_subject )
        REFERENCES board ( board_subject );

DROP SEQUENCE article_id_seq;

CREATE SEQUENCE article_id_seq;

-- create reply table

DROP TABLE reply CASCADE CONSTRAINTS;

CREATE TABLE reply (
    reply_id    NUMBER,
    article_id  NUMBER,
    name        VARCHAR2(20) NOT NULL,
    content     CLOB NOT NULL,
    regdate     DATE DEFAULT sysdate,
    answeryn    NUMBER DEFAULT 0
);

ALTER TABLE reply ADD CONSTRAINT pk_reply PRIMARY KEY ( reply_id );

ALTER TABLE reply
    ADD CONSTRAINT fk_reply FOREIGN KEY ( article_id )
        REFERENCES article ( article_id );

DROP SEQUENCE reply_id_seq;

CREATE SEQUENCE reply_id_seq;

-- create member table
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member (
    member_id  NUMBER,
    kakao_id   NUMBER,
    email      VARCHAR2(20),
    nickname   VARCHAR2(20) NOT NULL
);

DROP SEQUENCE member_id_seq;

CREATE SEQUENCE member_id_seq;
