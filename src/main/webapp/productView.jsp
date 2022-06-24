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
<h1>PRODUCTOS</h1>
<div class="container">
  <h2>READ</h2>
  <form action="ProductsS" method="get">
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
        <th>DESCRIPCION</th>
        <th>VALOR REF.COMPRA</th>
        <th>VALOR REF.VENTA</th>
        <th>STOCK</th>
        <th>IVA</th>
        <th>TIPO</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="temp" items="${productList}">
        ${temp}
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<div class="container">
  <h2>CREATE</h2>
  <form action="ProductsS" method="get">
    <input type="hidden" name="crud" value="create">
    <div class="mb-3 mt-3">
      <label for="cName" class="form-label">Nombre:</label>
      <input type="text" class="form-control" id="cName" placeholder="Ingrese el nombre del producto" name="name">
    </div>
    <div class="mb-3">
      <label for="cDes" class="form-label">Descripcion:</label>
      <input type="text" class="form-control" id="cDes" placeholder="Ingrese la descripcion" name="description">
    </div>
    <div class="mb-3">
      <label for="cValueP" class="form-label">Valor Ref.Compra:</label>
      <input type="number" class="form-control" id="cValueP" placeholder="Ingrese el valor referencial de compra"
             name="valueP">
    </div>
    <div class="mb-3">
      <label for="cValueS" class="form-label">Valor Ref.Venta:</label>
      <input type="number" class="form-control" id="cValueS" placeholder="Ingrese el valor referencial de venta" name="valueS">
    </div>
    <div class="mb-3">
      <label for="cStock" class="form-label">Stock:</label>
      <input type="number" class="form-control" id="cStock" placeholder="Ingrese la cantidad de productos" name="stock">
    </div>
    <div class="mb-3">
      <label class="form-label">IVA:</label>
      <div class="form-check">
        <input type="radio" class="form-check-input" id="cIvaYes" name="iva" value="SI" checked>Si
        <br>
        <input type="radio" class="form-check-input" id="CIvaNo" name="iva" value="NO">No
      </div>
    </div>
    <div class="mb-3">
      <label for="cType" class="form-label">Tipo: </label>
      <select class="form-select" id="cType" name="type">
        <option value="CONSUMO">CONSUMO</option>
        <option value="EMERGENCIA">EMERGENCIA</option>
        <option value="USO COMUN">USO COMUN</option>
        <option value="DURABLES">DURABLES</option>
      </select>
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-success">Crear</button>
    </div>
  </form>
</div>
<div class="container">
  <h2>UPDATE</h2>
  <form action="ProductsS" method="get">
    <input type="hidden" name="crud" value="update">
    <div class="mb-3 mt-3">
      <label for="uID" class="form-label">ID:</label>
      <input type="number" class="form-control" id="uID" placeholder="Ingrese el ID del producto" name="ID">
    </div>
    <div class="mb-3 mt-3">
      <label for="uName" class="form-label">Nombre:</label>
      <input type="text" class="form-control" id="uName" placeholder="Ingrese el nombre del producto" name="name">
    </div>
    <div class="mb-3">
      <label for="uDes" class="form-label">Descripcion:</label>
      <input type="text" class="form-control" id="uDes" placeholder="Ingrese la descripcion" name="description">
    </div>
    <div class="mb-3">
      <label for="uValueP" class="form-label">Valor Ref.Compra:</label>
      <input type="number" class="form-control" id="uValueP" placeholder="Ingrese el valor referencial de compra"
             name="valueP">
    </div>
    <div class="mb-3">
      <label for="uValueS" class="form-label">Valor Ref.Venta:</label>
      <input type="number" class="form-control" id="uValueS" placeholder="Ingrese el valor referencial de venta" name="valueS">
    </div>
    <div class="mb-3">
      <label for="uStock" class="form-label">Stock:</label>
      <input type="number" class="form-control" id="uStock" placeholder="Ingrese la cantidad de productos" name="stock">
    </div>
    <div class="mb-3">
      <label class="form-label">IVA:</label>
      <div class="form-check">
        <input type="radio" class="form-check-input" id="uIvaYes" name="iva" value="SI" checked>Si
        <br>
        <input type="radio" class="form-check-input" id="uIvaNo" name="iva" value="NO">No
      </div>
    </div>
    <div class="mb-3">
      <label for="uType" class="form-label">Tipo: </label>
      <select class="form-select" id="uType" name="type">
        <option value="CONSUMO">CONSUMO</option>
        <option value="EMERGENCIA">EMERGENCIA</option>
        <option value="USO COMUN">USO COMUN</option>
        <option value="DURABLES">DURABLES</option>
      </select>
    </div>
    <div class="btn-center">
      <button type="submit" class="btn btn-primary">Actualizar</button>
    </div>
  </form>
</div>
<div class="container">
  <h2>DELETE</h2>
  <form action="ProductsS" method="get">
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
