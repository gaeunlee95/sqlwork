--- 제2 정규화(음료, 주문테이블)

CREATE TABLE drink(
	drink_code   VARCHAR(3) PRIMARY KEY,  -- 음료 코드
    drink_name   VARCHAR(20) NOT NULL     -- 음료 이름
);

CREATE TABLE cafe_order(
	order_no  INT PRIMARY KEY auto_increment, -- 주문 번호
    drink_code VARCHAR(3) NOT NULL,           -- 음료 코드
    order_cnt INT NOT NULL,                   -- 주문 수량
    FOREIGN KEY(drink_code) references drink(drink_code)  -- 외래키
	on delete cascade -- 부모키의 데이터가 삭제되면 자식 데이터도 삭제됨
);

select * from drink;
select * from cafe_order;

-- 음료 테이블의 음료코드 'B01' 삭제
-- 주문 테이블의 'B01'도 자동 삭제됨
delete from drink where drink_code = 'B01';

-- 주문테이블에 음료이름을 포함하여 출력하세요
-- 동등조인(equi join : equal('=') 사용)
select b.order_no,
       b.drink_code,
       a.drink_name,
       b.order_cnt
from drink a, cafe_order b
where a.drink_code = b.drink_code;  -- 기본키 = 외래키

-- 내부조인(join ~ on)
select b.order_no,
       b.drink_code,
       a.drink_name,
       b.order_cnt
from drink a join cafe_order b
on a.drink_code = b.drink_code;

-- 외부조인(left, right join ~ on)
-- 주문에 관계없이 주문정보와 음료 정보는 모두 출력하세요.
select a.drink_code, 
       a.drink_name,
       b.order_no,
       b.order_cnt
from drink a left join cafe_order b
on a.drink_code = b.drink_code;

-- 주문이 없는 상품을 검색하시오
select a.drink_name "주문이 없는 상품"
from drink a left join cafe_order b
  on a.drink_code = b.drink_code
where b.order_no is null;

drop table cafe_order;

-- drink 자료 추가
insert into drink values ('A01', '아메리카노');
insert into drink values ('B01', '카페라떼');
insert into drink values ('C01', '허브차');

-- cafe_order 자료 추가
insert into cafe_order(drink_code, order_cnt) 
values ('A01', 3);
insert into cafe_order(drink_code, order_cnt) 
values ('B01', 1);
insert into cafe_order(drink_code, order_cnt) 
values ('A01', 2);




