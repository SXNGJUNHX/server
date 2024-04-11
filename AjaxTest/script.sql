--설문 조사
create table tblSurvey(
    seq number primary key,         -- 번호(pk)
    question varchar2(300) not null,-- 질문
    item1 varchar2(300) not null,   -- 항목1
    item2 varchar2(300) not null,   -- 항목2
    item3 varchar2(300) not null,   -- 항목3
    item4 varchar2(300) not null,   -- 항목4
    cnt1 number default 0 not null, -- 선택1
    cnt2 number default 0 not null, -- 선택2
    cnt3 number default 0 not null, -- 선택3
    cnt4 number default 0 not null  -- 선택4
);

select * from tblUser;

insert into tblSurvey values(1, '가장 자신있는 프로그래밍 언어는?', 'JAVA', 'Python', 'C#', 'C++', default, default, default, default);

select * from tblSurvey;

update tblSurvey 
set cnt1 = 8,
    cnt2 = 6,
    cnt3 = 2,
    cnt4 = 5
        where seq = 1;

commit;

create table zipcode  (
   seq                  NUMBER(10)                        not null,
   zipcode              VARCHAR2(50),
   sido                 VARCHAR2(50),
   gugun                VARCHAR2(50),
   dong                 VARCHAR2(50),
   bunji                VARCHAR2(50),
   constraint PK_ZIPCODE primary key (seq)
);

--고양이 좌표
create table tblCat(
    catid varchar2(50) primary key,
    x number not null,
    y number not null

);

select * from tblCat;
select max(to_number(substr(catid,4))) from tblCat;

select * from zipcode;
select count(*) from zipcode;






drop table tblAddress;
create table tblAddress(
    seq number primary key,         --PK
    name varchar(30) not null,      --이름
    age number(3) not null,         --나이
    gender char(1) not null,        --성별
    address varchar2(300) not null  --주소
);

create sequence seqAddress;

select * from tblAddress;






