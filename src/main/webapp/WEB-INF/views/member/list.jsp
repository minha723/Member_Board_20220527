<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<h2>memberList.jsp</h2>
<table class="table">
    <tr>
        <th>id</th>
        <th>memberId</th>
        <th>memberName</th>
    </tr>

    <c:forEach var="member" items="${memberList}">
        <tr>
            <td> ${member.id} </td>
            <td><a href="/member/detail?id=${member.id}"> ${member.memberId} </a></td>
            <td> ${member.memberName}</td>
        </tr>
    </c:forEach>

</table>

</body>
</html>
