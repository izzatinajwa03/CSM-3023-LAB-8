<%-- 
    Document   : editCar
    Created on : 14 Jun 2024, 12:11:43 am
    Author     : s65417
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Car</title>
</head>
<body>
<h1>Edit Car</h1>
<form action="${pageContext.request.contextPath}/updatecar" method="post">
    <input type="hidden" name="id" value="${car.id}"/>
    Brand: <input type="text" name="brand" value="${car.brand}" required/><br/><br>
    Model: <input type="text" name="model" value="${car.model}" required/><br/><br>
    Cylinder: <input type="number" name="cylinder" value="${car.cylinder}" required/><br/><br>
    Price: <input type="number" step="0.01" name="price" value="${car.price}" required/><br/><br>
    <input type="submit" value="Update"/>
</form>
<a href="${pageContext.request.contextPath}/listCars.jsp">Back to Car List</a>
</body>
</html>
