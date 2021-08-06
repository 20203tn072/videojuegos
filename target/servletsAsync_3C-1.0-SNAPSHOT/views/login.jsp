<%--
  Created by IntelliJ IDEA.
  User: abrah
  Date: 8/6/2021
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<center>
    <h1>Inicio de Sesión</h1>
    <form class="login-form" action="${context}/login" method="POST">
        <input type="text" placeholder="email"/>
        <input type="password" placeholder="password"/>
        <button type="submit" class="btn btn-success" name="register" value="register">Iniciar Sesión</button>
    </form>
</center>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</body>
</html>
