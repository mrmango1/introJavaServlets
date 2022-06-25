<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Producto</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <%@include file="static/html/libs.html" %>
  </head>
  <body>
    <nav><%@ include file="static/html/navbar.html" %></nav>
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
        <form class="col-md-4 center">
          <label for="search" class="form-label">Buscar Productos:</label>
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
            >Eliminar Producto:</label
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
            <h4 class="modal-title title-center">Insertar Producto</h4>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>

          <!-- Modal body -->
          <form
            id="form-cCustomer"
            action="CustomersS"
            method="get"
            class="modal-body center"
          >
            <input type="hidden" name="crud" value="create" />
            <div class="mb-3 mt-3">
              <label for="cName" class="form-label">Nombre:</label>
              <input
                type="text"
                class="form-control"
                id="cName"
                placeholder="Coca Cola"
                name="name"
              />
            </div>
            <div class="mb-3">
              <label for="cDes" class="form-label">Descripcion:</label>
              <input
                type="text"
                class="form-control"
                id="cDes"
                placeholder="Bebida Hidratante"
                name="description"
              />
            </div>
            <div class="mb-3">
              <label for="cValueP" class="form-label">Valor Ref.Compra:</label>
              <input
                type="number"
                class="form-control"
                id="cValueP"
                placeholder="5.65"
                name="valueP"
              />
            </div>
            <div class="mb-3">
              <label for="cValueS" class="form-label">Valor Ref.Venta:</label>
              <input
                type="number"
                class="form-control"
                id="cValueS"
                placeholder="7.86"
                name="valueS"
              />
            </div>
            <div class="mb-3">
              <label for="cStock" class="form-label">Stock:</label>
              <input
                type="number"
                class="form-control"
                id="cStock"
                placeholder="321"
                name="stock"
              />
            </div>
            <div class="mb-3">
              <label class="form-label">IVA:</label>
              <div class="form-check">
                <input
                  type="radio"
                  class="form-check-input"
                  id="cIvaYes"
                  name="iva"
                  value="SI"
                  checked
                />Si
                <br />
                <input
                  type="radio"
                  class="form-check-input"
                  id="CIvaNo"
                  name="iva"
                  value="NO"
                />No
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
          </form>

          <!-- Modal footer -->
          <div class="modal-footer">
            <button
              type="submit"
              class="btn btn-success"
              form="form-cCustomer"
              value="crud"
            >
              Crear
            </button>
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
            <h4 class="modal-title title-center">Actualizar Producto</h4>
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
                placeholder="123456"
                name="ID"
              />
            </div>
            <div class="mb-3 mt-3">
              <label for="uName" class="form-label">Nombre:</label>
              <input
                type="text"
                class="form-control"
                id="uName"
                placeholder="Coca Cola"
                name="name"
              />
            </div>
            <div class="mb-3">
              <label for="uDes" class="form-label">Descripcion:</label>
              <input
                type="text"
                class="form-control"
                id="uDes"
                placeholder="Bebida Hidratante"
                name="description"
              />
            </div>
            <div class="mb-3">
              <label for="uValueP" class="form-label">Valor Ref.Compra:</label>
              <input
                type="number"
                class="form-control"
                id="uValueP"
                placeholder="34.56"
                name="valueP"
              />
            </div>
            <div class="mb-3">
              <label for="uValueS" class="form-label">Valor Ref.Venta:</label>
              <input
                type="number"
                class="form-control"
                id="uValueS"
                placeholder="74.43"
                name="valueS"
              />
            </div>
            <div class="mb-3">
              <label for="uStock" class="form-label">Stock:</label>
              <input
                type="number"
                class="form-control"
                id="uStock"
                placeholder="123"
                name="stock"
              />
            </div>
            <div class="mb-3">
              <label class="form-label">IVA:</label>
              <div class="form-check">
                <input
                  type="radio"
                  class="form-check-input"
                  id="uIvaYes"
                  name="iva"
                  value="SI"
                  checked
                />Si
                <br />
                <input
                  type="radio"
                  class="form-check-input"
                  id="uIvaNo"
                  name="iva"
                  value="NO"
                />No
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
