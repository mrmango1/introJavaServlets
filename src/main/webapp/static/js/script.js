let idToDelete
let name = document.getElementsByTagName("main")[0].id

const getUpdateData = (element) => {
  let updateData = element.parentElement.parentElement.getElementsByTagName("td")
  let uForm = document
    .getElementById("updateForm")
    .getElementsByClassName("form-control")
  for (let i = 0; i < updateData.length - 1; i++) {
    uForm[i].value = updateData[i].innerHTML
  }
}
const successToast = () => {
  let toastLiveExample = document.getElementById("successToast")
  new bootstrap.Toast(toastLiveExample).show()
  $("#table").bootstrapTable("refresh")
  $('.modal').modal('hide')
}

const errorToast = () => {
  let toastLiveExample = document.getElementById("errorToast")
  let toast = new bootstrap.Toast(toastLiveExample)
  toast.show()
}

const deleteButton = (element) => {
  idToDelete = element.parentElement.parentElement.querySelector("td").innerHTML
}

//CRUD methods

function doPut(e, form) {
  fetch(form.action, {
    method: "PUT",
    body: new FormData(form),
  }).then((response) => {
    if (response.ok) {
      successToast()
    } else {
      errorToast()
    }
  })
  e.preventDefault()
}

function doPost(e, form) {
  fetch(form.action, {
    method: "POST",
    body: new FormData(form),
  }).then((response) => {
    if (response.ok) {
      successToast()
    } else {
      errorToast()
    }
  })
  e.preventDefault()
}

function doDelete(id) {
  fetch(`./${name}?id=${id}`, {
    method: "DELETE",
  }).then((response) => {
    if (response.ok) {
      successToast()
    } else {
      errorToast()
    }
  })
}

//Table methods
function operateFormatter(value, row, index) {
  return [
    `<button type='button'
            class='btn btn-warning actionBtn' 
            data-bs-toggle='modal' 
            data-bs-target='#updateModal'
            onclick="getUpdateData(this)">
            Actualizar
    </button>
    <button 
            type='button' 
            class='btn btn-danger actionBtn'
             data-bs-toggle="modal" 
             data-bs-target="#deleteDialog"
            onclick="deleteButton(this)">
            Eliminar
    </button>`,
  ]
}

;(function () {
  "use strict"
  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  let forms = document.querySelectorAll(".needs-validation")
  // Loop over them and prevent submission
  Array.prototype.slice.call(forms).forEach(function (form) {
    form.addEventListener(
      "submit",
      function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add("was-validated")
      },
      false
    )
  })
})()
