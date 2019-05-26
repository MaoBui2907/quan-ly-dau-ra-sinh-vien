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
                String queryYear = "Select distinct NamHoc from GiangDay where MAGV='" + teacherID + "'";
                ResultSet years = statement.executeQuery(queryYear);
                while (years.next()) {
                    String year = years.getString(1);
                    String queryTerm = "Select distinct HocKy from GiangDay where MAGV='" + teacherID
                            + "' and NAMHOC='" + year + "'";
                    ResultSet terms = statement.executeQuery(queryTerm);
                    while (terms.next()) {
                        String term = terms.getString(1);
                        String queryClass = "Select distinct MALOPHOC from GiangDay where MAGV='" + teacherID
                                + "' and NAMHOC='" + year + "' and HOCKY='" + term + "'";
                        ResultSet classes = statement.executeQuery(queryClass);
                        while (classes.next()) {
                            String className = classes.getString(1);
                            classList.add(className + ".HK" + term + "." + year);
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("title", "Quản lý lớp học");
            session.setAttribute("classes", classList);
            view = request.getRequestDispatcher("/teacher/classManagement.jsp");
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
            ArrayList<String> studentList = new ArrayList<String>();
            String classReq = (String) request.getParameter("class");
            String className = classReq.substring(0, 9);
            String term = classReq.substring(12, 13);
            String year = classReq.substring(14, 16);
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                String queryYear = "Select MSSV, TENSV, DIEMQT, DIEMTH, DIEMGK, DIEMCK, DIEMTB from SINHVIEN, BANGDIEM where SINHVIEN.MSSS=BANGDIEM.MSSV and BANGDIEM.MALOPHOC='" + className
                        + "' and BANGDIEM.HOCKY='" + term
                        + "' and BANGDIEM.NAMHOC='" + year + "'";
                ResultSet years = statement.executeQuery(queryYear);
                boolean isEnded = false;
                while (years.next()) {
                    String year = years.getString(1);
                    String queryTerm = "Select distinct HocKy from GiangDay where MAGV='" + teacherID
                            + "' and NAMHOC='" + year + "'";
                    ResultSet terms = statement.executeQuery(queryTerm);
                    while (terms.next()) {
                        String term = terms.getString(1);
                        String queryClass = "Select distinct MALOPHOC from GiangDay where MAGV='" + teacherID
                                + "' and NAMHOC='" + year + "' and HOCKY='" + term + "'";
                        ResultSet classes = statement.executeQuery(queryClass);
                        while (classes.next()) {
                            String className = classes.getString(1);
                            classList.add(className + ".HK" + term + "." + year);
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("title", "Quản lý lớp học");
            session.setAttribute("classes", classList);
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
