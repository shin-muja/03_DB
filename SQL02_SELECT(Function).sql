/* 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른
 * 순으로 표시하는 SQL 문장을 작성하시오.( 단, 헤더는 "학번", "이름", "입학년도" 가
 * 표시되도록 한다.)
 */

SELECT STUDENT_NO 학번, STUDENT_NAME 이름, TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

/* 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 한 명 있다고 한다. 그 교수의
 * 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이 때 올바르게 작성한
 * SQL 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
 */

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';

/* 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출ㄹ겨하는 SQL 문장을 작성하시오.
 * 단 이때 나이가 적은 사람에서 많은 사람순서로 화면에 출력되도록 만드시오. ( 단, 교수 중
 * 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 한다. 나이는 '만'으로 계산한다.
 */

SELECT PROFESSOR_NAME 교수이름,
FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(19 || SUBSTR(PROFESSOR_SSN, 1, 6), 'YYYYMMDD')) / 12) 나이
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = 1
ORDER BY 2, 1;

/* 4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL 문장을 작성하시오.
 * 출력헤더는 "이름"이 찍히도록 한다 ( 성이 2자인 경우의 교수는 없다고 가정)
 */

SELECT SUBSTR(PROFESSOR_NAME, 2, LENGTH(PROFESSOR_NAME)) 이름
FROM TB_PROFESSOR;

/* 5. 춘 기술대학교의 재수생 입학자를 구하려고 한다. 어떻게 찾아내야하는가
 * 19살에 입학하면 재수를 하지 않은 것으로 간주한다.
 */

SELECT STUDENT_NO, STUDENT_NAME,STUDENT_SSN, ENTRANCE_DATE 
FROM TB_STUDENT
WHERE TO_CHAR(ENTRANCE_DATE, 'YYYY') -  (19||SUBSTR(STUDENT_SSN, 1, 2)) + 1 <= 20;
-- 예제 방식은 어떤 식인지 모르겠지만 우리나라 나이 계산 식으로 진행함
-- 재수 없는 과정으로 주민번호 년도에 에서 19만 더하면 재수 하지 않는 나이

/* 6. 2020년 크리스마스는 무슨 요일인가 */

SELECT TO_CHAR(TO_DATE('2020-12-25'), 'DY')|| '요일' "크리스마스 요일"
FROM DUAL;

/* 7. 2099/10/11, 2049/10/11      |       1999/10/11, 2049/10/11
 */

SELECT TO_DATE('99/10/11', 'YY/MM/DD') ㄱ, TO_DATE('49/10/11', 'YY/MM/DD') ㄴ,
TO_DATE('99/10/11', 'RR/MM/DD') ㄷ, TO_DATE('49/10/11', 'RR/MM/DD') ㄹㄴ
FROM DUAL;

/* 8. 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다. 2000녀도
 * 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오
 */

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%'; -- 52 줄


/* 9. 학번이 A517178 인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성
 * 단, 이때 출력화면의 헤더는 평점 이라고 작성 점수는 반올림 하여 소수점 이하 한자리까지
 */

SELECT ROUND(AVG(POINT), 1) 평점
FROM TB_GRADE TG
LEFT JOIN TB_STUDENT TS ON ( TG.STUDENT_NO = TS.STUDENT_NO )
WHERE STUDENT_NAME = '한아름'
GROUP BY TG.STUDENT_NO; -- 1개 행

/* 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)"의 형태로 헤더를 만들어 결과 값이
 * 출력되도록 하시오
 */



SELECT * FROM TB_DEPARTMENT;		-- 학과 TB_DEPARTMENT
SELECT * FROM TB_STUDENT;			-- 학생 TB_STUDENT * 휴학생인 경우 ABSENCE_YN 이 ‘Y”
SELECT * FROM TB_CLASS;				-- 과목 TB_CLASS
SELECT * FROM TB_CLASS_PROFESSOR;	-- 과목 교수 TB_CLASS_PROFESSOR
SELECT * FROM TB_PROFESSOR;			-- 교수 TB_PROFESSOR
SELECT * FROM TB_GRADE;				-- 성적 TB_GRADE
















