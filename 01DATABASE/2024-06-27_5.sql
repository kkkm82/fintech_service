use world; 
show tables;
desc city;
desc country;

select id, name from city;
select CountryCode, name, district, population, id from city; #순서 바뀐 그대로 출력
select * from mywork.highschool_students; #지금은 world 테이블 사용 중이라 mywork에 있는 테이블은 조회가 안되지만 앞에 명시해주면 O

select * from city where countrycode = 'KOR';
select * from city where countrycode = 'KOR' and district like 'k%';
select * from city where countrycode = 'KOR' and district in('seoul', 'kyonggi');
select * from country where population > 100000000;
select * from country where name = 'south korea';

select * from country where population between 45000000 and 55000000;

#박스 오피스 데이터 조회
use mywork;
desc box_office;
select * from box_office limit 5;
select * from box_office where release_date between '2018-01-01' and '2018-12-31' and rep_country like "한국";
select * from box_office where audience_num >= 10000000 and release_date like "%2019%"; 
select * from world.country where Population > 100000000 order by Population desc;
use world;
select * from country where Population >= 50000000 order by continent desc, region asc; #asc 생략해도 오름차순 정렬 O 

































