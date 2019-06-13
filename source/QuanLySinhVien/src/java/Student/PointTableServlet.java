/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Student;

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
@WebServlet(name = "PointTableServlet", urlPatterns = {"/bangdiemsinhvien"})
public class PointTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") == "student") {
            session.setAttribute("title", "Bảng điểm sinh viên");
            view = request.getRequestDispatcher("/student/pointTable.jsp");
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
        if (session != null && session.getAttribute("role") == "student") {
            try {
                response.setContentType("text/html;charset=UTF-8");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                String queryPoint = "SELECT MONHOC.MAMH, TENMH, DIEMQT, DIEMCK, DIEMGK, DIEMTH, DIEMTB, HOCKY, NAMHOC FROM MONHOC, \n"
                        + "(SELECT MSSV, MAMH, DIEMQT, DIEMGK, DIEMCK, DIEMTH, DIEMTB, BANGDIEM.HOCKY, BANGDIEM.NAMHOC FROM BANGDIEM, LOPHOC \n"
                        + "WHERE BANGDIEM.MALOPHOC = LOPHOC.MALOPHOC) DIEM\n"
                        + "WHERE MSSV = '" + session.getAttribute("studentID") + "'\n"
                        + "ORDER BY NAMHOC, HOCKY";
                ResultSet points = statement.executeQuery(queryPoint);
                boolean isEnded = false;
                String resString = "";
                while (points.next()) {
                    String tr = "<tr class='object'><td>HK" + points.getString("HOCKy") + "." + points.getString("NAMHOC") + "</td><td>"
                            + points.getString("MAMH") + "</td><td>" + points.getString("TENMH") + "</td><td>"
                            + points.getString("DIEMQT") + "</td><td>" + points.getString("DIEMGK") + "</td><td>" 
                            + points.getString("DIEMTH") + "</td><td>" + points.getString("DIEMCK") + "</td><td>" 
                            + points.getString("DIEMTB") + "</td></a></tr>";
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
