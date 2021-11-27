<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/11/2021
  Time: 9:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show account</title>
    <style>
        table{
            border-collapse: collapse;
            background-color: azure;
        }
        table td {
            border: 1px solid black;
            padding: 10px;
        }
    </style>
</head>
<body>

<table>
    <tr>
        <td>product name</td>
        <td>${sessionScope.product}</td>
    </tr>
    <tr>
        <td>product price</td>
        <td>${sessionScope.price}</td>
    </tr>
    <tr>
        <td>product discount</td>
        <td>${sessionScope.discount}</td>
    </tr>
    <tr>
        <td>product discount amount</td>
        <td>${sessionScope.discountAmount}</td>
    </tr>
    <tr>
        <td>product discount price</td>
        <td>${sessionScope.discountPrice}</td>
    </tr>
</table>
</body>
</html>
