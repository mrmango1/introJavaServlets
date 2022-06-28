<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Producto</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <%@include file="static/html/cssLibs.html" %>
</head>
<body>
<%@ include file="static/html/navbar.html" %>
<main class="container">
  <header>
    <h1>Productos</h1>
  </header>
  <section>
    <h2>Create</h2>
    <div class="center">
      <button
        type="button"
        class="btn btn-success"
        data-bs-toggle="modal"
        data-bs-target="#insertForm"
      >
        Insertar
      </button>
    </div>
  </section>
  <section>
    <h2>Read</h2>
    <form action="Product" method="get" class="col-md-4 center">
      <input type="hidden" name="crud" value="read"/>
      <label for="pSearch" class="form-label">Buscar Productos:</label>
      <div class="input-group mb-3">
        <input
          type="text"
          class="form-control"
          placeholder="nombre, id, telefono"
          id="pSearch"
          name="search"
        />
        <button class="btn btn-secondary" type="submit">Buscar</button>
      </div>
    </form>
  </section>
  <section>
    <h2>Update</h2>
    <form class="col-md-4 center needs-validation" action="Product" method="get" novalidate>
      <input type="hidden" name="crud" value="pUpdate"/>
      <label for="cpUpdate" class="form-label" style="color: white"
      >Actualizar Producto:</label
      >
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="ID" id="cpUpdate" name="ID" required/>
        <button class="btn btn-primary" type="submit">Buscar</button>
        <div class="invalid-feedback">
          Ingrese un ID.
        </div>
      </div>
    </form>
  </section>
  <section>
    <h2 style="color: white">Delete</h2>
    <form class="col-md-4 center needs-validation" action="Product" method="get" novalidate>
      <input type="hidden" name="crud" value="delete"/>
      <label for="pDelete" class="form-label"
      >Eliminar Producto:</label
      >
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="ID" id="pDelete" name="ID" required/>
        <button class="btn btn-danger" type="submit">Eliminar</button>
        <div class="invalid-feedback">
          Ingrese un ID.
        </div>
      </div>
    </form>
  </section>
</main>
<footer></footer>
<%@ include file="templates/product/main.jsp" %>
<%@ include file="templates/common/main.jsp" %>
</body>
</html>
