function showToast(status){
    if(status.toString().startsWith("2")){
            let toastLiveExample = document.getElementById('successToast')
            let toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
            updateTable()
            closeUpdateModal()
    }else{
            let toastLiveExample = document.getElementById('errorToast')
            let toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
    }
}

(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    let forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
})()

function searchTable(endpoint){
    let table = document.getElementById('bodyTable')
    let search = document.getElementById('dSearch').value
    function createTable(data){
        let tableData = "";
        for (let i = 0; i < data.length; i++){
            let row = `<tr>
                        <td class="data">${data[i].id}</td>
					    <td class="data">${data[i].name}</td>
						<td class="data">${data[i].ruc}</td>
						<td class="data">${data[i].contact}</td>
						<td class="data">${data[i].address}</td>
						<td><button type='button' 
						            class='btn btn-primary' 
						            data-bs-toggle='modal' 
						            data-bs-target='#updateModal'
						            onclick="getUpdateData(this)">
						            Actualizar
						            </button>
                        <button 
                                type='button' 
                                class='btn btn-danger'
                                onclick="deleteContent(this)">
                                Eliminar
                        </button></td>
				  </tr>`
            tableData += row;
        }
        table.innerHTML = tableData;
    }
    fetch('./'+endpoint+'?crud=read&search='+search)
        .then(response => response.json())
        .then(data => createTable(data));

}

function productTable(){
    fetch('./Product?search='+search)
        .then(response => response.json())
        .then(data => console.log(data));
}

let updateData

function getUpdateData(element) {

    updateData = element.parentElement.parentElement.getElementsByClassName('data')
    let uForm = document.getElementById('updateForm').getElementsByTagName('input')
    for (let i = 0; i < updateData.length; i++){
        uForm[i].value = updateData[i].innerHTML
    }
}

function updateTable(){
    let uForm = document.getElementById('updateForm').getElementsByTagName('input')
    for (let i = 0; i < updateData.length; i++){
        updateData[i].innerHTML = uForm[i].value
    }
}

function closeUpdateModal() {
    let updateModal = document.getElementById('updateModal')
    let modal = bootstrap.Modal.getInstance(updateModal)
    modal.hide()
}

let rowToDelete;
function deleteContent(element) {
    rowToDelete = element.parentElement.parentElement
    id = rowToDelete.getElementsByClassName('data')[0].innerHTML
    doDelete(id)
}

function deleteRow(){
    rowToDelete.remove()
}

//CRUD methods

function doPut(e,form) {
    fetch(form.action, {
        method:'PUT',
        body: new FormData(form)
    }).then(function(data) {
        showToast(data.status);
    });
    e.preventDefault();
}
function doPost(e,form) {
    fetch(form.action, {
        method:'POST',
        body: new FormData(form)
    }).then(function(data) {
        console.log(data.status);
    });
    e.preventDefault();
}
function doDelete(id) {
    fetch(`./Customer?id=${id}`, {
        method: 'DELETE',
    })
        .then(res => {
            deleteRow()
        })
        .then(data => console.log(data))
}

// $(document).ready(function () {
//     $('#test').DataTable();
// });

// function backup(e,form) {
//     let formJson = new FormData(form)
//     fetch(form.action, {
//         method:'POST',
//         headers: {
//             'Accept': 'application/json',
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(formJson.serializeArray())
//     });
//
//     console.log('We send post asynchronously (AJAX)');
//     e.preventDefault();
// }