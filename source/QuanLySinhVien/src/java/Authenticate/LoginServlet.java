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
import java.util.Properties;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().setAttribute("title", "Đăng nhập");
        RequestDispatcher view = request.getRequestDispatcher("authenticate/login.jsp");
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        read database config
        Properties dbProps = new Properties();
        dbProps.load(getServletContext().getResourceAsStream("/WEB-INF/classes/database.properties"));
        String dbHost = dbProps.getProperty("dbURL");
        String dbName = dbProps.getProperty("dbName");
        String dbUser = dbProps.getProperty("dbUser");
        String dbPassword = dbProps.getProperty("dbPassword");

        String username = request.getParameter("email");
        String password = request.getParameter("password");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // TODO add your handling code here:
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String connectionURL;
            String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
            Connection conn = DriverManager.getConnection(url, dbUser, dbPassword);
            Statement statement = conn.createStatement();
            String studentQuery = "select * from SinhVien where USERNAME = '" + username + "' and PASSWORD='" + password + "'";
            ResultSet student = statement.executeQuery(studentQuery);
            if (student.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("role", "student");
                session.setAttribute("studentID", student.getString("MSSV"));
                response.sendRedirect("/homepage");
            } else {
                String teacherQuery = "select * from Giaovien where username = '" + username + "' and password='" + password + "'";
                ResultSet teacher = statement.executeQuery(teacherQuery);
                if (teacher.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("teacherID", teacher.getString("MAGV"));
                    String deanQuery = "select * from QUANLY where MATK='" + teacher.getString("MAGV") + "'";
                    ResultSet dean = statement.executeQuery(deanQuery);
                    if (dean.next()) {
                        session.setAttribute("role", "teacher");
                    } else {
                        session.setAttribute("role", "dean");
                    }
                    response.sendRedirect("/homepage");
                } else {
                    out.print("Mật khẩu không chính xác");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.print("Có lỗi xảy ra" + e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
