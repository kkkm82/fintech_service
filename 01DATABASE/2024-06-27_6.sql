/*
sql 함수
sql 함수 작동방법
select 함숫(값)
*/

#절댓값
select abs(1), abs(-1);

#문자열 길이 측정 : length(문자열);
select length('mysql');

#반올림 함수 round()
select round(3.124567,2);

#숫자형 함수 +, -, *, /, %(나머지), mod(나머지), div(몫만 반환)
select 9 mod 2;
select 13 / 3;

#올림 : ceil, 내림 : floor
select ceil(4.5);
select floor(4.5);

#제곱, 루트(제곱근), 음수양수 확인
select power(4, 3);
select sqrt(3);
select sign(25); #양수면 1, 0이면 0, 음수면 -1 반환alter

# round(값, 자릿수) : 반올림
select round(3.123456,2); #자릿수 지정 안 하면 소수점 없음

#truncate() : 버림
select truncate(2.1224, 3);

#문자형 함수
#문자의 길이를 알아보는 함수
select char_length('sql'), length('sql'), char_length('홍길동'), length('홍길동'); #length는 문자열의 바이트 수 반환

#문자 연결하는 함수
select concat('this', 'is', 'MySQL') as concat1; #공백 X
select concat('this', 'nulll', 'MySQL') as concat1; #증긴에 null이 있으면 null이 됨
select concat_ws(':', 'this', 'is', 'MySQL'); #첫 번째 매개변수를 구분자로 사용

#대문자 > 소문자, 소문자 > 대문자
select lower('afbaSDDSSFDgb');
select upper('afbaSDDSSFDgb');

#문자열의 자릿수를 일정하게 하고 빈공간을 지정한 문자로 채우기
select rpad('sql', 7, '#'); 
select lpad('sql', 7, '#');

#공백을 없애는 함수
select ltrim('         sql        ');
select rtrim('         sql        ');

#문자열 공백 삭제하는 함수
select trim('         sql        ');
select trim(leading '*' from '****mysql****'); #문자열 앞쪽의 *을 없앰
select trim(trailing '*' from '****mysql****'); #문자열 뒷쪽의 *을 없앰
select trim(both '*' from '****mysql****'); #문자열 양쪽의 *을 없앰

#문자열을 잘라내는 함수
select left('ThisIsMySQL', 4);
select right('ThisIsMySQL', 4);

#문자열의 중간에서 잘라내는 함수 
select substr('this is mysql', 6, 2);
select substr('this is mysql', 6); #길이 부분 생략하면 시작위치 이후 모두

#날짜형 함수
select curdate(); #현재 년월일
select curtime(); #현재 시간
select now(); #curdate + curtime --> 현재 년월일 + 현재 시분초
select current_timestamp(); # = now 함수

#요일 표시 함수 : dayname(날짜)
select dayname(now());

#몇 번째 일인지 : dayofweek(날짜) 일월화수목금토 --> 1~7
select dayofweek(now());

#1년 중 오늘이 오늘이 몇일째인지 : dayofyear(날짜) 
select dayofyear(now());

#날짜 세분화해서 보는 함수
#현재 달의 마지막 날이 몇 일까지 있는지 출력
select last_day(now());
select last_day('2023-02-10');

#입력한 날짜에서 연도만 추출
select year(now());

#입력한 날짜에서 달만 추출
select month(now());

#입력한 날짜의 분기 추출
select quarter(now());

#입력한 날짜의 주차 추출
select weekofyear(now());

#날짜와 시간이 같이 있는 데이터에서 날짜 따로 시간 따로 구분해 주는 함수
select date('2024-06-27 17:23:30');
select time('2024-06-27 17:23:30');

#날짜를 지정한 일 수만큼 더하는 함수 : date_add(날짜, interval 더할 일 수 day) --> 시간까지 같이 출력 
select date_add(now(), interval 5 day);
select adddate(now(), 5);

#날짜를 지정한 일 수만큼 뺴는 함수 : date_sub(날짜, interval 뺄 일 수 day) --> 시간까지 같이 출력 
select date_sub(now(), interval 5 day);
select subdate(now(), 5);

#날짜와 시간을 연월, 날시간, 분초 단위로 추출하는 함수
#extract(옵션, from 날짜시간)
select extract(year_month from now());
select extract(day_hour from '2024-06-27 17:35:30');
select extract(minute_second from '2024-06-27 17:30:35');
select extract(minute_second from now());

#날짜 1에서 날짜 2를 뺸 일수를 반환 : datediff(날짜1, 날짜2)
select datediff(now(), '2024-06-25');

/*
날짜 포맷 함수 지정한 형식에 맞춰서 출력해 주는 함수
%Y : 4자리 연도, %y : 2자리 연도
%m : 2자리 월 표시, %M : 월의 영문 표기, %b : 월의 축약 영문표기(Jan)
%d : 2자리 일 표기, %e : 1자리 일 표기
*/
select date_format(now(), '%d-%b-%Y');
select date_format(now(), '%Y-%b-%d');
select date_format('2024-06-01', '%Y-%M-%e');

/*
시간 포맷
%H : 24시간 표기, %h : 12시간 표기, %p : AM, PM 표시
%i : 2자리 분 표기
%S : 2자리 초 
%T : 24시간 표기법, 시:분:초
%r : 12시간 표기법, 시:분:초, AM/PM
%W : 요일의 영문 표기, %w : 숫자로 요일 표시
*/


















































