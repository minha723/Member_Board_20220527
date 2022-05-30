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
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>


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

<div class="container text-end">
    <button class="btn btn-outline-primary" onclick="hits()">조회순으로 목록보기</button>
</div>

<%--<div class="container text-end">--%>
<%--<form action="/board/viewNum" method="get">--%>
<%--    <select class="" name="viewNum" id="viewNum">--%>
<%--        <option value="3">3</option>--%>
<%--        <option value="5">5</option>--%>
<%--        <option value="7">7</option>--%>
<%--        <option value="10">10</option>--%>
<%--    </select>--%>
<%--</form>--%>
<%--</div>--%>


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
                <td> ${board.id} </td>
                <td> ${board.boardWriter}</td>
                <td><a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                    value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td><span class="badge bg-primary rounded-pill">${board.boardHits} </span></td>
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

<div class="container text-center">
    <c:choose>
        <c:when test="${sessionScope.loginMemberId eq 'admin'}">
            <button class="btn btn-outline-primary" onclick="save()">게시글 작성</button>
            <button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>
            <button class="btn btn-outline-primary" onclick="findMember()">회원목록</button>
        </c:when>
        <c:when test="${sessionScope.loginMemberId != null}">
            <button class="btn btn-outline-primary" onclick="save()">게시글 작성</button>
            <button class="btn btn-outline-primary" onclick="logOut()">로그아웃</button>
            <button class="btn btn-outline-primary" onclick="myPage()">마이페이지</button>
        </c:when>
        <c:otherwise>
            <button class="btn btn-outline-primary" onclick="logIn()">로그인</button>
        </c:otherwise>
    </c:choose>
</div>
</body>
<script>
    const save = () => {
        location.href = "/board/save";
    }
    const logOut = () => {
        location.href = "/member/logout";
    }
    const findMember = () => {
        location.href = "/member/findAll";
    }
    const myPage = () => {
        location.href = "/member/update";
    }
    const logIn = () => {
        location.href = "/member/login";
    }
    const hits = () => {
        location.href = "/board/findAllHits";
    }

</script>
</html>
