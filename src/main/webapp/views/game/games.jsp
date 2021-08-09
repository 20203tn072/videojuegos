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
</head>
<body>
    <div id="content"></div>
    <table class="table">
        <thead class="table-dark">
        <tr>
            <th>No.</th>
            <th>Nombre</th>
            <th>Imagen</th>
            <th>Premier</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ listUsers }" var="game" varStatus="status">
            <tr>
                <td>${ status.count }</td>
                <td>${ game.idGame.name }</td>
                <td><img src="data:image/jpeg;base64,${ game.imgGame }"</td>
                <td>${ game.date_premiere }</td>
                <td>
                    <c:if test="${ game.status == 1 }">
                        <span class="badge rounded-pill bg-success">Activo</span>
                    </c:if>
                    <c:if test="${ game.status == 0 }">
                        <span class="badge rounded-pill bg-danger">Inactivo</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${ game.status == 1 }">
                        <form action="${context}/getGameById" method="POST" style="display: inline;">
                            <input type="hidden" name="action" value="getGameById">
                            <input type="hidden" name="id" value="${ game.idGame }">
                            <button type="submit" class="btn btn-outline-primary"><i class="fas fa-edit"></i> Modificar</button>
                        </form>
                        <button id="btn-delete-${ status.count }" data-code="${ game.idGame }" data-text="${ game.idGame.name }" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete"><i class="fas fa-trash"></i> Eliminar</button>
                    </c:if>
                    <c:if test="${ game.status == 0 }">
                        <button id="btn-details-${ status.count }" data-code="${ game.idGame }" type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#details"><i class="fas fa-info-circle"></i> Detalles</button>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <script src="${context}/assets/dist/js/main.js"></script>
    <script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
</html>
