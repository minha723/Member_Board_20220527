<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>board.list.jsp</h2>

${boardDTOList}

<a href="/board/save">게시글 작성</a>

<c:choose>
    <c:when test="${sessionScope.loginMemberId eq 'admin'}">
        <a href="/member/logout">로그아웃</a>
        <a href="/member/findAll">회원목록</a>
    </c:when>
    <c:otherwise>
        <a href="/member/logout">로그아웃</a>
        <a href="/member/update">마이페이지</a>
    </c:otherwise>
</c:choose>

</body>
</html>
