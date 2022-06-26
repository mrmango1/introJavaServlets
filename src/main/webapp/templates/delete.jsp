<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h4 class="modal-title title-center">Esta seguro que desea eliminar</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>

            <!-- Modal body -->
            <form id="form-cCustomer" action="Customer" method="get" class="modal-body center">
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
                <button form="form-cCustomer" type="submit" class="btn btn-success">Crear</button>
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