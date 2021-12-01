<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/1/2021
  Time: 1:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input type="text" name="description" id="description" value="${product.getDescription()}"></td>
            </tr>
            <tr>
                <td>Producer</td>
                <td><input type="text" name="producer" id="producer" value="${product.getProducer}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update-Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
