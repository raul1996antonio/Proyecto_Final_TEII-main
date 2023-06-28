

<h1>Bienvenido </h1>
<%
    String opcion = request.getParameter("opcion");
%>
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link <%=(opcion.equals("cuenta")? "active":"") %>" aria-current="page" href="CuentaControlador">Estado de la Cuenta</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <%=(opcion.equals("movimientos")? "active":"") %>" href="MovimientosControlador">Listado de los Movimientos Realizados</a>
  </li>
  <li class="nav-item">
    <a class="nav-link <%=(opcion.equals("editar")? "active":"") %>" href="ClienteControlador?action=edit">Modificar Datos Personales</a>
  </li>
</ul>
<p></p>