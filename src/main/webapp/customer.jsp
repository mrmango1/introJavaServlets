<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>CRUD</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="static/html/libs.html" %>
</head>
<style>
    h1,
    h2 {
        text-align: center;
        margin-top: 40px;
        margin-bottom: 30px;
    }

    .btn-center {
        text-align: center;
    }
</style>
<body>
<div>
  <%@ include file="static/html/navbar.html" %>
</div>
<h1>CLIENTES</h1>
<div class="container">
  <h2>READ</h2>
  <form action="CustomersS" method="get">
    <input type="hidden" name="crud" value="read">
    <div class="mb-3 mt-3">
      <label for="vSearch" class="form-label">ID:</label>
      <input type="text" class="form-control" id="vSearch" placeholder="Busqueda" name="search">
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-secondary">Buscar</button>
    </div>
  </form>
  <div class="table-responsive">
    <table class="table table-hover table-striped">
      <thead>
      <tr>
        <th>ID</th>
        <th>NOMBRE</th>
        <th>RUC</th>
        <th>TELEFONO</th>
        <th>DIRECCION</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="temp" items="${customerList}">
        ${temp}
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<div class="container">
  <h2>CREATE</h2>
  <form action="CustomersS" method="get">
    <input type="hidden" name="crud" value="create">
    <div class="mb-3 mt-3">
      <label for="iName" class="form-label">Nombres:</label>
      <input type="text" class="form-control" id="iName" placeholder="Ingrese su nombre" name="name">
    </div>
    <div class="mb-3">
      <label for="iRuc" class="form-label">Ruc:</label>
      <input type="text" class="form-control" id="iRuc" placeholder="Ingrese su RUC" name="ruc">
    </div>
    <div class="mb-3">
      <label for="iTelf" class="form-label">Telefono:</label>
      <input type="text" class="form-control" id="iTelf" placeholder="Ingrese su numero de Telefono"
             name="contact">
    </div>
    <div class="mb-3">
      <label for="iDir" class="form-label">Direccion:</label>
      <input type="text" class="form-control" id="iDir" placeholder="Ingrese su Direccion" name="address">
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-success">Crear</button>
    </div>
  </form>
</div>
<div class="container">
  <h2>UPDATE</h2>
  <form action="CustomersS" method="get">
    <input type="hidden" name="crud" value="update">
    <div class="mb-3 mt-3">
      <label for="uID" class="form-label">ID:</label>
      <input type="number" class="form-control" id="uID" placeholder="Ingrese el ID" name="ID">
    </div>
    <div class="mb-3 mt-3">
      <label for="uName" class="form-label">Nombres:</label>
      <input type="text" class="form-control" id="uName" placeholder="Ingrese su nombre" name="name">
    </div>
    <div class="mb-3">
      <label for="uRuc" class="form-label">Ruc:</label>
      <input type="text" class="form-control" id="uRuc" placeholder="Ingrese su RUC" name="ruc">
    </div>
    <div class="mb-3">
      <label for="uTelf" class="form-label">Telefono:</label>
      <input type="text" class="form-control" id="uTelf" placeholder="Ingrese su numero de Telefono"
             name="contact">
    </div>
    <div class="mb-3">
      <label for="uDir" class="form-label">Direccion:</label>
      <input type="text" class="form-control" id="uDir" placeholder="Ingrese su Direccion" name="address">
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-primary">Actualizar</button>
    </div>
  </form>
</div>
<div class="container">
  <h2>DELETE</h2>
  <form action="CustomersS" method="get">
    <input type="hidden" name="crud" value="delete">
    <div class="mb-3 mt-3">
      <label for="dID" class="form-label">ID:</label>
      <input type="number" class="form-control" id="dID" placeholder="Ingrese el ID" name="ID">
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-danger">Eliminar</button>
    </div>
  </form>
</div>
</body>
</html>
