<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Clientes</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <%@include file="static/libs/cssLibs.html" %>
</head>
<body>
<%@ include file="static/libs/navbar.html" %>
<main class="container">
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
    <label for="dSearch" class="form-label">Buscar Clientes:</label>
    <div class="input-group mb-3">
      <input
        type="text"
        class="form-control"
        placeholder="nombre, id, telefono"
        id="dSearch"
        name="search"
      />
      <button class="btn btn-secondary"
              onclick="searchTable('Customer')">Busqueda
      </button>
    </div>
    <table id="bodyTable" class="table table-hover modal-body">
      <thead>
      <tr>
        <th>ID</th>
        <th>NOMBRES</th>
        <th>RUC</th>
        <th>CONTACTO</th>
        <th>DIRECCION</th>
        <th>ACTION</th>
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
