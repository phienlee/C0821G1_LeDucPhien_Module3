<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 11/29/2021
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>$Title$</title>
  <style>
    table{
      width: 1000px;
      margin: auto;
      background-color: #ffffff;
      border-collapse: collapse;
    }
    td, th{
      border: 1px solid black;
    }
  </style>
</head>
<body>
<c:if test="${ empty sessionScope.customerList}">
</c:if>
<c:if test="${not empty sessionScope.customerList}">
  <table border="1px">
    <thead>
    <tr>
      <th>Name</th>
      <th>Date of birth</th>
      <th>Address</th>
      <th>Photo</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${sessionScope.customerList}" var="customer">
      <tr>
        <td>${customer.name}</td>
        <td>${customer.dateOfBirth}</td>
        <td>${customer.address}</td>
        <td><img src="/images/${customer.photo}" alt="${customer.photo}" width="200px" height="200px"></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</c:if>
</body>
</html>