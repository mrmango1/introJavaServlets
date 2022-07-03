<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Producto</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <%@include file="static/libs/cssLibs.html" %>
</head>
<body>
<%@ include file="static/libs/navbar.html" %>
<main class="container">
  <header>
    <h1>Productos</h1>
  </header>
  <section>
    <div class="center">
      <button
        type="button"
        class="btn btn-success"
        data-bs-toggle="modal"
        data-bs-target="#insertForm"
      >
        Añadir Producto
      </button>
    </div>
    <label for="dSearch" class="form-label">Buscar Productos:</label>
    <div class="input-group mb-3">
      <input
        type="text"
        class="form-control"
        placeholder="nombre, id, telefono"
        id="dSearch"
        name="search"
      />
      <button class="btn btn-secondary"
              onclick="searchTable('Product')">Buscar</button>
    </div>
    <table
      id="bodyTable"
      data-toggle="table"
      data-height="460"
      data-ajax="productTable"
      data-search="true"
      data-side-pagination="server"
      data-pagination="true">
      <thead>
      <tr>
        <th>ID</th>
        <th>NOMBRES</th>
        <th>DESCRIPCION</th>
        <th>VALOR.REF.COMPRA</th>
        <th>VALOR.REF.VENTA</th>
        <th>STOCK</th>
        <th>IVA</th>
        <th>TYPE</th>
      </tr>
      </thead>
      <tbody id="readTable">
      </tbody>
    </table>
  </section>
</main>
<footer></footer>
<%@ include file="/templates/create/cProduct.jsp" %>
<%@ include file="/templates/update/uProduct.jsp" %>
<%@ include file="templates/common/main.jsp" %>
</body>
</html>
