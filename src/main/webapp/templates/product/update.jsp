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
                <h4 class="modal-title title-center">Actualizar Producto</h4>
                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                ></button>
            </div>

            <!-- Modal body -->
            <form id="form-uProduct" action="Product" method="get" class="modal-body center">
                <input type="hidden" name="crud" value="update" />
                <div class="mb-3 mt-3">
                    <label for="uID" class="form-label">ID:</label>
                    <input
                            type="number"
                            class="form-control"
                            id="uID"
                            placeholder="123456"
                            name="ID"
                            value="${product.id}"
                            readonly
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
                            value="${product.name}"
                            required
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
                            value="${product.description}"
                            required
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
                            value="${product.valueP}"
                            step=0.01
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
                            step=0.01
                            value="${product.valueS}"
                            requierd
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
                            value="${product.stock}"
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
                <button type="submit" form="form-uProduct" class="btn btn-primary">Actualizar</button>
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