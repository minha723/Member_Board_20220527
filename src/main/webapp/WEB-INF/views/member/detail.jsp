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
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</head>
<body>
<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<table class="table">
    <tr>
        <th>id</th>
        <th>memberId</th>
        <th>memberPassword</th>
        <th>memberName</th>
        <th>memberEmail</th>
        <th>memberMobile</th>
        <th>memberFile</th>
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <th>삭제</th>
        </c:if>

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
        <c:if test="${sessionScope.loginMemberId eq 'admin'}">
            <td><a href="/member/delete?id=${member.id}">삭제</a></td>
        </c:if>
    </tr>
</table>

</body>
</html>
