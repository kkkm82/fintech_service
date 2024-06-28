#동일 명령어 - 스키마 새로 만듦(이름 중복되면 안 됨)
create schema testdb;
create database testdb2; 

#조건 달아서 스키마 만듦 - 한 번 더 실행할 경우 이미 중복이 돼서 주의 모양 뜸 --> 스키마 새로 만들기 X, 그래도 오류 나진 않음
create database if not exists testdb3;
create schema if not exists testdb3;
#동일 명령어 - 스키마 삭제
drop database testdb;
drop schema testdb2;
drop database if exists testdb;

#엑셀 파일 같은
create database if not exists mywork;

#테이블 만들 때 자료형 선택의 고려사항 - 데이터의 종류와 크기, 저장 공간, 성능, 인덱싱, 날짜와 시간 데이터, 확장성

#마이워크 활성화 --> 굵은 글씨로 바뀜
use mywork;
show tables;
select * from student_info;

#콘솔 창에서 데이터 입력 가능

drop table student_info;
drop table if exists student_info;

/* 
식별자 명명 규칙
식별자 : 데이터베이스 이름, 테이블 이름, 컬럼명
1. 최대길이 : 64
2. 사용 가능 문자 : 0-9, 영문자, 한글, $, _, 
3. 예약어(create, database, avg, show) X
4. 대소문자 구분(window는 관계 X), linux, unix는 대소문자 구분

컬럼 생성시 주의사항
1. 한 테이블에 최대 4,096개까지 컬럼 만들 수 있음
2. 한 테이블에서 같은 컬럼명 사용 X
3. 
*/

#SQL을 사용해서 테이블 만들기 create table
use world;
select * from test_db; #오류남 --> test_db가 없을 뿐더러 world 데이터베이스를 사용하고 있어서 애초에 안 됨

use mywork;
create table highschool_students
( 
  student_no varchar(20),
  student_name varchar(100),
  grade		   tinyint,
  class		   varchar(50),
  gender	   varchar(20),
  age		   smallint,
  enter_date   date
);
 
#생성한 테이블의 구조를 출력 describe, desc
describe highschool_students;
desc highschool_students;

#제약조건 넣어서 만들기 - null, not null
create table highschool_students2
( 
  student_no varchar(20) not null, #제약조건엔 , X --> 한 컬럼 내에서는 콤마 안 들어감
  student_name varchar(100) not null,
  grade		   tinyint null,
  class		   varchar(50) null,
  gender	   varchar(20) null,
  age		   smallint null,
  enter_date   date
);
describe highschool_students2;
drop table highschool_students;

#기본키를 포함해서 만들기 : pk(primary key)
create table highschool_students
( 
  student_no varchar(20) not null primary key,
  student_name varchar(100) not null,
  grade		   tinyint null,
  class		   varchar(50) null,
  gender	   varchar(20) null,
  age		   smallint null,
  enter_date   date
);
desc highschool_students;
drop table highschool_students;

create table highschool_students
( 
  student_no varchar(20) not null,
  student_name varchar(100) not null,
  grade		   tinyint null,
  class		   varchar(50) null,
  gender	   varchar(20) null,
  age		   smallint null,
  enter_date   date,
  primary key(student_no) #따로 빼서 코드 써도 됨
);
desc highschool_students;
drop table highschool_students;

#constraint primary key로 설정
create table highschool_students
( 
  student_no varchar(20) not null,
  student_name varchar(100) not null,
  grade		   tinyint null,
  class		   varchar(50) null,
  gender	   varchar(20) null,
  age		   smallint null,
  enter_date   date,
  constraint primary key(student_no) #해당 제약 조건에 이름 설정
);

#기본키 삭제 (alter - 만들어진 데이터베이스나 테이블을 수정할 때 사용하는 명령어)
alter table highschool_students drop primary key;
desc highschool_students;

#기본키 추가 (add)
alter table highschool_students add primary key(student_no);
desc highschool_students;

/* 기본키 생성시 주의사항
1. 한 테이블에서 기본키는 1개만 생성
2. 1개 이상의 컬럼으로 기본키 생성할 수 있음
3. 기본키 컬럼에는 not null 적용
*/




















