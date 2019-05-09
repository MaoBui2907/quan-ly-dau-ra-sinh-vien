package Authenticate;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Nguyen Mao
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */

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
        RequestDispatcher view = request.getRequestDispatcher("login.jsp");
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // TODO add your handling code here:
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionURL;
            connectionURL = "jdbc:sqlserver://DESKTOP-KK4SMEM\\SQLEXPRESS:1433;instance=SQLEXPRESS;databaseName=QL_ChuanDauRa";
            Connection conn = DriverManager.getConnection(connectionURL, "sa", "23051998");

            Statement statement = conn.createStatement();
            String query = "select * from SinhVien where USERNAME = '" + username + "' and PASSWORD='" + password + "'";
            ResultSet rs = statement.executeQuery(query);
            if (rs.next()) {
                request.setAttribute("role", "student");
                request.setAttribute("studentID", rs.getString("MSSV"));
                response.sendRedirect("/homepage");
            }
            
            String query2 = "select * from Giaovien where username = '" + username + "' and password='" + password + "'";
            ResultSet rs2 = statement.executeQuery(query2);
            if (rs2.next()) {
                request.getSession().setAttribute("role", "teacher");
                request.setAttribute("teacherID", rs2.getString("MSGV"));
                response.sendRedirect("/homepage");
            }
        } catch (ClassNotFoundException | SQLException e) {

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
