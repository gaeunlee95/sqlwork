-- 조인 연습
-- product, product_review
SELECT * FROM product; --부모
SELECT * FROM product_review; --자식

-- 리뷰가 있는 상품의 정보를 검색하시오
-- 리뷰 테이블에 product_name 칼럼을 조인
SELECT a.review_no,
       b.product_code, 
       b.member_id, 
       a.product_name, 
       b.content
FROM product a, product_review b
WHERE a.product_code = b.product_code;

SELECT a.product_name, 
       b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(미국협회) 조인 - STANDARD JOIN(표준조인)
-- 내부조인(INNER JOIN ~ ON)
SELECT a.product_name, 
       b.*
FROM product a JOIN product_review b
ON a.product_code = b.product_code;

-- 외부조인(LEFT, RIGHT OUTER 조인)
-- 리뷰의 유무와 상관없이 모든 상품의 정보 출력
SELECT a.product_name, 
       b.*
FROM product a LEFT JOIN product_review b 
-- product_code가 겹치지 않아도, 왼쪽(product)은 다 나옴
  ON a.product_code = b.product_code;

-- 리뷰가 없는 상품을 검색하시오
SELECT a.product_name "상품후기가 없는 상품" 
FROM product a LEFT JOIN product_review b 
  ON a.product_code = b.product_code
WHERE b.content is null;

-- 상품 리뷰테이블에 product_name 칼럼 추가
-- 스칼라 서브쿼리 : 한 칼럼만 반환함, SELECT 절에서 사용
SELECT A.review_no,
       A.product_code,
       (SELECT B.product_name 
         FROM product B
         WHERE A.product_code = B.product_code)
         product_name,
       A.member_id,
       A.content
FROM product_review A;

