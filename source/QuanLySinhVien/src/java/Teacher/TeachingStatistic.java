/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Teacher;

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
 * @author nguyenmao
 */
@WebServlet(name = "TeachingStatistic", urlPatterns = {"/quatrinhgiangday"})
public class TeachingStatistic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && (session.getAttribute("role") == "teacher" || session.getAttribute("role") == "dean")) {
            session.setAttribute("title", "Thống kê giảng dạy");
            view = request.getRequestDispatcher("/teacher/teachingStatistic.jsp");
            view.include(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
