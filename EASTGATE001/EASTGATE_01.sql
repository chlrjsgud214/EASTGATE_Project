CREATE TABLE member (
	id varchar2(15) CONSTRAINT member_id_pk PRIMARY KEY,    
	password varchar2(20) NOT NULL,   
	name varchar2(50) NOT NULL,  
	tel varchar2(30) NOT NULL,    
	addr varchar2(255) NOT NULL,   
	email varchar2(40) NOT NULL,
    reg_date varchar2(15) NOT NULL,
	del varchar2(1)  NULL    
);

CREATE TABLE notice (
    id CONSTRAINT notice_id_fk REFERENCES member(id), 
	nnum NUMBER NOT NULL,   
	nsubject varchar2(100) NOT NULL,         
	ncontent varchar2(3000) NOT NULL,    
    ndate varchar2(15) NOT NULL,
    ncount NUMBER NOT NULL
);

drop table board;
CREATE TABLE board (
	id CONSTRAINT board_id_fk REFERENCES member(id), 
	num NUMBER NOT NULL,   
	subject varchar2(100) NOT NULL,         
	content varchar2(3000) NOT NULL,    
    bdate varchar2(15) NOT NULL,
    readcount NUMBER NOT NULL
);

CREATE TABLE product (
	pcode varchar2(10) CONSTRAINT product_pcode_pk PRIMARY KEY,
	pid CONSTRAINT product_pid_fk REFERENCES member(id),
	pname  varchar2(15)  NOT NULL,   
    image  varchar2(200)  NULL, 
	price  NUMBER    NOT NULL, 
	pcount  NUMBER    NOT NULL,  
	explain  varchar2(3000) NULL  
);

CREATE TABLE cart (
	pcode CONSTRAINT cart_pcode_fk REFERENCES product(pcode), 
	id CONSTRAINT cart_id_fk REFERENCES member(id), 
    pname  varchar2(15)  NOT NULL,   
    image  varchar2(200)  NULL, 
	price  NUMBER    NOT NULL,
	ocount NUMBER  NOT NULL   
);


CREATE TABLE orders (
	pcode CONSTRAINT order_pcode_fk REFERENCES product(pcode), 
	id CONSTRAINT orders_id_fk REFERENCES member(id),  
    pname  varchar2(15)  NOT NULL,   
    image  varchar2(200)  NULL, 
	price  NUMBER    NOT NULL,
	ocount NUMBER  NOT NULL,
    odate VARCHAR2(15) NOT NULL,
	odel varchar2(1) NOT NULL	 
);
