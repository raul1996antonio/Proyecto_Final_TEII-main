package com.emergentes.controlador;

import com.emergentes.dao.DepositosDAO;
import com.emergentes.dao.DepositosDAOimpl;
import com.emergentes.modelo.Depositos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DepositosControlador", urlPatterns = {"/DepositosControlador"})
public class DepositosControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession ses = request.getSession();
        
        if (ses.getAttribute("login") != "OK") {
            response.sendRedirect("index.jsp");
        } else {
            
            try {
                
                Depositos dep = new Depositos();
                DepositosDAO dao = new DepositosDAOimpl();

                Integer aux = (Integer) ses.getAttribute("us_id");
                
                int aid = aux.intValue();
                
                String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
                
          
                switch (action) {
                    case "add":
                        request.setAttribute("depositos", dep);
                        request.getRequestDispatcher("Depositos.jsp").forward(request, response);
                        break;
                    case "edit":
                       
                        dep = dao.getById(aid);
                        request.setAttribute("Depositos", dep);
                        request.getRequestDispatcher("Depositos.jsp").forward(request, response);
                      
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
        int monto = Integer.parseInt(request.getParameter("monto"));
        Depositos dep = new Depositos();
        dep.setMonto(monto);
        dep.setCod_cli(aid);
        DepositosDAO dao = new DepositosDAOimpl();
        try {
            dao.insert(dep);
        } catch (Exception ex) {
            System.out.println("Error al Actualizar" + ex.getMessage());
        }
        response.sendRedirect("CuentaControlador");
    }
}
