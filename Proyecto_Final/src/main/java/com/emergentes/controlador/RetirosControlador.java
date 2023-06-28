package com.emergentes.controlador;

import com.emergentes.dao.RetirosDAO;
import com.emergentes.dao.RetirosDAOimpl;
import com.emergentes.modelo.Retiros;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RetirosControlador", urlPatterns = {"/RetirosControlador"})
public class RetirosControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession ses = request.getSession();
       
        if (ses.getAttribute("login") != "OK") {
            response.sendRedirect("index.jsp");
        } else {
            
            try {
                
                Retiros dep = new Retiros();
                RetirosDAO dao = new RetirosDAOimpl();
                
                Integer aux = (Integer) ses.getAttribute("us_id");
              
                int aid = aux.intValue();
                
                String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
               
                switch (action) {
                    case "add":
                        request.setAttribute("retiros", dep);
                        request.getRequestDispatcher("Retiros.jsp").forward(request, response);
                        break;
                    case "edit":
                       
                        dep = dao.getById(aid);
                        request.setAttribute("Retiros", dep);
                        request.getRequestDispatcher("Retiros.jsp").forward(request, response);
                       
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
        Retiros dep = new Retiros();
        dep.setMonto(monto);
        dep.setCod_cli(aid);
        RetirosDAO dao = new RetirosDAOimpl();
        try {
            dao.insert(dep);
        } catch (Exception ex) {
            System.out.println("Error al Actualizar" + ex.getMessage());
        }
        response.sendRedirect("CuentaControlador");
    }
}
