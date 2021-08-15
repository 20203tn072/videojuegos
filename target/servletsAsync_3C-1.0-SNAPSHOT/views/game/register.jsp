<%--
  Created by IntelliJ IDEA.
  User: abrah
  Date: 8/10/2021
  Time: 8:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Registrar Un VideoJuego</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/styles.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${context}/createGame" method="POST">
                <input type="hidden" value="create" name="action">
                <label>Nombre:</label>
                <input class="form-control" type="text" name="name" />
                <br>
                <label>Imagen:</label>
                <input class="form-control" type="text" name="imagen" />
                <br>
                <label>Fecha de Estreno:</label>
                <input class="form-control" type="text" name="date_premiere" />

                <button type="button" class="btn btn-secondary"><i class="fas fa-times"></i> Cancelar</button>
                <button id="btn-agregar" type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Agregar</button>
            </form>
        </div>
    </div>
</div>
<script src="${context}/assets/dist/js/main.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</body>
</html>
