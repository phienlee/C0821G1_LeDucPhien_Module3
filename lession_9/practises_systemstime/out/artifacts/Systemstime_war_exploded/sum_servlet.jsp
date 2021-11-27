<%--
  Created by IntelliJ IDEA.
  User: Pato
  Date: 08/04/2021
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
//        C2: index.jsp -> sum_servlet.jsp display to Client
        int a = Integer.parseInt(request.getParameter("num1"));
        int b = Integer.parseInt(request.getParameter("num2"));
        int result = a + b;
    %>

    <h2 style="color: blue"><%=result%></h2>
</body>
</html>
