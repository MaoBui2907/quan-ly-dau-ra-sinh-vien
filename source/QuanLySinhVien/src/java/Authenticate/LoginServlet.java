package Authenticate;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;
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
//        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("title", "Đăng nhập");
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            // TODO add your handling code here:
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionURL;
            connectionURL = "jdbc:sqlserver://localhost;databaseName=QL_ChuanDauRa";
            Connection conn = DriverManager.getConnection(connectionURL, "sa", "Maonguyen1998");
            Statement statement = conn.createStatement();
            String studentQuery = "select * from SinhVien where USERNAME = '" + username + "' and PASSWORD='" + password + "'";
            ResultSet student = statement.executeQuery(studentQuery);
            if (student.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "student");
                session.setAttribute("studentID", student.getString("MSSV"));
                response.sendRedirect("/");
            } else {
                String teacherQuery = "select * from Giaovien where username = '" + username + "' and password='" + password + "'";
                ResultSet teacher = statement.executeQuery(teacherQuery);
                if (teacher.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("teacherID", teacher.getString("MSGV"));
                    String deanQuery = "select * from QUANLY where MATK='" + teacher.getString("MSGV") + "'";
                    ResultSet dean = statement.executeQuery(deanQuery);
                    if (dean.next()) {
                        session.setAttribute("role", "teacher");
                    } else {
                        session.setAttribute("role", "dean");
                    }
                    response.sendRedirect("/");
                } else {
                    out.print("Mật khẩu không chính xác");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.print("Có lỗi xảy ra" + e);
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
