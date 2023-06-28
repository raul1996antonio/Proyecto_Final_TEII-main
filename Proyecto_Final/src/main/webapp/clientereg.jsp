<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Registrar Cliente</title>
        <style>
             body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-image: url("https://img.freepik.com/vector-gratis/fondo-abstracto-formas-blancas_79603-1362.jpg?w=740&t=st=1687833978~exp=1687834578~hmac=5e6d5343a9d048a5ed534f533220ceb0598cf1278d1e9a80fbb4401d3f2b914f");
                font-family: 'Roboto', sans-serif;
            }
        </style>
        
    </head>
    <body>
        <div class="container">
            <h1>Registro Cliente Nuevo</h1>
           
            <form action="RegistraControlador" method="post">
                <input type="hidden" name="id_cliente" value="">
                <div class="mb-3">
                    <label for="" class="form-label">Nombres</label>
                    <input type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="nombres" value="" placeholder="Escriba su/sus nombres" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="apellidos" value="" placeholder="Escriba su/sus apellidos" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Cedula de Identidad</label>
                    <input type="text" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="cedula_identidad" value="" placeholder="Escriba su CI" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Sexo</label>
                    <input type="text" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="sexo" value="" placeholder="Escriba su sexo" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Direccion</label>
                    <input type="text" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="direccion" value="" placeholder="Escriba su direccion" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Celular</label>
                    <input type="text" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="celular" value="" placeholder="Escriba su numero de celular" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Correo</label>
                    <input type="email" type="text" onKeyUp="document.getElementById(this.id).value=document.getElementById(this.id).value.toUpperCase()" class="form-control" name="correo" value="" placeholder="Escriba su correo electronico" required>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">Saldo Inicial</label>
                    <input type="number" min="10" class="form-control" name="saldo" value="" placeholder="INDIQUE EL MONTO CON EL QUE APERTURARÁ SU CUENTA" required>
                </div>
                <button type="submit" class="btn btn-dark">Enviar</button>
                <a class="btn btn-primary" href="RegistraControlador">Volver</a>
            </form>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>