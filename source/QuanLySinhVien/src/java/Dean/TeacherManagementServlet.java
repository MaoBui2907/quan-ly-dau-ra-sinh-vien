/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dean;

import Teacher.ClassManagementServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "TeacherManagementServlet", urlPatterns = {"/quanlygiaovien"})
public class TeacherManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") == "dean") {
            session.setAttribute("title", "Quản lý giáo viên khoa");
            view = request.getRequestDispatcher("/dean/teacherManagement.jsp");
            view.include(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //        read database config
        Properties dbProps = new Properties();
        dbProps.load(getServletContext().getResourceAsStream("/WEB-INF/classes/database.properties"));
        String dbHost = dbProps.getProperty("dbURL");
        String dbName = dbProps.getProperty("dbName");
        String dbUser = dbProps.getProperty("dbUser");
        String dbPassword = dbProps.getProperty("dbPassword");

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") == "dean") {
            try {
                response.setContentType("text/html;charset=UTF-8");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                String queryTeacher = "SELECT DISTINCT GIAOVIEN.MAGV, TENGV, HOCHAM, HOCVI, COUNT(MALOPHOC) SOLOP from GIAOVIEN, GIANGDAY "
                        + "WHERE GIAOVIEN.MAGV = GIANGDAY.MAGV AND GIAOVIEN.MAKHOA=(SELECT MAKHOA FROM KHOA WHERE MATK='" + session.getAttribute("teacherID") + "') "
                        + "GROUP BY GIAOVIEN.MAGV, TENGV, HOCHAM, HOCVI";
                ResultSet teachers = statement.executeQuery(queryTeacher);
                boolean isEnded = false;
                String resString = "";
                while (teachers.next()) {
                    String tr = "<tr><td>" + teachers.getString("MSGV") + "</td><td>"
                            + teachers.getString("TENGV") + "</td><td>" + teachers.getString("HOCHAM") + "</td><td>"
                            + teachers.getString("HOCVI") + "</td><td>" + teachers.getString("SOLOP") + "</td></tr>";
                    resString += tr;
                }
                response.getWriter().write(resString);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                response.setContentType("text/plain");
                response.getWriter().write("Loi truy van");
            }
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
