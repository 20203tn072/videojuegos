<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: abrah
  Date: 8/6/2021
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Games</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/styles.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body onload="displayContent()">
    <br>
    <button type="button" class="btn btn-outline-success btn-sm"  data-bs-toggle="modal" data-bs-target="#create">Aregar Videojuego</button>
    <br>
    <table id="container" class="table table-hover">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Nombre</th>
            <th>Fecha</th>
            <th>Imagen</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>

    <div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar videojuego</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label>Nombre del videojuego: </label>
                    <input class="form-control" type="text" name="nameGame"  id="name">
                    <br>
                    <label>Imagen:</label>
                    <input class="form-control" type="file" name="img"  id="imagen">
                    <br>
                    <label>Fecha de lanzamiento:</label>
                    <input class="form-control" type="text" name="date_Premiere"  id="datePremiere">
                    <br>
                    <label>Categoría:</label>
                    <select class="form-select" name="categoria" id="categoria" >
                        <option value="0">Seleccionar...</option>
                        <option value="1">Arcade</option>
                        <option value="2">Supervivencia</option>
                        <option value="3">Acción</option>
                        <option value="4">Terror</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>Cerrar</button>
                    <button type="button" class="btn btn-success" onclick="createGame();"><i class="fas fa-plus"></i>Agregar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="${context}/assets/dist/js/main.js"></script>
    <script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
</html>
