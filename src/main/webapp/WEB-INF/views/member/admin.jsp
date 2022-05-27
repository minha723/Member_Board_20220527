<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        const findAll = () => {
          location.href='/member/findAll';
        }
    </script>
</head>
<body>
<h2>admin. jsp</h2>

<button onclick="findAll()">회원 목록 보기</button>

</body>
</html>
