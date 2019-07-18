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
	-- �Խ��ǹ�ȣ
	boardNo int(50) NOT NULL,
	userId varchar(50) NOT NULL,
	subject varchar(30),
	content varchar(1000),
	-- �������� : 1
	-- 1:1 ��� :  0
	type int(10),
	-- 0:������
	-- 1.�亯��
	reflevel int(10),
	-- �������
	regDate datetime,
	-- ��ȸ��
	cnt int(1000),
	PRIMARY KEY (boardNo)
);


CREATE TABLE buyerInfo
(
	-- �ֹ���ȣ
	buyNo int(1000) NOT NULL AUTO_INCREMENT,
	userId varchar(50) NOT NULL,
	-- �޴� �� �̸�
	recipientName varchar(30),
	-- �޴��� �ּ�
	recipientAddress varchar(100),
	-- �޴��� �޴�����ȣ
	recipientPhoneNum int(1000),
	-- �ֹ�����
	orderDate datetime,
	-- ����������
	deliveryDate datetime,
	-- �ֹ� ����
	-- ����Ȯ��
	-- ��ǰ�غ���
	-- ����Ȯ��
	-- ȯ�ҽ�û
	-- ȯ��Ȯ��
	status varchar(500),
	PRIMARY KEY (buyNo)
);


CREATE TABLE cart
(
	no int(10) NOT NULL AUTO_INCREMENT,
	userId varchar(50) NOT NULL,
	menuNo int(100) NOT NULL,
	menuName varchar(50),
	-- ����
	quantity int(100),
	-- �޴�����
	price int(1000),
	-- ������ �޴� ����
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
	-- ����̸�
	ingreName varchar(50),
	-- �����
	currentAmount int(1000),
	-- ����
	unit varchar(10),
	price int(1000),
	-- �԰�����
	dateReceipt datetime,
	PRIMARY KEY (ingreNo)
);


CREATE TABLE ingrePerMenu
(
	ingreNo int(1000) NOT NULL,
	menuNo int(100) NOT NULL,
	-- �⺻������� �ƴ���
	-- �⺻��� : 1
	-- �ƴϸ� : 0
	ifMain int(10),
	one int(1000),
	two int(1000),
	-- �⺻��
	amount int(100),
	three int(1000),
	four int(1000),
	PRIMARY KEY (ingreNo, menuNo)
);


CREATE TABLE menu
(
	menuNo int(100) NOT NULL AUTO_INCREMENT,
	menuName varchar(50) NOT NULL,
	-- �⺻�ݾ�
	mprice int(50),
	-- ��ǰ���� + ������
	content varchar(1000),
	category varchar(30),
	-- ����
	star double,
	-- ���� �̹���
	img varchar(50),
	PRIMARY KEY (menuNo)
);


CREATE TABLE orderMenu
(
	no int(1000) NOT NULL AUTO_INCREMENT,
	menuNo int(100) NOT NULL,
	-- �ֹ���ȣ
	buyNo int(1000) NOT NULL,
	-- Ŀ���͸���¡ �Է¾�
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
	-- 1: ����
	-- 2: ���
	-- 
	fnt varchar(100),
	PRIMARY KEY (no)
);


CREATE TABLE review
(
	-- ��ȣ
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



