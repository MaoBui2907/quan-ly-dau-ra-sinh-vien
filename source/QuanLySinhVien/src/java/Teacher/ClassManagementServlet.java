/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Teacher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
@WebServlet(name = "ClassManagementServlet", urlPatterns = {"/quanlylophoc"})
public class ClassManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        read database config
        Properties dbProps = new Properties();
        dbProps.load(getServletContext().getResourceAsStream("/WEB-INF/classes/database.properties"));
        String dbHost = dbProps.getProperty("dbURL");
        String dbName = dbProps.getProperty("dbName");
        String dbUser = dbProps.getProperty("dbUser");
        String dbPassword = dbProps.getProperty("dbPassword");

        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && (session.getAttribute("role") == "teacher" || session.getAttribute("role") == "dean")) {
            ArrayList<String> classList = new ArrayList<String>();
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                String teacherID = (String) session.getAttribute("teacherID");
                String queryYear = "Select distinct NamHoc from LOPHOC where MAGV='" + teacherID + "'";
                ResultSet years = statement.executeQuery(queryYear);
                while (years.next()) {
                    String year = years.getString("NAMHOC");
                    String queryTerm = "Select distinct HOCKY from LOPHOC where MAGV='" + teacherID
                            + "' and NAMHOC=" + year;
                    ResultSet terms = statement.executeQuery(queryTerm);
                    while (terms.next()) {
                        String term = terms.getString("HOCKY");
                        String queryClass = "Select distinct MALOPHOC from LOPHOC where MAGV='" + teacherID
                                + "' and NAMHOC=" + year + " and HOCKY=" + term;
                        ResultSet classes = statement.executeQuery(queryClass);
                        while (classes.next()) {
                            String className = classes.getString("MALOPHOC");
                            classList.add(className + ".HK" + term + "." + year);
                        }
                    }
                }
                session.setAttribute("title", "Quản lý lớp học");
                session.setAttribute("classes", classList);
                view = request.getRequestDispatcher("/teacher/classManagement.jsp");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            view.include(request, response);
        } else {
            response.sendRedirect("/login");
        }
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

        HttpSession session = request.getSession(false);
        if (session != null && (session.getAttribute("role") == "teacher" || session.getAttribute("role") == "dean")) {
            String classReq = (String) request.getParameter("class");
            String className = classReq.substring(0, 9);
            String term = classReq.substring(14, 15);
            String year = classReq.substring(16, 20);
            try {
                response.setContentType("text/html;charset=UTF-8");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                String queryStudent = "Select SINHVIEN.MSSV, TENSV, DIEMQT, DIEMTH, DIEMGK, DIEMCK, DIEMTB from SINHVIEN, BANGDIEM where SINHVIEN.MSSV=BANGDIEM.MSSV and BANGDIEM.MALOPHOC='"
                        + className + "' and BANGDIEM.HOCKY=" + (String) term + " and BANGDIEM.NAMHOC=" + (String) year;
                ResultSet students = statement.executeQuery(queryStudent);
                boolean isEnded = false;
                String resString = "";
                while (students.next()) {
                    String tr = "<tr><td>" + students.getString("MSSV") + "</td><td>"
                            + students.getString("TENSV") + "</td><td>" + students.getString("DIEMQT") + "</td><td>"
                            + students.getString("DIEMTH") + "</td><td>" + students.getString("DIEMGK") + "</td><td>"
                            + students.getString("DIEMCK") + "</td><td>" + students.getString("DIEMTB") + "</td></tr>";
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
