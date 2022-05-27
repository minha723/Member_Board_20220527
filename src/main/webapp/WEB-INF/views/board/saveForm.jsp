<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>board/saveForm.jsp</h2>

<div class="container text-center">
    <h2>글을 작성하세요</h2>
    <form action="/board/save" method="post" enctype="multipart/form-data">
        <input type="text" class="form-control mb-2" name="boardTitle" placeholder="boardTitle">
        <input type="text" class="form-control mb-2" name="boardWriter" placeholder="${sessionScope.loginMemberId}" readonly>
        <textarea class="form-control mb-2" name="boardContents" cols="5" rows="10">boardContents</textarea>
        첨부파일 <input type="file" name="boardFile">
        <input type="submit" class="btn btn-primary" value="작성">
    </form>
</div>
</body>
</html>
