CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999  
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
); 

select memono, grpno, indent, ansnum, refnum
from memo
order by grpno desc, ansnum

alter table memo
add (grpno number default 0,
	 indent number default 0,
	 ansnum number default 0)

delete from memo
where indent > 0

alter table memo
add (refnum number default 0)
	 
CREATE SEQUENCE memo_seq 
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 


-- create 
-- memo_seq.nextval: 일련번호 자동 생성하여 할당 
--                   (MySQL은 컬럼명을 명시하지 않음). 
-- sysdate: 현재 날짜와 시간(MySQL: now()) 
INSERT INTO memo(memono, title, content, wdate, grpno) 
VALUES(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate,
(select nvl(max(grpno),0)+1 from memo))
 
-- select list, 자주 읽는 메모 먼저 출력  
-- DESC: Descending, ASC: Ascending
SELECT memono, title, wdate, viewcnt, grpno,
indent, ansnum,  r
from(
	SELECT memono, title, wdate, viewcnt, grpno,
	indent,ansnum, rownum as r
from(
SELECT memono, title, wdate, viewcnt, grpno, indent, ansnum 
FROM memo  
ORDER BY grpno desc, ansnum ASC  
)
)where r>=3 and r<=5
--read
select memono, title, content, 
to_char(wdate,'yyyy-mm-dd') wdate, viewcnt 
from memo 
where memono = 1

--update
update MEMO
set 
title = '변경',
content = '내용변경'
where memono=1

--delete
delete from memo



