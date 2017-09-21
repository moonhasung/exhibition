--DDL
drop table team

create table team(
	teamno 		number 			not null,
	name 		varchar(30) 	not null,
	gender 		varchar(7)      not null,
	phone 		varchar(30)		not null,
	zipcode	    varchar(6)		null,
	address1    varchar(500)	null,
	address2 	varchar(100)	null,
	skill		varchar(300)	not null,
	hobby		varchar(100)	not null,
	filename	varchar(50)		default 'member.jpg',
	primary key(teamno)
	
	)	
--primary key생성
select NVL(max(teamno),0)+1 from team

--create
insert into address(addressnum,name,phone,zipcode,address1,address2)
values((select nvl(max(addressnum),0) + 1 from address),
'김길동','010-5555-7777','12345','서울시 종로구 관철동',
'코아빌딩 5층');
	
--read
select * from team where teamno = 1

--update
update team set 
phone = '000-0000-0000',
zipcode = '00000',
address1 = '주소변경',
address2 = '상세주소변경',
skill = 'java,jsp,MVC,spring',
hobby = '영화감상',
filename = 'member2.jpg'
where
teamno = 1

--delete
delete from team where teamno = 1

--list
select teamno,name,phone,skill, r
from (
	select teamno,name,phone,skill, rownum as r
	from(
		select teamno,name,phone,skill
		from team
		order by teamno desc
	)
)where r>= 3 and r <=5

