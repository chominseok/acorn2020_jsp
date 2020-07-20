--사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
	id VARCHAR2(100) primary key,
	pwd VARCHAR2(100) NOT NULL,
	email VARCHAR2(100),
	profile VARCHAR2(100),  --프로필 이미지 경로를 저장할 칼럼
	regdate DATE 
);

CREATE TABLE board_gallery(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	caption VARCHAR2(200),
	imagePath VARCHAR2(100),
	regdate DATE 
);

CREATE SEQUENCE board_gallery_seq;