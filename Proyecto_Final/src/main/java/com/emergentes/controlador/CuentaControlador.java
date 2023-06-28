
package com.emergentes.controlador;
import com.emergentes.dao.CuentasDAO;
import com.emergentes.dao.CuentasDAOimpl;
import com.emergentes.modelo.Cuentas;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "CuentaControlador", urlPatterns = {"/CuentaControlador"})
public class CuentaControlador extends HttpServlet {
    @Override
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession ses = request.getSession();
       
        if (ses.getAttribute("login")!="OK") {
            response.sendRedirect("index.jsp");
        }else{
            
            try {
                
                Cuentas cts = new Cuentas();
                CuentasDAO dao = new CuentasDAOimpl();
                
                Integer aux = (Integer) ses.getAttribute("us_id");
                int aid = aux.intValue();
                System.out.println("ID RECUPERADO: " + aid);
                 
                String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
                switch (action) {
                    case "add":
                       
                        break;
                    case "edit":
                        
                        break;
                    case "delete":
                        break;
                    case "view":
                       
                        List<Cuentas> lista = dao.getAll(aid);
                        request.setAttribute("cuentas", lista);
                        System.out.println(lista);
                        request.getRequestDispatcher("cuenta.jsp").forward(request, response);
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
        
    }
}
