<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-30
  Time: 오전 9:32
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

<div class="py-5 container text-center">
    <form action="/board/update" method="post" name="updateForm">
        <input type="hidden" class="form-control mb-2" name="id" value="${board.id}" readonly>
        글제목
        <input type="text" class="form-control mb-2" name="boardTitle" value="${board.boardTitle}">
        작성자
        <input type="text" class="form-control mb-2"name="boardWriter" value="${board.boardWriter}" readonly>
        글비밀번호
        <input type="text" class="form-control mb-2" id="passwordConfirm" name="boardPassword">
        글내용
        <textarea name="boardContents"  class="form-control mb-2" cols="30" rows="10">${board.boardContents}</textarea>
        <input type="button" onclick="update()" class="btn btn-primary" value="수정">
    </form>
</div>
</body>
<script>
    const update = () => {
        const pwConfirm = document.getElementById("passwordConfirm").value;
        const pwDB = '${member.memberPassword}';
        if(pwDB == pwConfirm){
            updateForm.submit();
        }else {
            alert("비밀번호 확인이 필요합니다.");
        }
    }
</script>
</html>
