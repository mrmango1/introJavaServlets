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
        data-bs-target="#createModal"
      >
        Añadir Producto
      </button>
    </div>
    <table id="table"
           data-toggle="table"
           data-height="500"
           data-search="true"
           data-buttons="buttons"
           data-pagination="true"
           data-show-columns="true"
           data-show-refresh="true"
           data-show-columns-toggle-all="true"
           data-side-pagination="server"
           data-show-toggle="true"
           data-show-fullscreen="true"
           data-url="./Product">
      <thead>
      <tr>
        <th data-field="id">ID</th>
        <th data-field="name">NOMBRES</th>
        <th data-field="description">DESCRIPCION</th>
        <th data-field="valueP">VALOR.REF.COMPRA</th>
        <th data-field="valueS">VALOR.REF.VENTA</th>
        <th data-field="stock">STOCK</th>
        <th data-field="iva">IVA</th>
        <th data-field="type">TIPO</th>
        <th data-field="operate" data-formatter="operateFormatter">ACCION</th>
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
