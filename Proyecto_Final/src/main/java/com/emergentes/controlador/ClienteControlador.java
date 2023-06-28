
package com.emergentes.controlador;

import com.emergentes.dao.ClientesDAO;
import com.emergentes.dao.ClientesDAOimpl;
import com.emergentes.modelo.Clientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})
public class ClienteControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession ses = request.getSession();
         
        if (ses.getAttribute("login") != "OK") {
            response.sendRedirect("index.jsp");
        } else {
            
            try {
                
                Clientes cli = new Clientes();
                ClientesDAO dao = new ClientesDAOimpl();
               
                Integer aux = (Integer) ses.getAttribute("us_id");
                 
                int aid = aux.intValue();
                
                String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
                
                switch (action) {
                    case "add":
                        request.setAttribute("cliente", cli);
                        request.getRequestDispatcher("cliente.jsp").forward(request, response);
                        break;
                    case "edit":
                        
                        cli = dao.getById(aid);
                        request.setAttribute("cliente", cli);
                        request.getRequestDispatcher("cliente.jsp").forward(request, response);
                       
                        break;
                    case "delete":
                        break;
                    case "view":
                       
                        break;

                }

            } catch (Exception ex) {
                System.out.println("Error " + ex.getMessage());
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        Integer aux = (Integer) ses.getAttribute("us_id");
        int aid = aux.intValue();
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String cedula_identidad = request.getParameter("cedula_identidad");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        Clientes cli = new Clientes();
        cli.setId_cliente(aid);
        cli.setNombres(nombres);
        cli.setApellidos(apellidos);
        cli.setCedula_identidad(cedula_identidad);
        cli.setSexo(sexo);
        cli.setDireccion(direccion);
        cli.setCelular(celular);
        cli.setCorreo(correo);
        ClientesDAO dao = new ClientesDAOimpl();
        try {
            dao.update(cli);
        } catch (Exception ex) {
            System.out.println("Error al Actualizar" + ex.getMessage());
        }
        response.sendRedirect("CuentaControlador");
    }
}
