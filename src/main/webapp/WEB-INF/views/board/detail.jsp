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
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

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

<div class="container mt-5">
    <c:choose>
        <c:when test="${sessionScope.loginId != null}">
            <div id="comment-write" class="input-group mb-3">
                <div class="form-floating">
                    <input type="text" id="commentWriter" class="form-control" value="${sessionScope.loginMemberId}"
                           readonly>
                    <label for="commentWriter">작성자</label>
                </div>
                <div class="form-floating">
                    <input type="text" id="commentContents" class="form-control" placeholder="내용">
                    <label for="commentContents">내용</label>
                </div>
                <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
            </div>
        </c:when>
        <c:otherwise>
            <div class="input-group">
                <p>로그인 후 댓글 작성이 가능합니다.</p> &nbsp;
            </div>
        </c:otherwise>
    </c:choose>

    <div id="comment-list">
        <table class="table">
            <tr>
                <th>댓글번호</th>
                <th>작성자</th>
                <th>내용</th>
                <th>작성시간</th>
                <th>삭제</th>
            </tr>
            <c:forEach items="${commentList}" var="comment">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.commentWriter}</td>
                    <td>${comment.commentContents}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
                                        value="${comment.commentCreatedDate}"></fmt:formatDate></td>
                    <c:choose>
                        <c:when test="${sessionScope.loginMemberId eq 'admin'}">
                            <td><a href="/comment/delete?id=${comment.id}">삭제</a></td>
                        </c:when>
                        <c:when test="${sessionScope.loginMemberId eq comment.commentWriter}">
                            <td><a href="/comment/delete?id=${comment.id}&boardId=${boardDetail.id}">삭제</a></td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </table>
    </div>

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


    $("#comment-write-btn").click(function () {
        const cWriter = document.getElementById("commentWriter").value;
        const cContents = $("#commentContents").val();
        const boardId = '${boardDetail.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": cWriter,
                "commentContents": cContents,
                "boardId": boardId,
            },
            dataType: "json",
            success: function (result) {

                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th>";
                output += "<th>삭제</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + result[i].commentCreatedDate + "</td>";
                    if ('${sessionScope.loginMemberId}' == 'admin') {
                        output += "<td><a href='/comment/delete?id=" + result[i].id +
                            "&boardId=" + result[i].boardId + "'>" + "삭제</a></td>";
                    } else if (result[i].commentWriter == '${sessionScope.loginMemberId}') {
                        output += "<td><a href='/comment/delete?id=" + result[i].id +
                            "&boardId=" + result[i].boardId + "'>" + "삭제</a></td>";
                    } else {
                        output += "<td></td>";
                    }
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentContents').value = '';
            },
            error: function () {
                alert("오타 체크");
            }
        });
    });

</script>
</html>
