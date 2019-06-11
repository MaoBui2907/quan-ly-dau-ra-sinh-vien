/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dashboard;

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
 * @author Nguyen Mao
 */
@WebServlet(name = "DashboardServlet", urlPatterns = {"/homepage"})
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //        read database config
        Properties dbProps = new Properties();
        dbProps.load(getServletContext().getResourceAsStream("/WEB-INF/classes/database.properties"));
        String dbHost = dbProps.getProperty("dbURL");
        String dbName = dbProps.getProperty("dbName");
        String dbUser = dbProps.getProperty("dbUser");
        String dbPassword = dbProps.getProperty("dbPassword");

        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null) {
            String role = (String) session.getAttribute("role");
            switch (role) {
                case "teacher":
                    String teacherID = (String) session.getAttribute("teacherID");
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                        Statement statement = con.createStatement();
                        String queryTeacher = "SELECT MAGV, TENGV, EMAIL, SDT, TENKHOA FROM GIAOVIEN,  KHOA "
                                + " WHERE GIAOVIEN.MAKHOA=KHOA.MAKHOA AND  MAGV = '" + teacherID + "'";
                        ResultSet info = statement.executeQuery(queryTeacher);
                        while (info.next()) {
                            session.setAttribute("id", info.getString("MAGV"));
                            session.setAttribute("name", info.getString("TENGV"));
                            session.setAttribute("email", info.getString("EMAIL"));
                            session.setAttribute("phone", info.getString("SDT"));
                            session.setAttribute("faculty", info.getString("TENKHOA"));
                        }

                        String queryWidget = "SELECT MIN(NAMHOC) FROM LOPHOC WHERE MAGV = '" + teacherID + "'";
                        ResultSet widgets = statement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", info.getString("MAGV"));
                            session.setAttribute("label0", "Năm bắt đầu");
                            session.setAttribute("widget1", info.getString("MAGV"));
                            session.setAttribute("label1", "");
                            session.setAttribute("widget2", info.getString("MAGV"));
                            session.setAttribute("label2", "Lớp giảng dạy");
                            session.setAttribute("widget3", info.getString("EMAIL"));
                            session.setAttribute("label3", "TB Đạt chuẩn");
                        }

                        session.setAttribute("title", "Bảng điều khiển giáo viên");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().write("Loi truy van");
                    }

                    break;
                case "student":
                    String studentID = (String) session.getAttribute("studentID");
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                        Statement statement = con.createStatement();
                        String queryTeacher = "SELECT MAGV, TENGV, EMAIL, SDT, TENKHOA FROM GIAOVIEN,  KHOA "
                                + " WHERE GIAOVIEN.MAKHOA=KHOA.MAKHOA AND  MAGV = '" + studentID + "'";
                        ResultSet info = statement.executeQuery(queryTeacher);
                        while (info.next()) {
                            session.setAttribute("id", info.getString("MAGV"));
                            session.setAttribute("name", info.getString("TENGV"));
                            session.setAttribute("email", info.getString("EMAIL"));
                            session.setAttribute("phone", info.getString("SDT"));
                            session.setAttribute("faculty", info.getString("TENKHOA"));
                        }

                        String queryWidget = "SELECT MIN(NAMHOC) FROM LOPHOC WHERE MAGV = '" + studentID + "'";
                        ResultSet widgets = statement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", info.getString("MAGV"));
                            session.setAttribute("label0", "Năm bắt đầu");
                            session.setAttribute("widget1", info.getString("MAGV"));
                            session.setAttribute("label1", "Lớp sinh hoạt");
                            session.setAttribute("widget2", info.getString("MAGV"));
                            session.setAttribute("label2", "Khóa");
                            session.setAttribute("widget3", info.getString("EMAIL"));
                            session.setAttribute("label3", "TB tích lũy");
                        }

                        session.setAttribute("title", "Bảng điều khiển sinh viên");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().write("Loi truy van");
                    }
                    break;
                case "dean":
                    String deanID = (String) session.getAttribute("teacherID");
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                        Statement statement = con.createStatement();
                        String queryTeacher = "SELECT MAGV, TENGV, EMAIL, SDT, TENKHOA FROM GIAOVIEN,  KHOA "
                                + " WHERE GIAOVIEN.MAKHOA=KHOA.MAKHOA AND  MAGV = '" + deanID + "'";
                        ResultSet info = statement.executeQuery(queryTeacher);
                        while (info.next()) {
                            session.setAttribute("id", info.getString("MAGV"));
                            session.setAttribute("name", info.getString("TENGV"));
                            session.setAttribute("email", info.getString("EMAIL"));
                            session.setAttribute("phone", info.getString("SDT"));
                            session.setAttribute("faculty", info.getString("TENKHOA"));
                        }

                        String queryWidget = "SELECT MIN(NAMHOC) FROM LOPHOC WHERE MAGV = '" + deanID + "'";
                        ResultSet widgets = statement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", info.getString("MAGV"));
                            session.setAttribute("label0", "Giáo viên khoa");
                            session.setAttribute("widget1", info.getString("MAGV"));
                            session.setAttribute("label1", "Sinh viên khoa");
                            session.setAttribute("widget2", info.getString("MAGV"));
                            session.setAttribute("label2", "Lớp giảng dạy");
                            session.setAttribute("widget3", info.getString("EMAIL"));
                            session.setAttribute("label3", "TB Đạt chuẩn TN");
                        }

                        session.setAttribute("title", "Bảng điều khiển trưởng khoa");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().write("Loi truy van");
                    }
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
