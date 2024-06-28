create database naver_db;
use naver_db;

alter table buy add foreign key(mem_id) references member(mem_id);

insert into `member` 
(mem_id, mem_name, mem_number, addr, phone1, phone2, height, debut_date)
values ('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015-10-19'),
('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016-08-08'),
('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015-01-15'),
('OMY', '오마이걸', 7, '서울', null, null, 160, '2015-04-21'),
('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007-08-02'),
('ITZ', '잇지', 5, '경남', null, null, 167, '2019-02-12'),
('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014-08-01'),
('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011-02-10'),
('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016-02-25'),
('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014-06-19');

insert into `buy`
(num, mem_id, prod_name, group_name, price, amount)
values (1, 'BLK', '지갑', null, 30, 2),
(2, 'BLK', '맥북프로', '디지털', 1000, 1),
(3, 'APN', '아이폰', '디지털', 200, 1),
(4, 'MMU', '아이폰', '디지털', 200, 5),
(5, 'BLK', '청바지', '패션', 50, 3),
(6, 'MMU', '에어팟', '디지털', 80, 10),
(7, 'GRL', '혼공SQL', '서적', 15, 5),
(8, 'APN', '혼공SQL', '서적', 15, 2),
(9, 'APN', '청바지', '패션', 50, 1),
(10, 'MMU', '지갑', null, 30, 1),
(11, 'APN', '혼공SQL', '서적', 15, 1),
(12, 'MMU', '지갑', null, 30, 4);

select * from member;
select * from buy;

select * from member as m inner join buy as j on m.mem_id = j.mem_id;
select * from member as m right join buy as j on m.mem_id = j.mem_id;

