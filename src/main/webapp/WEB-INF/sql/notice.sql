CREATE TABLE NOTICE(
NOTICENO    NUMBER(5)       NOT NULL    PRIMARY KEY,
TITLE       VARCHAR(100)    NOT NULL,
CONTENT     VARCHAR(2000)   NOT NULL,
WNAME       VARCHAR(50)     NOT NULL,
PASSWD      VARCHAR(10)     NOT NULL,
CNT         NUMBER(10)      DEFAULT 0,
RDATE       DATE            NOT NULL);

-- 등록
INSERT INTO NOTICE(noticeno, title, content, wname, passwd, cnt, rdate)
VALUES((SELECT nvl(MAX(NOTICENO),0) +1 FROM NOTICE),
'spring 시즌 접수 안내 1', '10% 할인 실시!', '왕눈이', '1234', 0, sysdate);
INSERT INTO notice(noticeno,title, content, wname, passwd, cnt, rdate)
VALUES((SELECT nvl(MAX(NOTICENO),0) +1 FROM NOTICE),
'spring 시즌 접수 안내 2', '10% 할인 실시!', '아로미', '1234', 0, sysdate);
INSERT INTO notice(noticeno, title, content, wname, passwd, cnt, rdate)
VALUES((SELECT nvl(MAX(NOTICENO),0) +1 FROM NOTICE),
'spring 시즌 접수 안내 3', '10% 할인 실시!', '투투투', '1234', 0, sysdate);

-- 목록
SELECT noticeno, title, content, wname, cnt, rdate, r
    FROM (
    select noticeno, tilte, content, wname, cnt, rdate, rownum r
    from(
	SELECT noticeno, title, content, wname,  cnt, rdate
	FROM notice

	wname like '%'||#{word}||'%'

ORDER BY noticeno DESC;
)where r >= #{1} and r <= #{5}

-- 조회
SELECT noticeno, title, content, wname, passwd, cnt, rdate
FROM notice
WHERE noticeno=1;

-- 조회수증가
UPDATE notice
SET cnt = cnt + 1
WHERE noticeno=1;

-- 수정
UPDATE notice
SET title='추가 공지', content='5% 추가 할인!', wname='아로미'
WHERE noticeno=1;

-- 패스워드 확인
SELECT COUNT(*) AS cnt
FROM notice
WHERE noticeno=1 AND passwd='1234';

-- 삭제
DELETE FROM notice
WHERE noticeno=3;
 
SELECT * FROM notice;