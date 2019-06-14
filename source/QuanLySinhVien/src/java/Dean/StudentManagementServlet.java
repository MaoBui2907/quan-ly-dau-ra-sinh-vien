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
@WebServlet(name = "StudentManagementServlet", urlPatterns = {"/quanlysinhvien"})
public class StudentManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") == "dean") {
            session.setAttribute("title", "Quản lý sinh viên khoa");
            view = request.getRequestDispatcher("/dean/studentManagement.jsp");
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
                String queryStudent = "SELECT COUNT(QUATRINH) QT, SINHVIEN.MSSV, TENSV, MALOP\n"
                        + "FROM SV_CHUANDAURA,\n"
                        + "(SELECT SINHVIEN.MSSV, TENSV, MALOP\n"
                        + "FROM (SELECT MAKHOA, MSSV, TENSV, SINHVIEN.MALOP FROM SINHVIEN, LOPSINHHOAT WHERE SINHVIEN.MALOP = LOPSINHHOAT.MALOP) SINHVIEN, KHOA\n"
                        + "WHERE SINHVIEN.MAKHOA = KHOA.MAKHOA AND MATK = 'DH134498') SINHVIEN\n"
                        + "WHERE SINHVIEN.MSSV = SV_CHUANDAURA.MSSV AND QUATRINH >= 60\n"
                        + "GROUP BY SINHVIEN.MSSV, TENSV, MALOP";
                ResultSet students = statement.executeQuery(queryStudent);
                boolean isEnded = false;
                String resString = "";
                while (students.next()) {
                    String tr = "<tr><td>" + students.getString("MSSV") + "</td><td>"
                            + students.getString("TENSV") + "</td><td>" + students.getString("MALOP") + "</td><td>"
                            + students.getString("QT") + "</td></tr>";
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
