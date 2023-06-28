
package com.emergentes.controlador;
import com.emergentes.utiles.ValidateLogin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {
    @Override
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
    @Override
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("password");
        
        System.out.println("DATOS: "+usuario+"  "+contraseña);
        
        ValidateLogin val = new ValidateLogin();
        
        if (val.checkUser(usuario, contraseña)) {
            System.out.println("Los datos introducidos fueron validados exitosamente");
            
            int id = val.Id(usuario, contraseña);
            int saldo = val.Saldo(id);
            
            HttpSession ses = request.getSession();
           
            ses.setAttribute("login", "OK");
            
            ses.setAttribute("us_id",id);
            
            ses.setAttribute("saldo_actual", saldo);
            
            response.sendRedirect("CuentaControlador");
        }else{
            System.out.println("Los datos introducidos no son los correctos");
            
            response.sendRedirect("index.jsp");
        }
        
    }
}
