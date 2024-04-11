
drop table tblTodo;

create table tblTodo(
    seq number primary key,                 --번호
    todo varchar2(100) not null,            --할일
    state char(1) default 'n' not null,     --완료
    regdate date default sysdate not null   --등록일
);

create sequence seqTodo;

select * from tblTodo;

select a.* from (select * from tblTodo where state = 'n' order by seq desc) a
union
select b.* from (select * from tblTodo where state = 'y' order by seq desc) b;

delete from tblTodo;

update tblTodo set state = 'y' where seq in(23, 24);


insert into tblTodo values(seqTodo.nextVal, '할일', default, default);

select seqTodo.currVal from dual;
commit;