# DAMOVIE Web Page Project
- DAMOVIE Web Page는 영화통합예매사이트 프로젝트 입니다.
- 서브관리자로 각 회사의 영화관 정보를 저장해서 예매 정보를 출력합니다.
- 출력한 예매정보를 토대로 예매를 진행합니다.

> ![image](https://user-images.githubusercontent.com/57380730/91267230-e543b680-e7ad-11ea-9897-8be3a38e9be1.png)
> ![image](https://user-images.githubusercontent.com/57380730/91267270-f8ef1d00-e7ad-11ea-92e4-ee06ac905dbc.png)

## 테스트 환경
>  <pre><code>Eclipse IDE + Tomcat 9V + Java 1.6V + Maven 4.0V</code></pre>
>  <pre><code>Spring Framwork 4.1.1 Release + Tiles 2.2.2V + Mybatis 3.1V</code></pre>
>  <pre><code>JDBC 18.1V + Oracle Database 18c</code></pre>

## 기능
- 예매하기(영화,영화관,날짜,인원 선택)
- 예매하기(좌석 선택 및 최종 예약)
- 개봉된 영화 정보(클릭시 해당 영화정보 및 리뷰 표시)
- 별점 및 리뷰
- 서브관리자(회사,영화관,시간,좌석 정보 추가)
- 서브관리자(정보 수정 및 삭제)
- 메인 관리자(회원 관리)
- 마이 페이지(예약 정보 확인, 정보 수정 , 개인정보수정, 탈퇴)

## 실행하기

 1. 프로젝트 다운

 2. Database 생성

 3. 프로젝트에 포함되어 있는 damovie.sql 파일로 테이블 만들기 및 기본 자료 넣기

 4. 본인 버전에 맞는 jdbc 설치
 
 5. WEB-INF > config > jdbc > jdbc.properties 파일 본인 정보에 맞게 수정
 
 6. 실행
 
 8. 메인페이지 접속(http://localhost:8080/damovie/main.do) 
