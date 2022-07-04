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
                    action="Product"
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
                            required
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
                            required
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
                            step=0.01
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
                            step=0.01
                            required
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