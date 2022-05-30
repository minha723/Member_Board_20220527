<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const signIn = () => {
            location.href = '/member/save';
        }
        const logIn = () => {
            location.href = '/member/login';
        }
        const findAllBoard = () => {
            location.href = '/board/findAll';
        }
    </script>
</head>
<body>

<jsp:include page="./layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">

    <c:choose>
        <c:when test="${sessionScope.loginId != null}">
            <button class="btn btn-outline-primary" onclick="findAllBoard()">글목록</button>
            <button class="btn btn-outline-primary" onclick="myPage()">마이페이지</button>
        </c:when>
        <c:otherwise>
            <button class="btn btn-outline-success" onclick="signIn()">회원가입</button>
            <button class="btn btn-outline-success" onclick="logIn()">로그인</button>
            <button class="btn btn-outline-success" onclick="findAllBoard()">글목록</button>
        </c:otherwise>
    </c:choose>
</div>

</body>
<script>
    const myPage = () => {
        location.href = "/member/update";
    }
</script>
</html>
