drop table bbs2

CREATE TABLE bbs2(
  bbsno   NUMBER(7)     NOT NULL,   
  wname   VARCHAR(20)   NOT NULL,  
  title   VARCHAR(100)  NOT NULL,   
  content VARCHAR(4000) NOT NULL,  
  passwd  VARCHAR(15)   NOT NULL,  
 
  PRIMARY KEY (bbsno)  
) ;


SELECT NVL(MAX(bbsno),0)+1 as bbsno FROM	bbs;

      
--create
insert into bbs2(bbsno,wname,title,content,passwd)
values((select nvl(max(bbsno),0) + 1 from address),
'쿠크다스','오늘은 남아서 자습','dd','1234');
--list
select addressnum, name 
from address
order by addressnum desc
--read
select * from bbs2 
where teamno = 1
--update
update bbs2
set
name = '쿠엔크',
title = '게시판 완성',
content ='유익한 시간'
where bbsno = 1