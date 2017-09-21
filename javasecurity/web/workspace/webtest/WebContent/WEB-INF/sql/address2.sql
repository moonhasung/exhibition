select * from tab;
drop table address;
create table address(
	addressnum		number 			not null,
	name			varchar(30)		not null,
	phone			varchar(30)		not null,
	zipcode			varchar(7)  	not null,
	address1		varchar(300)	not null,
	address2		varchar(300) 	null,
	primary key(addressnum)
)  
--primary key
select nvl(max(addressnum),0) + 1 from address

--create
insert into address(addressnum,name,phone,zipcode,address1,address2)
values((select nvl(max(addressnum),0) + 1 from address),
'김길동','010-5555-7777','12345','서울시 종로구 관철동',
'코아빌딩 5층');

--read
select * from address
where addressnum= 1

--update
update address
set
phone = '333-3333-3333',
zipcode = '00000',
address1 = '서울시 강남구 서초동',
address2 = '12-1번지'
where addressnum = 1

--delete
delete from address
where addressnum = 1

--list
select addressnum, name 
from address
order by addressnum desc



