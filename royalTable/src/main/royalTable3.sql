SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS orderMenuIngre;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS orderMenu;
DROP TABLE IF EXISTS buyerInfo;
DROP TABLE IF EXISTS cartMenuIngre;
DROP TABLE IF EXISTS cart;
DROP TABLE IF EXISTS ingrePerMenu;
DROP TABLE IF EXISTS ingre;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS point;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	-- 게시판번호
	boardNo int(50) NOT NULL,
	userId varchar(50) NOT NULL,
	subject varchar(30),
	content varchar(1000),
	-- 공지사항 : 1
	-- 1:1 상담 :  0
	type int(10),
	-- 0:질문자
	-- 1.답변자
	reflevel int(10),
	-- 등록일자
	regDate datetime,
	-- 조회수
	cnt int(1000),
	PRIMARY KEY (boardNo)
);


CREATE TABLE buyerInfo
(
	-- 주문번호
	buyNo int(1000) NOT NULL AUTO_INCREMENT,
	userId varchar(50) NOT NULL,
	-- 받는 자 이름
	recipientName varchar(30),
	-- 받는자 주소
	recipientAddress varchar(100),
	-- 받는자 휴대폰번호
	recipientPhoneNum int(1000),
	-- 주문일자
	orderDate datetime,
	-- 배송희망일자
	deliveryDate datetime,
	-- 주문 상태
	-- 결제확정
	-- 상품준비중
	-- 구매확정
	-- 환불신청
	-- 환불확정
	status varchar(500),
	PRIMARY KEY (buyNo)
);


CREATE TABLE cart
(
	no int(10) NOT NULL AUTO_INCREMENT,
	userId varchar(50) NOT NULL,
	menuNo int(100) NOT NULL,
	menuName varchar(50),
	-- 수량
	quantity int(100),
	-- 메뉴가격
	price int(1000),
	-- 선택한 메뉴 설명
	content varchar(1000),
	PRIMARY KEY (no)
);


CREATE TABLE cartMenuIngre
(
	no int(10) NOT NULL,
	menuNo int(100) NOT NULL,
	ingreName varchar(50),
	amount int(1000),
	price int(1000)
);


CREATE TABLE ingre
(
	ingreNo int(1000) NOT NULL,
	-- 재료이름
	ingreName varchar(50),
	-- 현재양
	currentAmount int(1000),
	-- 단위
	unit varchar(10),
	price int(1000),
	-- 입고일자
	dateReceipt datetime,
	PRIMARY KEY (ingreNo)
);


CREATE TABLE ingrePerMenu
(
	ingreNo int(1000) NOT NULL,
	menuNo int(100) NOT NULL,
	-- 기본재료인지 아닌지
	-- 기본재료 : 1
	-- 아니면 : 0
	ifMain int(10),
	one int(1000),
	two int(1000),
	-- 기본양
	amount int(100),
	three int(1000),
	four int(1000),
	PRIMARY KEY (ingreNo, menuNo)
);


CREATE TABLE menu
(
	menuNo int(100) NOT NULL AUTO_INCREMENT,
	menuName varchar(50) NOT NULL,
	-- 기본금액
	mprice int(50),
	-- 상품정보 + 레시피
	content varchar(1000),
	category varchar(30),
	-- 별점
	star double,
	-- 사진 이미지
	img varchar(50),
	PRIMARY KEY (menuNo)
);


CREATE TABLE orderMenu
(
	no int(1000) NOT NULL AUTO_INCREMENT,
	menuNo int(100) NOT NULL,
	-- 주문번호
	buyNo int(1000) NOT NULL,
	-- 커스터마이징 입력양
	amount int(1000),
	totPrice int(1000),
	PRIMARY KEY (no)
);


CREATE TABLE orderMenuIngre
(
	no int(1000) NOT NULL,
	menuName varchar(1000),
	ingreName varchar(200),
	amount int(1000),
	price int(1000)
);


CREATE TABLE point
(
	no int(1000) NOT NULL AUTO_INCREMENT,
	userId varchar(50) NOT NULL,
	content varchar(100) NOT NULL,
	point int(1000),
	-- 1: 적립
	-- 2: 사용
	-- 
	fnt varchar(100),
	PRIMARY KEY (no)
);


CREATE TABLE review
(
	-- 번호
	reviewNo int(100) NOT NULL,
	no int(1000) NOT NULL,
	menuNo int(100) NOT NULL,
	content varchar(100),
	star int(50),
	PRIMARY KEY (reviewNo)
);


CREATE TABLE user
(
	userId varchar(50) NOT NULL,
	password varchar(1000) NOT NULL,
	name varchar(50),
	phoneNum varchar(50),
	address varchar(50),
	email varchar(50),
	PRIMARY KEY (userId)
);



/* Create Foreign Keys */

ALTER TABLE orderMenu
	ADD FOREIGN KEY (buyNo)
	REFERENCES buyerInfo (buyNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cartMenuIngre
	ADD FOREIGN KEY (no)
	REFERENCES cart (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ingrePerMenu
	ADD FOREIGN KEY (ingreNo)
	REFERENCES ingre (ingreNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cart
	ADD FOREIGN KEY (menuNo)
	REFERENCES menu (menuNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE ingrePerMenu
	ADD FOREIGN KEY (menuNo)
	REFERENCES menu (menuNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderMenu
	ADD FOREIGN KEY (menuNo)
	REFERENCES menu (menuNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review
	ADD FOREIGN KEY (menuNo)
	REFERENCES menu (menuNo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE orderMenuIngre
	ADD FOREIGN KEY (no)
	REFERENCES orderMenu (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE review
	ADD FOREIGN KEY (no)
	REFERENCES orderMenu (no)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (userId)
	REFERENCES user (userId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buyerInfo
	ADD FOREIGN KEY (userId)
	REFERENCES user (userId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cart
	ADD FOREIGN KEY (userId)
	REFERENCES user (userId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE point
	ADD FOREIGN KEY (userId)
	REFERENCES user (userId)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



