CREATE TABLE admin (
	acode varchar2(10) CONSTRAINT admin_acode_pk PRIMARY KEY, 
	aid varchar2(15) NULL,      
	pass varchar2(20) NULL,     
	ename varchar2(10) NULL,   
	tel varchar2(30) NULL,   
	adel varchar2(1)  NULL     
);

CREATE TABLE notice (
    acode CONSTRAINT notice_acode_fk REFERENCES admin(acode), 
	ncode varchar2(20) NULL,   
	nsubject varchar2(100) NULL,     
	ndate varchar2(12) NULL,    
	ncontent varchar2(3000) NULL    
);

CREATE TABLE member (
	mcode varchar2(10) CONSTRAINT member_mcode_pk PRIMARY KEY, 
	scode varchar2(10) NOT NULL, 
	mid varchar2(15) NULL,    
	mpass varchar2(20) NULL,   
	mname varchar2(10) NULL,  
	resinum varchar2(14) NULL, 
	tel varchar2(30) NULL,    
	addr varchar2(50) NULL,   
	join varchar2(14) NULL,   
	mdel varchar2(1)  NULL    
);

CREATE TABLE review (
	mcode varchar2(10) CONSTRAINT review_mcode_fk REFERENCES member(mcode),
	rcode  varchar2(20)   NULL,    
	rdate varchar2(12)   NULL,   
	rcontent varchar2(3000) NULL,   
	rsubject varchar2(100)  NULL,  
	rwriter varchar2(50)   NULL,  
	pcode varchar2(10)   NULL 
);

CREATE TABLE product (
	pcode varchar2(10) CONSTRAINT product_pcode_pk PRIMARY KEY,
	scode varchar2(10)   NOT NULL, 
	pname  varchar2(15)   NULL,   
	price  number(10)     NULL, 
	pcount  number(10)     NULL,  
	pimage  varchar2(200)  NULL,  
	pcon  varchar2(3000) NULL  
);

CREATE TABLE cart (
	pcode CONSTRAINT cart_pcode_fk REFERENCES product(pcode), 
	ccode  varchar2(20) CONSTRAINT cart_ccode_pk PRIMARY KEY,
	mcode CONSTRAINT cart_mcode_fk REFERENCES member(mcode), 
	ocount number(10)   NULL   
);


CREATE TABLE orders (
	pcode CONSTRAINT order_pcode_fk REFERENCES product(pcode), 
	mcode CONSTRAINT order_mcode_fk REFERENCES member(mcode) , 
	ocode  varchar2(20) CONSTRAINT order_ocode_pk PRIMARY KEY, 
	ocount number(10)   NULL,
	odel varchar2(1)  NULL, 
	oprice number(10)   NULL,
	odate varchar2(12) NULL  
);

select * from tab;

create sequence pdt_seq;

select * from PRODUCT;