let updateData
let rowToDelete;
let name = document.getElementsByTagName("main")[0].id

function successToast(){
  let toastLiveExample = document.getElementById('successToast')
  let toast = new bootstrap.Toast(toastLiveExample)
  toast.show()
}

function errorToast(){
  let toastLiveExample = document.getElementById('errorToast')
  let toast = new bootstrap.Toast(toastLiveExample)
  toast.show()
}

function getUpdateData(element) {
  updateData = element.parentElement.parentElement.getElementsByClassName('data')
  let uForm = document.getElementById('updateForm').getElementsByTagName('input')
  for (let i = 0; i < updateData.length; i++) {
    uForm[i].value = updateData[i].innerHTML
  }
}

function updateTable() {
  let uForm = document.getElementById('updateForm').getElementsByTagName('input')
  for (let i = 0; i < updateData.length; i++) {
    updateData[i].innerHTML = uForm[i].value
  }
}
let updateModal = document.getElementById('updateModal')

function closeUpdateModal(modal) {
  let cModal = bootstrap.Modal.getInstance(modal)
  cModal.hide()
}

function showCreateModal(){
  const myModal = new bootstrap.Modal('#createModal', {
    keyboard: false
  })
  myModal.show();
}
function deleteContent(element) {
  rowToDelete = element.parentElement.parentElement
  let id = rowToDelete.querySelector('td').innerHTML
  doDelete(id)
}

//CRUD methods

function doPut(e, form) {
  fetch(form.action, {
    method: 'PUT',
    body: new FormData(form)
  }).then(response => {if (response.ok) {
    successToast();
    updateTable()
    closeUpdateModal()
  }else{
    errorToast()
  }});
  e.preventDefault();
}

function doPost(e, form) {
  fetch(form.action, {
    method: 'POST',
    body: new FormData(form)
  }).then(response => {if (response.ok) {
    successToast();
  }else{
    errorToast()
  }});
  e.preventDefault();
}

function doDelete(id) {
  fetch(`./${name}?id=${id}`, {
    method: 'DELETE',
  }).then(response => {if (response.ok) {
    successToast();
    rowToDelete.remove()
  }else{
    errorToast()
  }});
}

function operateFormatter(value, row, index) {
  return [
    `<button type='button'
            class='btn btn-primary actionBtn' 
            data-bs-toggle='modal' 
            data-bs-target='#updateModal'
            onclick="getUpdateData(this)">
            Actualizar
    </button>
    <button 
            type='button' 
            class='btn btn-danger actionBtn' 
            onclick="deleteContent(this)">
            Eliminar
    </button>`
  ]
}

function buttons () {
  return {
    btnAdd: {
      text: 'Añadir',
      icon: 'fa-plus',
      event: function () {
        showCreateModal()
      },
      attributes: {
        title: 'Add a new row to the table',
        id: 'addRow',
      },
    }
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