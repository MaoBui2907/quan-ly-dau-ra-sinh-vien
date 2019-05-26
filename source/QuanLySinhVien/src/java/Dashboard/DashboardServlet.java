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
                    request.getSession().setAttribute("title", "Bảng điều khiển giáo viên");
                    view = request.getRequestDispatcher("homepage.jsp");
                    break;
                case "student":
                    request.getSession().setAttribute("title", "Bảng điều khiển sinh viên");
                    view = request.getRequestDispatcher("homepage.jsp");
                    break;
                case "dean":
                    request.getSession().setAttribute("title", "Bảng điều khiển trưởng khoa");
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
