/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dashboard;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Mao
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/homepage"})
public class DashboardServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null) {
            String role = (String) session.getAttribute("role");
            switch (role) {
                case "teacher":
                    request.setAttribute("title", "Bảng điều khiển giáo viên");
                    request.setAttribute("role", "admin");
                    view = request.getRequestDispatcher("homepage.jsp");
                    break;
                case "student":
                    request.setAttribute("title", "Bảng điều khiển sinh viên");
                    request.setAttribute("role", "student");
                    view = request.getRequestDispatcher("homepage.jsp");
                    break;
                case "dean":
                    request.setAttribute("title", "Bảng điều khiển trưởng khoa");
                    request.setAttribute("role", role);
                    view = request.getRequestDispatcher("homepage.jsp");
                    break;
            }
            view.include(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
