<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>CRUD</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@include file="static/html/libs.html" %>
</head>
<style>
    h1,
    h2 {
        text-align: center;
        margin-top: 40px;
        margin-bottom: 30px;
    }
    .btn-center {
        text-align: center;
    }
</style>
<body>
<div>
  <%@ include file="static/html/navbar.html" %>
</div>
<div class="container">
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
    Insertar
  </button>
</div>
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Insertar Cliente</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</div>
</body>
</html>
