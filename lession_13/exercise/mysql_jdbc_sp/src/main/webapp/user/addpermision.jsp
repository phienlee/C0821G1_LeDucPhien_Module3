<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/3/2021
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1px" style="border-collapse: collapse">
    <tr>
        <th>id</th>
        <th>name</th>
    </tr>
    <tr>
        <td>1</td>
        <td>add</td>
    </tr>
    <tr>
        <td>2</td>
        <td>edit</td>
    </tr>
    <tr>
        <td>3</td>
        <td>delete</td>
    </tr>
    <tr>
        <td>4</td>
        <td>view</td>
    </tr>
</table>
<p style="color: red">${mess}</p>
<form action="/users?action=addPer" method="post">
    <fieldset>
        <legend>Permission's form:</legend>
        <input type="number" name="userId" value="${userObj.id}" readonly><br><br>
        <input type="number" name="perId" placeholder="Permission's id"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>

<p>
    <a href="/users">Back to customer list</a>
</p>
</body>
</html>