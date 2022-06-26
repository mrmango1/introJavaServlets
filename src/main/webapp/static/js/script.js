function showReadModal() {
    let readModal = new bootstrap.Modal(document.getElementById("readForm"), {});
    readModal.show();
}

(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

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

function successToast() {
    var toastLiveExample = document.getElementById('successToast')
    var toast = new bootstrap.Toast(toastLiveExample)
    toast.show()
}

function errorToast() {
    var toastLiveExample = document.getElementById('errorToast')
    var toast = new bootstrap.Toast(toastLiveExample)
    toast.show()
}
