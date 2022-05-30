<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>board/detail.jsp</h2>

<div class="container text-center">

    <div class="list-group">
        <h5 class="mb-1 border fw-bold">${boardDetail.boardTitle}</h5>
        <div class="d-flex border border-bottom-0 w-auto justify-content-between">
            <small>글번호: ${boardDetail.id}</small>
            <small>조회수: ${boardDetail.boardHits}</small>
        </div>
        <div class="border border-top-0 d-flex justify-content-between">
            <small> 작성시간: <fmt:formatDate value="${boardDetail.boardCreatedDate}"
                                          pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></small>
            <small> 작성자: ${boardDetail.boardWriter}</small>
        </div>
        <p class="mb-xl-2 border">
            <br>${boardDetail.boardContents}<br> &nbsp;
            <img src="${pageContext.request.contextPath}/upload/${boardDetail.boardFileName}" alt="" height="100"
                 width="100">
        </p>
    </div>
<button class="btn btn-outline-info" onclick="findAll()">목록</button>
    <c:if test="${sessionScope.loginMemberId eq boardDetail.boardWriter}">
        <button class="btn btn-outline-warning" onclick="boardUpdate()">수정</button>
        <button class="btn btn-outline-danger" onclick="boardDelete()">삭제</button>
    </c:if>
    <c:if test="${sessionScope.loginMemberId eq 'admin'}">
        <button class="btn btn-outline-danger" onclick="boardDelete()">삭제</button>
    </c:if>


</div>

</body>
<script>
    const findAll = () => {
        location.href = "/board/findAll";
    }
    const boardDelete = () => {
      location.href = "/board/delete?id=${boardDetail.id}";
    }

    const boardUpdate = () => {
      location.href = "/board/update?id=${boardDetail.id}&loginId=${sessionScope.loginId}";
    }

</script>
</html>
