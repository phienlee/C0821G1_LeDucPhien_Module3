<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/9/2021
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table{
            border-collapse: collapse;
            background-color: blanchedalmond;
        }
        table td {
            border:1px solid black;
            padding: 10px;
        }
    </style>
</head>
<body>
<%--<h1>${r}</h1>--%>
<%--<h1>${usd}</h1>--%>
<%--<h1>${vnd}</h1>--%>
<table>
    <tr>
        <td>Rate</td>
        <td>${r}</td>
    </tr>
    <tr>
        <td>Usd</td>
        <td>${usd}</td>
    </tr>
    <tr>
        <td>Vnd</td>
        <td>${vnd}</td>
    </tr>
</table>
</body>
</html>
