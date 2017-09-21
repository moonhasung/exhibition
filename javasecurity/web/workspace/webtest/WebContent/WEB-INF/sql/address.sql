drop table address

create table address(
	addressnum 	number 			not null,
	name 		varchar(30) 	not null,
	phone		varchar(30) 	not null,
	zipcode		varchar(7) 		not null,
	address1	varchar(300)	not null,
	address2	varchar(300)	null,
	
	primary key(addressnum)	
)

alter table address
add (refnum number default 0)

delete from address
where indent > 0

select addressnum, name, grpno, indent, ansnum, refnum
from bbs
order by grpno desc, ansnum

alter table address
add (grpno number default 0,
	 indent number default 0,
	 ansnum number default 0)

alter table address
add (filename varchar(50) default 'member.jpg')

delete from address



--primary key
select NVL(max(addressnum),0)+1 from address

--read
select * from address 

--create
insert into address(addressnum,name,phone,zipcode,address1,address2,grpno) 
values (address_seq.nextval, '날두','010-1111-1111','12345','스페인','바르셀로나',
(select nvl(max(grpno),0)+1 from address))

--update
update address
set
phone='333-3333-3333',
zipcode='12345',
address1='서울시이',
address2='서대문구우'
where addressnum=1

--delete
delete from address where addressnum = 1

--list
select addressnum,name,phone,grpno,indent,ansnum,filename, r
from(
	select addressnum,name,phone,grpno,indent,ansnum,filename, rownum as r 
	from(
		select addressnum,name,phone,grpno,indent,ansnum,filename
		from address
		order by grpno desc, ansnum asc
)
)where r>=1 and r<=3
select * from address
--insert 구문
insert into address(addressnum,name,phone,zipcode,address1,address2,grpno,indent,ansnum,filename)
values ((select NVL(max(addressnum),0)+1 from address),
'김','123','123','123','123','123','123','123','member.jpg')

drop table address

select ansnum from address

select * from address
