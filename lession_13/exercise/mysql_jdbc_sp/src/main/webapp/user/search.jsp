<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/2/2021
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search User</title>
</head>
<body>
<h1>User details</h1>
<p>
    <a href="/users">Back to Product list</a>
</p>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>list of users you want to find</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
<h2>
    <a href="users?choose=users">List All Users</a>
</h2>
</body>
</html>
