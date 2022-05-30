<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<div class="container text-center">
    <form action="/member/login" method="post">
        <input type="text" class="form-control mb-2" name="memberId" placeholder="아이디">
        <input type="text" class="form-control mb-2" name="memberPassword" placeholder="비밀번호">
        <input class="btn btn-primary" type="submit" value="로그인">
        <input class="btn btn-primary" onclick="signUp()" value="회원가입">
    </form>
</div>
</body>
<script>
    const signUp = () => {
      location.href="/member/save";
    }
</script>
</html>
