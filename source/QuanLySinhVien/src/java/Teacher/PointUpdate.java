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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "PointUpdate", urlPatterns = {"/capnhatdiem"})
public class PointUpdate extends HttpServlet {

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
            try {
                String[] update = request.getParameterValues("update[]");
                String classReq = request.getParameter("class");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String url = "jdbc:sqlserver://" + dbHost + ";databaseName=" + dbName;
                Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                Statement statement = con.createStatement();
                for (String item : update) {
                    statement.executeUpdate(item);
                }
                String className = classReq.substring(0, 9);
                String term = classReq.substring(14, 15);
                String year = classReq.substring(16, 20);
                // update G
                String pointQuery = "SELECT MSSV, DIEMQT, DIEMTH, DIEMGK, DIEMCK\n"
                        + "FROM BANGDIEM\n"
                        + "WHERE MALOPHOC = '" + className + "'  AND HOCKY = " + term + " AND NAMHOC=" + year;
                ResultSet points = statement.executeQuery(pointQuery);
                while (points.next()) {
                    pointQuery = "SELECT MACHUANMH, TRONGSOQT, TRONGSOTH, TRONGSOCK, TRONGSOGK\n"
                            + "FROM CHUANMH, LOPHOC\n"
                            + "WHERE CHUANMH.MAMH = LOPHOC.MAMH AND LOPHOC.MALOPHOC = '" + className + "'";
                    ResultSet weighs = statement.executeQuery(pointQuery);
                    while (weighs.next()) {
                        float quatrinh = points.getFloat("DIEMQT") * weighs.getFloat("TRONGSOQT") 
                                + points.getFloat("DIEMTH") * weighs.getFloat("TRONGSOTH") + points.getFloat("DIEMGK") * weighs.getFloat("TRONGSOGK")
                                + points.getFloat("DIEMCK") * weighs.getFloat("TRONGSOCK");
                        String gUpdate = "UPDATE SV_CHUANMH\n"
                                + "SET QUATRINH = " + quatrinh * 100 + "\n"
                                + "WHERE MSSV = '" + points.getString("MSSV") + "' AND MALOPHOC = '" + className 
                                + "' AND MACHUANMH = '" + weighs.getString("MACHUANMH") + "' AND HOCKY = "  + term + " AND NAMHOC=" + year;
                        statement.executeUpdate(gUpdate);
                    }
                }
                // UPDATE LO
                
                
                response.getWriter().write("done");
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ClassManagementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        // update LO
        
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
