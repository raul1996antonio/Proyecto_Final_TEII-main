
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.88.1">
        <title>Proyecto final</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@1,700&display=swap" rel="stylesheet">
        <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            html,
            body {
                height: 100%;
            }

            body {
                display: flex;
                align-items: center;
                padding-top: 40px;
                padding-bottom: 40px;
                background-image: url("https://img.freepik.com/vector-gratis/fondo-abstracto-formas-blancas_79603-1362.jpg?w=740&t=st=1687833978~exp=1687834578~hmac=5e6d5343a9d048a5ed534f533220ceb0598cf1278d1e9a80fbb4401d3f2b914f");
                font-family: 'Roboto', sans-serif;
            }

            .form-signin {
                width: 100%;
                max-width: 330px;
                padding: 15px;
                margin: auto;
            }

            .form-signin .checkbox {
                font-weight: 400;
            }

            .form-signin .form-floating:focus-within {
                z-index: 2;
            }

            .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }

            .form-signin input[type="password"] {
                margin-bottom: 10px;
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }
        </style>

    </head>
    <body class="text-center">

        <main class="form-signin">
            <form action="LoginControlador" method="post">
               <img class="mb-4" src="https://cdn-icons-png.flaticon.com/512/1250/1250296.png?w=740&t=st=1687834570~exp=1687835170~hmac=5811b2dd7f22c5c425d8df50807bdad5e1422ce4e0c07024561b4b94646e26d4" alt="" width="72" height="57">
                <h1 class="h3 mb-3 fw-normal">BIENVENIDO</h1>

                <div class="form-floating">
                    <input type="text" name="usuario" class="form-control" id="floatingInput" placeholder="Nombre de Usuario">
                    <label for="floatingInput"></label>
                </div>
                <div class="form-floating">
                    <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Contraseña">
                    <label for="floatingPassword"></label>
                </div>

                
                <button class="w-100 btn btn-lg btn-primary" type="submit">Iniciar Sesión</button><br><br>
                 <p> <a style="color:green;" href="RegistraControlador?action=add" >REGISTRAR NUEVO CLIENTE</a></p>
                <p class="mt-5 mb-3 text-muted">&copy; Proyecto final Emergentes</p>
            </form>
        </main>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>