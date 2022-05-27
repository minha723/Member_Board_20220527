<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>detail.jsp</h2>
<table class="table">
    <tr>
        <th>id</th>
        <th>memberId</th>
        <th>memberPassword</th>
        <th>memberName</th>
        <th>memberEmail</th>
        <th>memberMobile</th>
        <th>memberFile</th>
        <th>삭제</th>
    </tr>
    <tr>
        <td> ${member.id} </td>
        <td> ${member.memberId} </td>
        <td> ${member.memberPassword}</td>
        <td> ${member.memberName}</td>
        <td> ${member.memberEmail}</td>
        <td> ${member.memberMobile}</td>
        <td><img src="${pageContext.request.contextPath}/upload/${member.memberFileName}"
                 alt="" height="100" width="100"></td>
        <td><a href="/member/delete?id=${member.id}">삭제</a></td>
    </tr>
</table>

</body>
</html>
