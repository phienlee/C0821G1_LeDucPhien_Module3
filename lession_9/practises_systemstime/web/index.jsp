<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<%--  C1--%>
<%--    <form action="/sumS">--%>
<%--  C2--%>
<%--  <form action="/sum_servlet.jsp">--%>
<%--C3--%>
    <form action="/sumNew">
      <p>
        Number 1: <input type="text" name="num1" />
      </p>
      <p>
        Number 2: <input type="text" name="num2" />
      </p>
      <input type="submit" value="Sum">
    </form>
<%--    <h2 style="color: greenyellow">--%>
<%--      <strong><%=request.getAttribute("resultFinal")%></strong>--%>
<%--    </h2>--%>
  </body>
</html>
