<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- The Modal -->
<div
        class="modal fade"
        id="updateModal"
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
            <form id="updateForm" action="Customer" onsubmit="doPut(event,this)" class="modal-body">
                <div class="mb-3 mt-3">
                    <label for="uID" class="form-label">ID:</label>
                    <input
                            type="number"
                            class="form-control"
                            id="uID"
                            placeholder="1234567"
                            name="id"
                            readonly
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
                            required
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
                            min="13"
                            max="13"
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
                            min="10"
                            max="10"
                            name="contact"
                            required
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
                            required
                    />
                </div>
            </form>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button form="updateForm" type="submit" class="btn btn-primary">Actualizar</button>
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
