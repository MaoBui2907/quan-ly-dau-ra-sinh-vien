/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dashboard;

import Teacher.ClassManagementServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
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
        if (session.getAttribute("role") != null) {
            String role = (String) session.getAttribute("role");
            switch (role) {
                case "teacher":
                    String teacherID = (String) session.getAttribute("teacherID");
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                        Statement inforStatement = con.createStatement();
                        String queryTeacher = "SELECT MAGV, TENGV, EMAIL, SDT, TENKHOA FROM GIAOVIEN,  KHOA "
                                + " WHERE GIAOVIEN.MAKHOA=KHOA.MAKHOA AND  MAGV = '" + teacherID + "'";
                        ResultSet info = inforStatement.executeQuery(queryTeacher);
                        while (info.next()) {
                            session.setAttribute("id", info.getString("MAGV"));
                            session.setAttribute("name", info.getString("TENGV"));
                            session.setAttribute("email", info.getString("EMAIL"));
                            session.setAttribute("phone", info.getString("SDT"));
                            session.setAttribute("faculty", info.getString("TENKHOA"));
                        }

                        Statement widStatement = con.createStatement();
                        String queryWidget = "SELECT MIN(NAMHOC) AS NAMBD, COUNT(MALOPHOC) AS SOLOP  FROM LOPHOC WHERE MAGV = '" + teacherID + "'";
                        ResultSet widgets = widStatement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", widgets.getString("NAMBD"));
                            session.setAttribute("label0", "Năm bắt đầu");

                            session.setAttribute("widget2", widgets.getString("SOLOP"));
                            session.setAttribute("label2", "Lớp giảng dạy");
                        }
                        queryWidget = "  SELECT AVG(QUATRINH) TB, COUNT(DISTINCT MSSV) SV, LOPHOC.MALOPHOC FROM LOPHOC, SV_CHUANMH \n"
                                + " WHERE LOPHOC.MALOPHOC=SV_CHUANMH.MALOPHOC AND LOPHOC.NAMHOC=SV_CHUANMH.NAMHOC \n"
                                + " AND LOPHOC.HOCKY=SV_CHUANMH.HOCKY AND MAGV = '" + teacherID + "'\n"
                                + " GROUP BY LOPHOC.MALOPHOC";
                        widgets = widStatement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget1", widgets.getString("SV"));
                            session.setAttribute("label1", "Số sinh viên");
                            session.setAttribute("widget3", widgets.getString("TB") + "%");
                            session.setAttribute("label3", "TB chuẩn đạt được");
                        }

                        // Chart data
                        session.setAttribute("chartTitle", "Số sinh vien giang day theo năm");
                        session.setAttribute("yLabel", "Sinh vien");
                        String[] xData = {"2016", "2017", "2018"};
                        int[] yData0 = {300, 322, 320};
                        int[] yData1 = {300, 322, 319};
                        session.setAttribute("yLabel0", "Sinh vien giang day");
                        session.setAttribute("yData0", Arrays.toString(yData0));
                        session.setAttribute("yLabel1", "Sinh vien qua mon");
                        session.setAttribute("yData1", Arrays.toString(yData1));
                        session.setAttribute("xData", Arrays.toString(xData));

                        session.setAttribute("title", "Bảng điều khiển giáo viên");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().print(ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(DashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
                case "student":
                    String studentID = (String) session.getAttribute("studentID");
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                        Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                        Statement statement = con.createStatement();
                        String queryStudent = "SELECT MSSV, TENSV, EMAIL, SDT, SINHVIEN.MALOP, TENKHOA FROM SINHVIEN, \n"
                                + " (SELECT MALOP,TENKHOA FROM KHOA, LOPSINHHOAT WHERE KHOA.MAKHOA = LOPSINHHOAT.MAKHOA) LOP_KHOA\n"
                                + " WHERE SINHVIEN.MALOP = LOP_KHOA.MALOP\n"
                                + " AND MSSV='" + studentID + "'";
                        ResultSet info = statement.executeQuery(queryStudent);
                        while (info.next()) {
                            session.setAttribute("id", info.getString("MSSV"));
                            session.setAttribute("name", info.getString("TENSV"));
                            session.setAttribute("email", info.getString("EMAIL"));
                            session.setAttribute("phone", info.getString("SDT"));
                            session.setAttribute("faculty", info.getString("TENKHOA"));
                            session.setAttribute("widget1", info.getString("MALOP"));
                            session.setAttribute("label1", "Lớp sinh hoạt");
                        }
                        // widget data
                        String queryWidget = "SELECT MIN(NAMHOC) NAMBD, AVG(DIEMTB) TB, COUNT(MALOPHOC) SOLOP\n"
                                + "FROM BANGDIEM\n"
                                + "WHERE MSSV = '" + session.getAttribute("studentID") + "'";
                        ResultSet widgets = statement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", widgets.getString("NAMBD"));
                            session.setAttribute("label0", "Năm bắt đầu");
                            session.setAttribute("widget2", widgets.getString("SOLOP"));
                            session.setAttribute("label2", "Số lớp học");
                            session.setAttribute("widget3", widgets.getString("TB"));
                            session.setAttribute("label3", "TB tích lũy");
                        }

                        // Chart data
                        session.setAttribute("chartTitle", "Số lớp học theo năm");
                        session.setAttribute("yLabel", "Lớp");
                        String[] xData = {"2016", "2017", "2018"};
                        int[] yData0 = {12, 12, 15};
                        int[] yData1 = {10, 11, 15};
                        session.setAttribute("yLabel0", "Số lớp đăng ký");
                        session.setAttribute("yData0", Arrays.toString(yData0));
                        session.setAttribute("yLabel1", "Số lớp đạt");
                        session.setAttribute("yData1", Arrays.toString(yData1));
                        session.setAttribute("xData", Arrays.toString(xData));
                        // title
                        session.setAttribute("title", "Bảng điều khiển sinh viên");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().write("Loi truy van");
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(DashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
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

                        String queryWidget = "SELECT MIN(NAMHOC) NAMBD, COUNT(MALOPHOC) SOLOP  FROM LOPHOC WHERE MAGV = '" + deanID + "'";
                        ResultSet widgets = statement.executeQuery(queryWidget);
                        while (widgets.next()) {
                            session.setAttribute("widget0", widgets.getString("NAMBD"));
                            session.setAttribute("label0", "Năm bắt đầu");
//                            session.setAttribute("widget1", info.getString("SOLOP"));
//                            session.setAttribute("label1", "");
                            session.setAttribute("widget2", widgets.getString("SOLOP"));
                            session.setAttribute("label2", "Lớp giảng dạy");
//                            session.setAttribute("widget3", info.getString("EMAIL"));
//                            session.setAttribute("label3", "TB Đạt chuẩn");
                        }

                        // Chart data
                        session.setAttribute("chartTitle", "Số sinh vien theo năm");
                        session.setAttribute("yLabel", "Sinh vien");
                        String[] xData = {"2016", "2017", "2018"};
                        int[] yData0 = {420, 480, 490};
                        int[] yData1 = {360, 380, 420};
                        session.setAttribute("yLabel0", "Sinh vien nhap hoc");
                        session.setAttribute("yData0", Arrays.toString(yData0));
                        session.setAttribute("yLabel1", "Sinh vien tot nghiep");
                        session.setAttribute("yData1", Arrays.toString(yData1));
                        session.setAttribute("xData", Arrays.toString(xData));

                        session.setAttribute("title", "Bảng điều khiển trưởng khoa");
                        view = request.getRequestDispatcher("homepage.jsp");
                    } catch (SQLException ex) {
                        Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                        response.setContentType("text/plain");
                        response.getWriter().write("Loi truy van");
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(DashboardServlet.class.getName()).log(Level.SEVERE, null, ex);
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
