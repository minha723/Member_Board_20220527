<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<header>
    <h1 class="visually-hidden">Robyn's Website</h1>

    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                <span class="fs-4">Robyn's Blackboard</span>
            </a>

            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">Home</a></li>
                <li class="nav-item"><a href="/board/save" class="nav-link">글쓰기</a></li>
                <li class="nav-item"><a href="/board/findAll" class="nav-link">글목록</a></li>
                <c:choose>
                    <c:when test="${sessionScope.loginId != null}">
                    <li class="nav-item"><a href="/member/logout" class="nav-link">로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a href="/member/login" class="nav-link">로그인</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </header>
    </div>

    <div class="b-example-divider"></div>

</header>
</body>
</html>
