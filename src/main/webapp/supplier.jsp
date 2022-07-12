<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Clientes</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <%@include file="static/libs/headerLibs.html" %>
</head>
<body>
<%@ include file="static/libs/navbar.html" %>
<main class="container" id="Supplier">
  <header>
    <h1><i class="fa fa-users"></i> Proovedores</h1>
  </header>
  <section>
    <div id="toolbar">
      <button
        type="button"
        class="btn btn-success"
        data-bs-toggle="modal"
        data-bs-target="#createModal">
        <i class="fa fa-plus"></i>
        Añadir Proovedor
      </button>
    </div>
    <table
      id="table"
      data-toolbar="#toolbar"
      data-locale="es-ES"
      data-toggle="table"
      data-height="550"
      data-search="true"
      data-show-search-button="true"
      data-buttons-class="primary"
      data-show-refresh="true"
      data-pagination="true"
      data-show-columns="true"
      data-url="./Supplier">
      <thead>
      <tr>
        <th data-field="id">ID</th>
        <th data-field="name">NOMBRES</th>
        <th data-field="ruc">RUC</th>
        <th data-field="contact">CONTACTO</th>
        <th data-field="address">DIRECCION</th>
        <th data-field="operate" data-formatter="operateFormatter" data-width="222">ACCION</th>
      </tr>
      </thead>
      <tbody id="readTable">
      </tbody>
    </table>
  </section>
</main>
<footer></footer>
<%@ include file="/templates/create/cSupplier.jsp" %>
<%@ include file="/templates/update/uSupplier.jsp" %>
<%@ include file="templates/common/main.jsp" %>
</body>
</html>
