<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Clientes</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%@include file="static/html/libs.html" %>
  </head>
  <body>
    <nav><%@ include file="static/html/navbar.html" %></nav>
    <main class="container">
      <header>
        <h1>Clientes</h1>
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
        <form class="col-md-4 center">
          <label for="search" class="form-label">Buscar Clientes:</label>
          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="nombre, id, telefono"
            />
            <button class="btn btn-secondary" type="submit">Buscar</button>
          </div>
        </form>
      </section>
      <section>
        <h2>Update</h2>
        <div class="center">
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#updateForm"
          >
            Actualizar
          </button>
        </div>
      </section>
      <section>
        <h2>Delete</h2>
        <form class="col-md-4 center">
          <label for="search" class="form-label" style="color: white"
            >Eliminar Cliente:</label
          >
          <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="ID" />
            <button class="btn btn-danger" type="submit">Eliminar</button>
          </div>
        </form>
      </section>
    </main>
    <!-- The Modal -->
    <div
      class="modal fade"
      id="insertForm"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title title-center">Insertar Cliente</h4>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>

          <!-- Modal body -->
          <form action="CustomersS" method="get" class="modal-body center">
            <input type="hidden" name="crud" value="create" />
            <div class="mb-3">
              <label for="cName" class="form-label">Nombre: </label>
              <input
                type="text"
                id="cName"
                class="form-control"
                placeholder="Pepito Perez"
                name="name"
              />
            </div>
            <div class="mb-3">
              <label for="cRuc" class="form-label">Ruc:</label>
              <input
                type="text"
                class="form-control"
                id="cRuc"
                placeholder="9999999999"
                name="ruc"
                required
              />
            </div>
            <div class="mb-3">
              <label for="cTelf" class="form-label">Telefono:</label>
              <input
                type="text"
                class="form-control"
                id="cTelf"
                placeholder="0999999999"
                name="contact"
              />
            </div>
            <div class="mb-3">
              <label for="cDir" class="form-label">Direccion:</label>
              <input
                type="text"
                class="form-control"
                id="cDir"
                placeholder="Av.Rodrigo de Chavez"
                name="address"
              />
            </div>
          </form>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="submit" class="btn btn-success">Crear</button>
            <button
              type="button"
              class="btn btn-danger"
              data-bs-dismiss="modal"
            >
              Cancelar
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- The Modal -->
    <div
      class="modal fade"
      id="updateForm"
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      tabindex="-1"
      aria-labelledby="staticBackdropLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title title-center">Actualizar Cliente</h4>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>

          <!-- Modal body -->
          <form action="CustomersS" method="get" class="modal-body center">
            <input type="hidden" name="crud" value="update" />
            <div class="mb-3 mt-3">
              <label for="uID" class="form-label">ID:</label>
              <input
                type="number"
                class="form-control"
                id="uID"
                placeholder="1234567"
                name="ID"
              />
            </div>
            <div class="mb-3">
              <label for="uName" class="form-label">Nombre: </label>
              <input
                type="text"
                id="uName"
                class="form-control"
                placeholder="Pepito Perez"
                name="name"
              />
            </div>
            <div class="mb-3">
              <label for="uRuc" class="form-label">Ruc:</label>
              <input
                type="text"
                class="form-control"
                id="uRuc"
                placeholder="9999999999"
                name="ruc"
                required
              />
            </div>
            <div class="mb-3">
              <label for="uTelf" class="form-label">Telefono:</label>
              <input
                type="text"
                class="form-control"
                id="uTelf"
                placeholder="0999999999"
                name="contact"
              />
            </div>
            <div class="mb-3">
              <label for="uDir" class="form-label">Direccion:</label>
              <input
                type="text"
                class="form-control"
                id="uDir"
                placeholder="Av.Rodrigo de Chavez"
                name="address"
              />
            </div>
          </form>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Actualizar</button>
            <button
              type="button"
              class="btn btn-danger"
              data-bs-dismiss="modal"
            >
              Cancelar
            </button>
          </div>
        </div>
      </div>
    </div>
    <footer></footer>
  </body>
</html>
