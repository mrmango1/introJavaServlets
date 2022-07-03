<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- The Modal -->
<div
        class="modal fade"
        id="createModal"
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
            <form id="createForm" action="Customer" onsubmit="doPost(event,this)" class="modal-body center">
                <div class="mb-3">
                    <label for="cName" class="form-label">Nombre: </label>
                    <input
                            type="text"
                            id="cName"
                            class="form-control"
                            placeholder="Pepito Perez"
                            name="name"
                            required
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
                            min="13"
                            max="13"
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
                            min="10"
                            max="10"
                            required
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
                            required
                    />
                </div>
            </form>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button form="createForm" type="submit" class="btn btn-success">Crear</button>
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