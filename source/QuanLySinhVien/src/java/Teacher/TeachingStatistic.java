/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
 * @author nguyenmao
 */
@WebServlet(name = "TeachingStatistic", urlPatterns = {"/quatrinhgiangday"})
public class TeachingStatistic extends HttpServlet {

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
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement inforStatement = con.createStatement();
//                Subject chart
                String queryChart = "SELECT COUNT(MALOPHOC) SOLOP, LOPHOC.MAMH, TENMH  FROM LOPHOC, MONHOC \n"
                        + "WHERE LOPHOC.MAMH = MONHOC.MAMH AND MAGV = '" + session.getAttribute("teacherID") + "'\n"
                        + "GROUP BY LOPHOC.MAMH, TENMH";
                ResultSet charts = inforStatement.executeQuery(queryChart);
                ArrayList<Integer> subjectcountList = new ArrayList<Integer>();
                ArrayList<String> subjectnameList = new ArrayList<String>();
                int total = 0;
                while (charts.next()) {
                    total += charts.getInt("SOLOP");
                    subjectnameList.add("\"" + charts.getString("MAMH") + "\"");
                    subjectcountList.add(charts.getInt("SOLOP"));
                }
                session.setAttribute("subjectDatas", Arrays.toString(subjectcountList.toArray()));
                session.setAttribute("subjectNames", Arrays.toString(subjectnameList.toArray()));

//                teaching chart
                queryChart = "SELECT COUNT(MALOPHOC) SOLOP, NAMHOC FROM LOPHOC WHERE MAGV='" + session.getAttribute("teacherID") + "'\n"
                        + "GROUP BY NAMHOC";
                charts = inforStatement.executeQuery(queryChart);
                ArrayList<Integer> totalCount = new ArrayList<Integer>();
                ArrayList<Integer> positiveCount = new ArrayList<Integer>();
                ArrayList<String> yearList = new ArrayList<String>();
                while (charts.next()) {
                    yearList.add("\"" + charts.getString("NAMHOC") + "\"");
                    Statement positiveState = con.createStatement();
                    String posQuery = "SELECT COUNT(MALOPHOC) LOP\n"
                            + "FROM (SELECT AVG(QUATRINH) QUATRINH, LOPHOC.NAMHOC, LOPHOC.HOCKY, LOPHOC.MALOPHOC, LOPHOC.MAGV FROM LOPHOC, SV_CHUANMH \n"
                            + "WHERE LOPHOC.MALOPHOC = SV_CHUANMH.MALOPHOC \n"
                            + "GROUP BY LOPHOC.NAMHOC, LOPHOC.MALOPHOC, LOPHOC.HOCKY, LOPHOC.MAGV) GIANGDAY\n"
                            + "WHERE MAGV = '" + session.getAttribute("teacherID") + "' AND QUATRINH >= 80";
                    ResultSet posi = positiveState.executeQuery(posQuery);
                    if (posi.next()) {
                        positiveCount.add(posi.getInt("LOP"));
                    } else {
                        positiveCount.add(0);
                    }
                    totalCount.add(charts.getInt("SOLOP"));
                }
                session.setAttribute("years", Arrays.toString(yearList.toArray()));
                session.setAttribute("totalClass", Arrays.toString(totalCount.toArray()));
                session.setAttribute("positiveClass", Arrays.toString(positiveCount.toArray()));

//                personal statistic
                session.setAttribute("total", total);
                queryChart = "SELECT TOP 1 QUATRINH, MALOPHOC, HOCKY, NAMHOC\n"
                        + "FROM (SELECT AVG(QUATRINH) QUATRINH, LOPHOC.NAMHOC, LOPHOC.HOCKY, LOPHOC.MALOPHOC, LOPHOC.MAGV FROM LOPHOC, SV_CHUANMH \n"
                        + "WHERE LOPHOC.MALOPHOC = SV_CHUANMH.MALOPHOC \n"
                        + "GROUP BY LOPHOC.NAMHOC, LOPHOC.MALOPHOC, LOPHOC.HOCKY, LOPHOC.MAGV) GIANGDAY\n"
                        + "WHERE MAGV = '" + session.getAttribute("teacherID") + "'\n"
                        + "ORDER BY QUATRINH DESC";
                charts = inforStatement.executeQuery(queryChart);
                while (charts.next()) {
                    session.setAttribute("maxProgress", charts.getString("QUATRINH") + "%");
                    session.setAttribute("maxClass", charts.getString("MALOPHOC") + ".HK" + charts.getString("HOCKY") + "." + charts.getString("NAMHOC"));
                }
                queryChart = "SELECT MIN(NAMHOC) START, AVG(QUATRINH) AVG\n"
                        + "FROM (SELECT AVG(QUATRINH) QUATRINH, LOPHOC.NAMHOC, LOPHOC.HOCKY, LOPHOC.MALOPHOC, LOPHOC.MAGV FROM LOPHOC, SV_CHUANMH \n"
                        + "WHERE LOPHOC.MALOPHOC = SV_CHUANMH.MALOPHOC \n"
                        + "GROUP BY LOPHOC.NAMHOC, LOPHOC.MALOPHOC, LOPHOC.HOCKY, LOPHOC.MAGV) GIANGDAY\n"
                        + "WHERE MAGV = '" + session.getAttribute("teacherID") + "'";
                charts = inforStatement.executeQuery(queryChart);
                while (charts.next()) {
                    session.setAttribute("start", charts.getString("START"));
                    session.setAttribute("avgProgress", charts.getString("AVG") + "%");
                }

                session.setAttribute("title", "Thống kê giảng dạy");
                view = request.getRequestDispatcher("/teacher/teachingStatistic.jsp");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
                response.setContentType("text/plain");
                response.getWriter().print(ex);
            }
            view.include(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
