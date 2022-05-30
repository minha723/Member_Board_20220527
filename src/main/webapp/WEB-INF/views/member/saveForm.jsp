<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <style>
        span{
            font-size: small;
        }
    </style>
</head>
<body>
    <h2>saveForm</h2>
    <div class="container text-center">
        <form action="/member/save" method="post" enctype="multipart/form-data">
            아이디: <input class="form-control" type="text" onblur="duplicateCheck()" id="memberId" name="memberId" placeholder="memberId"><br>
            <span id="dup-check-result"></span><br>
            비밀번호: <input class="form-control mb-0" type="text" onblur="regExpPw()" id="memberPassword" name="memberPassword" placeholder="memberPassword"><br>
            <span id="pw-exp-check-result"></span><br>
            이름: <input class="form-control" type="text" name="memberName" placeholder="memberName"><br>
            이메일: <input class="form-control" type="text" name="memberEmail" placeholder="memberEmail"><br>
            전화번호: <input class="form-control mb-0" type="text" onblur="regExpMo()" id="memberMobile" name="memberMobile" placeholder="memberMobile"><br>
            <span id="mo-exp-check-result"></span><br>
            프로필사진: <input type="file" name="memberFile" class="form-control mb-3">
            <input type="submit" class="btn btn-primary" value="회원가입">
        </form>
    </div>
</body>

<script>
    const duplicateCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("dup-check-result");
        $.ajax({
            type: "post", // http request method
            url: "/member/duplicate-check", // 요청주소(컨트롤러 주소값)
            data: {"memberId": memberId}, //전송하는 파라미터
            dataType: "text", //리턴받을 데이터 형식
            success: function (result){
                if(result == "ok"){
                    checkResult.innerText = "사용 가능한 아이디";
                    checkResult.style.color = "green";
                } else {
                    checkResult.innerText = "이미 사용중인 아이디";
                    checkResult.style.color = "red";
                }
            }, error: function (){
                alert("오타체크");
            }
        })
    }

    const regExpPw = () => {
      let memberPassword = document.getElementById("memberPassword").value;
      const pwExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
      const checkResult = document.getElementById("pw-exp-check-result");
      if(!pwExp.test(memberPassword)){
          checkResult.innerText = "최소 8 자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 입력";
          checkResult.style.color = "red";
        } else{
          checkResult.innerText = "";
      }
    }

    const regExpMo = () => {
        let memberMobile = document.getElementById("memberMobile").value;
        const moExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
        const checkResult = document.getElementById("mo-exp-check-result");
        if(!moExp.test(memberMobile)){
            checkResult.innerText = "전화번호 형식을 확이해주세요";
            checkResult.style.color = "red";
        } else{
            checkResult.innerText = "";
        }
    }
</script>
</html>
