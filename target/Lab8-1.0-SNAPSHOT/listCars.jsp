<%-- 
    Document   : listCars
    Created on : 14 Jun 2024, 12:10:48 am
    Author     : s65417
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Car List</title>
</head>
<body>
<h1>Car List</h1>
<a href="${pageContext.request.contextPath}/newcar">Add New Car</a><br><br>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Brand</th>
        <th>Model</th>
        <th>Cylinder</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="car" items="${listCar}">
        <tr>
            <td>${car.id}</td>
            <td>${car.brand}</td>
            <td>${car.model}</td>
            <td>${car.cylinder}</td>
            <td>${car.price}</td>
            <td>
                <a href="${pageContext.request.contextPath}/editcar?id=${car.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/deletecar?id=${car.id}" 
                   onclick="return confirm('Are you sure?')">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
