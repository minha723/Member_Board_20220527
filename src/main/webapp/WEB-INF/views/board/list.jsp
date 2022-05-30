<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>board.list.jsp</h2>

<div class="container">
    <form action="/board/search" method="get">
        <select name="searchType">
            <option value="boardTitle">제목</option>
            <option value="boardWriter">작성자</option>
        </select>
        <input type="text" name="q" placeholder="검색어입력...">
        <input type="submit" value="검색">
    </form>

</div>

<div class="container">
    <table class="table table-hover">
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>글제목</th>
            <th>작성시간</th>
            <th>조회수</th>
        </tr>

        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>  ${board.id} </td>
                <td>  ${board.boardWriter}</td>
                <td><a href="/board/detail?id=${board.id}">${board.boardTitle}</a></td>
                <td> <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${board.boardCreatedDate}"></fmt:formatDate> </td>
                <td> <span class="badge bg-primary rounded-pill">${board.boardHits} </span></td>
            </tr>
        </c:forEach>

    </table>
</div>

<div class="container">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${paging.page<=1}">
                <li class="page-item disabled">
                    <a class="page-link">[이전]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/findAll?page=${paging.page-1}">[이전]</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.page}">
                    <li class="page-item active">
                        <a class="page-link">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/findAll?page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.page>=paging.maxPage}">
                <li class="page-item disabled">
                    <a class="page-link">[다음]</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="/board/paging?page=${paging.page+1}">[다음]</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>


<br>
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
