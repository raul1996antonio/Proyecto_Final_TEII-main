
package com.emergentes.controlador;
import com.emergentes.dao.MovimientosDAO;
import com.emergentes.dao.MovimientosDAOimpl;
import com.emergentes.modelo.Movimientos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MovimientosControlador", urlPatterns = {"/MovimientosControlador"})
public class MovimientosControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        HttpSession ses = request.getSession();
        
        if (ses.getAttribute("login") != "OK") {
            response.sendRedirect("index.jsp");
        }else{
            
            try {
                
                Movimientos mov = new Movimientos();
                MovimientosDAO dao = new MovimientosDAOimpl();
                
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
                        
                        List<Movimientos> lista = dao.getAll(aid);
                        request.setAttribute("movimientos", lista);
                        request.getRequestDispatcher("movimiento.jsp").forward(request, response);
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
