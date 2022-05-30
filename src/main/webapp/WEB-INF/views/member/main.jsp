<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">
    <button class="btn btn-outline-primary" onclick="boardSave()">게시글 작성</button>
    <button class="btn btn-outline-primary" onclick="findAllBoard()">글목록</button>
    <button class="btn btn-outline-primary" onclick="myPage()">마이페이지</button>

    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-outline-primary" onclick="findMember()">회원목록</button>
    </c:if>

</div>

</body>
<script>
    const myPage = () => {
        location.href = "/member/update";
    }
    const findAllBoard = () => {
        location.href = '/board/findAll';
    }
    const findMember = () => {
        location.href = "/member/findAll";
    }
    const boardSave = () => {
        location.href = "/board/save";
    }
</script>
</html>
