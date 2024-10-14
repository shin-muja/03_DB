-- [Basic SELCET]
/* 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"
 * 으로 표시하도록 한다.
 */

SELECT DEPARTMENT_NAME "학과 명", CATEGORY 계열
FROM TB_DEPARTMENT; -- 63줄 성공

/* 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.
 * 
 * 국어국문학과의 정원은 20명 입니다.
 * 사학과의 정원은 28명 입니다 등등등
 */


SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' "학과별 정원"
FROM TB_DEPARTMENT; -- 63줄 성공

/* 3. "국어국문학과"에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
 * 들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DAPARTMENT)을 조회해서
 * 찾아 내도록 하자)
 */

SELECT STUDENT_NAME
FROM TB_STUDENT TS
LEFT JOIN TB_DEPARTMENT TD ON (TS.DEPARTMENT_NO = TD.DEPARTMENT_NO)
WHERE ABSENCE_YN = 'Y'
AND DEPARTMENT_NAME = '국어국문학과'
AND SUBSTR(STUDENT_SSN, 8, 1) IN (2, 4); -- 한수현 1명

/* 4. 도서관에서 대출 도서 장기연체자 들을 찾아 이름을 게시하고자 한다.
 * 그 대상자들의 학번이 다음과 같을 때 SQL구무을 작성하시오
 * 
 * A513079, A513090, A513091, A513110, A513119
 */

SELECT STUDENT_NAME
FROM TB_STUDENT TS
WHERE TS.STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

/* 5. 입학정원이 20 명 이상 30명 이하인 학과들의 학과 이름과 계열을 출력하시오 */

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30; -- 24 줄 성공

/* 6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다.
 * 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오
 */

SELECT PROFESSOR_NAME 
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL; -- 임해정

/* 7. 혹시 전산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 한다.*/

SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL; -- 없음

/* 8.수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
 * 과목들은 어떤 과목인지 과목 번호를 조회해보시오.
 */

SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL; -- 6줄

/* 9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회 해보시오*/

SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;

/* 10. 02학번 전주 거주자들의 모임을 만들려고 한다. 휴학한 사람들을 제외한
 * 재학중인 학생들의 학번, 이름, 주민 번호를 출력하는 구문을 작성하시오
 */

SELECT STUDENT_NO ,STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE TO_CHAR(ENTRANCE_DATE, 'YYYY') = 2002
AND STUDENT_ADDRESS LIKE '%전주%'
AND ABSENCE_YN = 'N'
ORDER BY STUDENT_NAME ; -- 11줄



SELECT * FROM TB_DEPARTMENT;		-- 학과 TB_DEPARTMENT
SELECT * FROM TB_STUDENT;			-- 학생 TB_STUDENT * 휴학생인 경우 ABSENCE_YN 이 ‘Y”
SELECT * FROM TB_CLASS;				-- 과목 TB_CLASS
SELECT * FROM TB_CLASS_PROFESSOR;	-- 과목 교수 TB_CLASS_PROFESSOR
SELECT * FROM TB_PROFESSOR;			-- 교수 TB_PROFESSOR
SELECT * FROM TB_GRADE;				-- 성적 TB_GRADE























