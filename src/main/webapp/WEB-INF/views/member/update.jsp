<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 2:25
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

<div class="container">
    <div class="py-5 text-center">
        <form action="/member/update" method="post" name="updateForm">
            id: <input class="form-control mb-2" type="text" name="id" value="${updateMember.id}" readonly><br>
            memberId: <input class="form-control mb-2" type="text" name="memberId" value="${updateMember.memberId}" readonly><br>
            memberPassword: <input class="form-control mb-2" type="text" id="pwConfirm" name="memberPassword" placeholder="비밀번호를 입력하세요" ><br>
            memberName: <input class="form-control mb-2" type="text" name="memberName" value="${updateMember.memberName}" readonly><br>
            memberEmail: <input class="form-control mb-2" type="text" name="memberEmail" value="${updateMember.memberEmail}"><br>
            memberMobile: <input class="form-control mb-2" type="text" name="memberMobile" value="${updateMember.memberMobile}"><br>
            <input type="button" onclick="update()" class="btn btn-primary" value="정보수정">
            <input type="button" onclick="memberDelete()" class="btn btn-primary" value="회원탈퇴">
        </form>
    </div>
</div>
</body>
<script>
    const update = () => {
      const pwConfirm = document.getElementById("pwConfirm").value;
      const pwDB = '${updateMember.memberPassword}';
      if(pwConfirm == pwDB){
          updateForm.submit();
      }else {
          alert("비밀번호를 확인해주세요.")
      }
    }
    const memberDelete = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${updateMember.memberPassword}';
        if(pwConfirm == pwDB){
            location.href="/member/delete?id=${updateMember.id}";
        }else {
            alert("비밀번호를 확인해주세요.")
        }
    }
</script>
</html>
