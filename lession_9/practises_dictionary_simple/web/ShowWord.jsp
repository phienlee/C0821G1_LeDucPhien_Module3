<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/9/2021
  Time: 3:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>
    <c:if test="${sessionScope.result==null}">
        not found
    </c:if>
    ${sessionScope.result}
</h1>
</body>
</html>
