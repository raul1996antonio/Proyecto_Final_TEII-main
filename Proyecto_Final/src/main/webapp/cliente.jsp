
<%
    if (session.getAttribute("login")!="OK") {
            response.sendRedirect("index.jsp");
        }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>CLiente</title>
 <style>
              body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-color: #AFEEEE;
                background-image: url("https://img.freepik.com/vector-gratis/fondo-abstracto-formas-blancas_79603-1362.jpg?w=740&t=st=1687833978~exp=1687834578~hmac=5e6d5343a9d048a5ed534f533220ceb0598cf1278d1e9a80fbb4401d3f2b914f");
                font-family: 'Roboto', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="container">

                <jsp:include page="WEB-INF/menu.jsp">
                <jsp:param name="opcion" value="editar"/>
            </jsp:include>
            <p>
                <!--Boton para cerrar sesion, se conecta con el controlador Logout-->
                <a href="Logout" class="btn btn-outline-danger"><i class="fas fa-window-close"></i> Cerrar Sesion</a>

            </p
           
            <form action="ClienteControlador" method="post">
                <input type="hidden" name="id_cliente" value="${cliente.id_cliente}">
                <div class="mb-3">
                    <label for="" class="form-label">Nombres</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="nombres" value="${cliente.nombres}" placeholder="Escriba su/sus nombres">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="apellidos" value="${cliente.apellidos}" placeholder="Escriba su/sus apellidos">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Cedula de Identidad</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="cedula_identidad" value="${cliente.cedula_identidad}" placeholder="Escriba su CI">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Sexo</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="sexo" value="${cliente.sexo}" placeholder="Escriba su sexo">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Direccion</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="direccion" value="${cliente.direccion}" placeholder="Escriba su direccion">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Celular</label>
                    <input type="text" type="text" style="text-transform:uppercase;" class="form-control" name="celular" value="${cliente.celular}" placeholder="Escriba su numero de celular">
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Correo</label>
                    <input type="email" type="text" style="text-transform:uppercase;" class="form-control" name="correo" value="${cliente.correo}" placeholder="Escriba su correo electronico">
                </div>
                <button type="submit" class="btn btn-dark">Enviar</button>
            </form>
        </div>
 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>