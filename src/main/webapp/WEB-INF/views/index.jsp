<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const signIn = () => {
          location.href='/member/save';
        }
        const logIn = () => {
            location.href='/member/login';
        }
        const findAllBoard = () => {
            location.href='/board/findAll';
        }
    </script>
</head>
<body>
    <h2> index 페이지</h2>
    <div class="container text-center">

    <button class="btn btn-outline-success" onclick="signIn()">회원가입</button>
    <button class="btn btn-outline-success" onclick="logIn()">로그인</button>
    <button class="btn btn-outline-success" onclick="findAllBoard()">글목록</button>
    </div>

</body>

</html>
