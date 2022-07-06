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
<main class="container" id="Customer">
  <header>
    <h1>Clientes</h1>
  </header>
  <section>
    <div class="center">
      <button
        type="button"
        class="btn btn-success"
        data-bs-toggle="modal"
        data-bs-target="#createModal"
      >
        Añadir Cliente
      </button>
    </div>
    <table
      id="table"
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
      data-url="./Customer">
      <thead>
      <tr>
        <th data-field="id">ID</th>
        <th data-field="name">NOMBRES</th>
        <th data-field="ruc">RUC</th>
        <th data-field="contact">CONTACTO</th>
        <th data-field="address">DIRECCION</th>
        <th data-field="operate" data-formatter="operateFormatter">ACCION</th>
      </tr>
      </thead>
      <tbody id="readTable">
      </tbody>
    </table>
  </section>
</main>
<footer></footer>
<%@ include file="/templates/create/cCustomer.jsp" %>
<%@ include file="/templates/update/uCustomer.jsp" %>
<%@ include file="templates/common/main.jsp" %>
</body>
</html>
