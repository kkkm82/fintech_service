#06-27 복습 
create database testdb;
use testdb;
create table testtable (
  student_no int not null primary key, 
  student_name varchar(100) not null,
  grade tinyint,
  class varchar(50),
  gender varchar(20),
  age smallint,
  enter_date date
);
select * from testtable;

#생성한 테이블의 속성 조회
describe testtable;
desc testtable;

/*
테이블에 데이터를 입력 
insert into 테이블명 (컬럼명) values (값)
*/
insert into `testtable` 
(student_no, student_name, grade, class, gender, age, enter_date)
values (1, '홍길동', 1, '1반', '남자', 20, '2024-03-02');
select * from testtable;

insert into `testtable` 
(student_no, grade, class, student_name, gender, age, enter_date) #위와 컬럼명 순서 바꿈 : 오류 --> 데이터 타입이 맞지 않음
values (1, '홍길동', 1, '1반', '남자', 20, '2024-03-02');

insert into `testtable` 
(student_no, class, grade, student_name, gender, age, enter_date) #위와 컬럼명 순서 바꿈 : 오류 --> 데이터 타입이 맞지 않음
values (2, '1반', 1, '홍길동', '남자', 20, '2024-03-02'),
(3, '1반', 1, '홍길동', '남자', 20, '2024-03-02'),
(4, '1반', 1, '홍길동', '남자', 20, '2024-03-02'),
(5, '1반', 1, '홍길동', '남자', 20, '2024-03-02');
select * from testtable;

#날짜형 함수

#str_to_date('문자열', 출력 포맷) --> 문자열을 출력 포맷에 맞게 날짜로 변환
select str_to_date('21, 01, 2023', '%d, %m, %y');
select str_to_date('19:30:17', '%H:%i:%s');
select str_to_date('19:30:17', '%h:%i:%s'); #NULL 반환 --> 19시로 24시간 형태인데 식별자 %h는 12시간 형태이므로 변환 실패 

#sysdate() : 현재 날짜와 시간 반환
select sysdate(), sleep(2), sysdate();
select now(), sleep(2), now();
#now() 함수는 내가 실행한 시간만 출력, sysdate() 함수는 중간에 시간이 흐르면 시간 계산 후에 출력

#현재 날짜를 기준으로 현재 일이 속한 월의 마지막 날에 해당하는 요일을 구하는 쿼리
select dayname(last_day(now()));

#형 변환 함수
#char() : char 타입으로 변환 
#signed() : 정수형으로 변환
#decimal() : decimal(숫자형)으로 변환 
#double() : double 타입으로 변환 
#float() : float 타입으로 변환
#date() : date 타입으로 변환 
#datetime() : datetime 타입으로 변환

#CAST(값 as 변환할 데이터 타입)
select cast(10 as char);
select cast('-10' as signed);
select cast('10.1234' as decimal); #소수점 지정 안 하면 정수로 출력
select cast('10.1234' as decimal(6,4)); 
select cast('10.1234' as double);
select cast('10.1234' as float);
select cast('2024-04-28' as date);
select cast('2024-04-28' as datetime); #시간 별도로 명시 X --> 0시 0분 0초 반환

#CONVERT(값, 변환할 데이터 타입)
select convert(10, char);
select convert('-10', signed);
select convert('10.1234', decimal); #소수점 지정 안 하면 정수로 출력
select convert('10.1234', decimal(6,4)); 
select convert('10.1234', double);
select convert('10.1234', float);
select convert('2024-04-28', date);
select convert('2024-04-28', datetime);

#문제
#world의 country 테이블에서 인구가 4500만명에서 5500만명 사이에 있는 국가 조회
#출력하는 컬럼명 : code, name, continent, region, population
#concat 함수 사용해서 name(continent) 출력
use world;
select code, concat(name, '(', continent, ')') as country_continent, region, population from country 
where population between 45000000 and 55000000;

#CRUD 연습
use mywork;
create table emp_test
(
	emp_no int not null,
    emp_name varchar(30) not null,
    hire_date date null,
    salary int null,
    primary key(emp_no)
);

desc emp_test;

insert into `emp_test`
values (1001, '아인슈타인', '2021-01-01', 1000);

insert into `emp_test`
(emp_no, emp_name, hire_date)
values (1002, '뉴턴', '2021-01-01');

insert into `emp_test`
(hire_date, emp_no, emp_name)
values ('2021-01-01', 1003, '갈릴레이');

insert into `emp_test`
(emp_no, emp_name, hire_date, salary)
values (1004, '파인먼', '2021-01-10', 3000);

insert into `emp_test`
(emp_no, emp_name, hire_date, salary)
values (1005, '퀴리', '2021-03-01', 4000),
(1006, '호킹', '2021-03-05', 5000),
(1007, '패러데이', '2021-04-01', 2200),
(1008, '맥스웰', '2021-04-05', 3300),
(1009, '플랑크', '2021-04-05', 4400);
select * from emp_test;

#테이블 데이터 수정하기
/* update 테이블 set 컬럼1 = 값, 컬럼2 = 값 where 찾을 값 
--> where 지정 안 하면 컬럼에 있는 값이 다 바뀌기 때문에 조건 설정 무조건 해줘야 함 */

update emp_test
set salary = 50 where emp_no = 1002;
select * from emp_test;
#이름으로 하면 오류남 --> 이름 중복될 수 있어서 primary key가 아니면 update 안 되도록 막아놓음

#delete 문으로 데이터 삭제
#delete from 테이블 where 조건
#보통 권한 줄 때 select만 주고 나머진 X --> 실수하면 데이터 날라가기도 해서

#트랜잭션 처리하기
#autocommit 옵션 활성화 확인
#select @@autocommit 1 = 활성화, 0 = 비활성화
select @@autocommit;
set autocommit = 0;

select * from emp_test;
create table emp_tran1 as select * from emp_test; #테이블의 데이터까지 복제

select * from emp_tran1;
desc emp_tran1;
alter table emp_tran1 add constraint primary key(emp_no);

create table emp_tran2 as select * from emp_test;
select * from emp_tran2;
alter table emp_tran2 add constraint primary key(emp_no);
desc emp_tran2;

delete from emp_tran1;
select * from emp_tran1;
commit;
select * from emp_tran1;
rollback;
select * from emp_tran1;

















