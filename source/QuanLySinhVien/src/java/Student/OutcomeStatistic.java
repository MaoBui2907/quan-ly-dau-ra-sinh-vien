/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Student;

import Teacher.ClassManagementServlet;
import java.io.IOException;
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
@WebServlet(name = "OutcomeStatistic", urlPatterns = {"/chuandaura"})
public class OutcomeStatistic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher view = null;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") == "student") {
            session.setAttribute("title", "Chuẩn đầu ra sinh viên");
            view = request.getRequestDispatcher("/student/outcomeStatistic.jsp");
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
                String queryPoint = "SELECT R.MACHUANDR, TENCHUANDR, QUATRINH FROM SV_CHUANDAURA, \n"
                        + "(SELECT MACHUANDR, TENCHUANDR FROM CHUANDAURA, \n"
                        + "(SELECT MAKHOA FROM SINHVIEN, LOPSINHHOAT WHERE SINHVIEN.MALOP = LOPSINHHOAT.MALOP AND MSSV='" + session.getAttribute("studentID") + "') K \n"
                        + "WHERE CHUANDAURA.MAKHOA = K.MAKHOA) R\n"
                        + "WHERE R.MACHUANDR = SV_CHUANDAURA.MACHUANDR AND MSSV = '" + session.getAttribute("studentID") + "'";
                ResultSet points = statement.executeQuery(queryPoint);
                boolean isEnded = false;
                String resString = "";
                int sum = 0;
                int curr = 0;
                while (points.next()) {
                    sum += 1;
                    if ( Integer.parseInt(points.getString("QUATRINH"))>= 50) {
                        curr += 1;
                    }
                    String tr = "<div class='progress-box progress-1'>"
                            + "<h4 class='por-title'>" + points.getString("MACHUANDR") + "</h4>"
                            + "<div class='por-txt'>" + points.getString("TENCHUANDR") + " (" + points.getString("QUATRINH") + "%)</div>"
                            + "<div class='progress mb-2' style='height: 5px;'>"
                            + "<div class='progress-bar bg-flat-color-1' role='progressbar' style='width: " + points.getString("QUATRINH") + "%;"
                            + " aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'></div></div></div>";
                    resString += tr;
                }
                session.setAttribute("total", (int) (curr / sum) * 100);
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
