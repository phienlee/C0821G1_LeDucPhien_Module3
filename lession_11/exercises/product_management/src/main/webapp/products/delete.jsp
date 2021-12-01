<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 12/1/2021
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<form method="post">
  <h3>Are you sure?</h3>
  <fieldset>
    <legend>product information</legend>
    <table>
      <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
      </tr>
      <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
      </tr>
      <tr>
        <td>Description:</td>
        <td>${product.getDescription()}</td>
      </tr>
      <tr>
        <td>Producer:</td>
        <td>${product.getProducer()}</td>
      </tr>
      <tr>
        <td><input type="submit" value="Delete product"></td>
        <td><a href="/products">Back to products list</a></td>
      </tr>
    </table>
  </fieldset>

</form>
</body>
</html>
