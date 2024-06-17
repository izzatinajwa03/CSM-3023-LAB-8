<%-- 
    Document   : addCar
    Created on : 14 Jun 2024, 12:11:21 am
    Author     : s65417
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Car</title>
</head>
<body>
<h1>Add New Car</h1>
<form action="${pageContext.request.contextPath}/insertcar" method="post"><br>
    Brand: <input type="text" name="brand" required/><br/><br>
    Model: <input type="text" name="model" required/><br/><br>
    Cylinder: <input type="number" name="cylinder" required/><br/><br>
    Price: <input type="number" step="0.01" name="price" required/><br/><br>
    <input type="submit" value="Add"/>
</form>
<a href="${pageContext.request.contextPath}/listCars.jsp">Back to Car List</a>
</body>
</html>
