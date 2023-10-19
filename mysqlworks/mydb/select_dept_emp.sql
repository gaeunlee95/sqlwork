
SELECT * FROM department;
SELECT * FROM employee;
-- 삽입 오류 : 부서 테이블에 아이디가 30이 없어서 에러
INSERT INTO employee VALUES (106, '양신입', 25, null, 30);

-- 급여가 400만원 이상이고, 부서번호가 10인 사원을 검색하시오
SELECT * FROM employee
WHERE sal >= 4000000 AND deptid = 10;

-- 급여가 많은 순으로 정렬하시오.
SELECT * FROM employee
ORDER BY sal DESC;

-- 급여가 없는 사원을 검색하시오.
SELECT * FROM employee
WHERE sal is null;

-- 사원의 총인원을 구하시오.
SELECT COUNT(*) FROM employee;

-- 사원의 급여 총액과 급여 평균을 구하시오.
SELECT ROUND(SUM(sal), 0), ROUND(AVG(sal), 0) FROM employee;

-- 부서별 급여 총액을 구하시오.
SELECT deptid, 
       SUM(sal) 급여총액,
       ROUND(AVG(sal),-2) 급여평균
from employee
group by deptid;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오(조인)
SELECT b.*,
       a.deptname       
FROM  department a, employee b
WHERE a.deptid = b.deptid;

SELECT b.empid,
	   b.empname,
       b.age,
       b.sal,
       a.deptname,
       deptid
FROM  department a JOIN employee b
 USING(deptid);
 
 -- 부서별, 부서이름별 급여 총액
 SELECT a.deptid,
        a.deptname,
        sum(b.sal) 급여총액,
        round(avg(b.sal), -2) 급여평균
from department a join employee b
    on a.deptid = b.deptid
group by deptid, deptname;

-- 부서별, 부서 이름별 급여 소계, 총계
 SELECT a.deptid,
        a.deptname,
        sum(b.sal) 급여총액,
        round(avg(b.sal), -2) 급여평균
from department a join employee b
    on a.deptid = b.deptid
group by deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사원을 검색하시오.
SELECT * FROM employee
WHERE sal = (SELECT MAX(sal) FROM employee)
  OR sal = (SELECT MIN(sal) FROM employee);
  
-- '백두산' 사원의 급여를 430만원으로 수정하세요.
UPDATE employee SET sal = 4300000
WHERE empid = 102; -- 기본키로만 변경이 가능함
SELECT * FROM employee;

-- 사원의 급여 순위를 구하시오
SELECT empname,
       sal,
       rank() over(order by sal desc) 급여순위
from employee;
commit;
