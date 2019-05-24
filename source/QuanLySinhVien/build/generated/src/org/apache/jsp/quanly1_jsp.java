package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class quanly1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\" lang=\"\"> <![endif]-->\n");
      out.write("<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\" lang=\"\"> <![endif]-->\n");
      out.write("<!--[if IE 8]>         <html class=\"no-js lt-ie9\" lang=\"\"> <![endif]-->\n");
      out.write("<!--[if gt IE 8]><!--> <html class=\"no-js\" lang=\"\"> <!--<![endif]-->\n");
      out.write("    <head>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "head.jsp", out, false);
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!-- Left Panel -->\n");
      out.write("        <aside id=\"left-panel\" class=\"left-panel\">\n");
      out.write("            <nav class=\"navbar navbar-expand-sm navbar-default\">\n");
      out.write("                <div id=\"main-menu\" class=\"main-menu collapse navbar-collapse\">\n");
      out.write("                    ");
 String role = (String) request.getAttribute("role");
      out.write("\n");
      out.write("                    <ul class=\"nav navbar-nav\">\n");
      out.write("                        <li class=\"active\">\n");
      out.write("                            <a href=\"/homepage\"><i class=\"menu-icon fa fa-laptop\"></i>Thông tin sinh viên</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"menu-title\">Bảng điều khiển</li><!-- /.menu-title -->\n");
      out.write("                        <li class=\"\">\n");
      out.write("                            <a href=\"#\"><i class=\"menu-icon fa fa-fire\"></i>Kết quả học tập</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li class=\"menu-item-has-children dropdown\">\n");
      out.write("                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"><i class=\"menu-icon fa fa-cogs\"></i>Quá trình học tập</a>\n");
      out.write("                            <ul class=\"sub-menu children dropdown-menu\">                            \n");
      out.write("                                <li><i class=\"fa fa-puzzle-piece\"></i><a href=\"ui-buttons.html\">Chuẩn đầu ra</a></li>\n");
      out.write("                                <li><i class=\"fa fa-bar-chart\"></i><a href=\"ui-buttons.html\">Lớp học</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("\n");
      out.write("                </div><!-- /.navbar-collapse -->\n");
      out.write("            </nav>\n");
      out.write("        </aside>\n");
      out.write("        <!-- /#left-panel -->\n");
      out.write("        <!-- Right Panel -->\n");
      out.write("        <div id=\"right-panel\" class=\"right-panel\">\n");
      out.write("\n");
      out.write("            <!-- Header-->\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            <!-- /#header -->\n");
      out.write("\n");
      out.write("            <!-- Content -->\n");
      out.write("            <div class=\"content\">\n");
      out.write("                <!-- Animated -->\n");
      out.write("                <div class=\"animated fadeIn\">\n");
      out.write("                    <!-- Widgets  -->\n");
      out.write("\n");
      out.write("                    <!-- /Widgets -->\n");
      out.write("                    <!--  Traffic  -->\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-lg-12\">\n");
      out.write("                            <div class=\"card\">\n");
      out.write("                                <div class=\"card-body\">\n");
      out.write("                                    <h4 class=\"box-title\">Traffic </h4>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"row\">\n");
      out.write("                                    <div class=\"col-lg-8\">\n");
      out.write("                                        <div class=\"card-body\">\n");
      out.write("                                            <h1 align=\"center\" style=\"color: #0000ff\" style=\"margin-top:100px\">CHI TIẾT GIÁO VIÊN</h1>\n");
      out.write("                                            <form>\n");
      out.write("                                                <table width=\"800\" height=\"450\" border=\"1\" align=\"center\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"#FFFFFF\" bordercolor=\"#0000FF\" style=\"border-collapse: collapse; border-radius:10px\">\n");
      out.write("\n");
      out.write("                                                    <tr align=\"center\" bgcolor=\"#CCCCCC\" style=\"border-radius:10px; font-size:16px\">\n");
      out.write("                                                        <td height=\"60px\" width=\"200px\"><b>Mã Số Giáo Viên</b></td>\n");
      out.write("                                                        <td height=\"60px\" width=\"200px\"><b>Tên Giáo Viên</b></td>\n");
      out.write("                                                        <td height=\"60px\" width=\"200px\"><b>Chi Tiết</b></td>\n");
      out.write("                                                    </tr>\n");
      out.write("\n");
      out.write("                                                    ");
      out.write("\n");
      out.write("                                                    ");

                                                        try {
                                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                            String connectionURL;
                                                            connectionURL = "jdbc:sqlserver://DESKTOP-KK4SMEM\\SQLEXPRESS:1433;instance=SQLEXPRESS;databaseName=QL_ChuanDauRa";
                                                            Connection conn = DriverManager.getConnection(connectionURL, "sa", "23051998");
                                                            String query = "Select * from GIAOVIEN,QUANLY,KHOA WHERE QUANLY.MAGV = GIAOVIEN.MAGV AND KHOA.MAKHOA = GIAOVIEN.MAKHOA";
                                                            Statement stmt = conn.createStatement();
                                                            ResultSet rs = stmt.executeQuery(query);
                                                            while (rs.next()) {
                                                    
      out.write("\n");
      out.write("                                                    <tr align=\"center\">\n");
      out.write("                                                        <td>");
out.print(rs.getString(1));
      out.write("</td>\n");
      out.write("                                                        <td>");
out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                                                        <td align=\"center\" width=\"200px\">\n");
      out.write("                                                            <button type=\"button\" class=\"btn btn-primary btn-sm\" data-toggle=\"modal\" data-target=\"#myModal\">\n");
      out.write("                                                                Thông Tin\n");
      out.write("                                                            </button>\n");
      out.write("\n");
      out.write("                                                            <!-- Modal -->\n");
      out.write("\n");
      out.write("                                                            <div class=\"modal fade\" id=\"myModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\n");
      out.write("                                                                <div class=\"modal-dialog\">\n");
      out.write("                                                                    <div class=\"modal-content\">\n");
      out.write("                                                                        <div class=\"modal-header\">\n");
      out.write("                                                                            <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n");
      out.write("                                                                            <h4 class=\"modal-title\" id=\"myModalLabel\">Thông Tin Giáo Viên</h4>\n");
      out.write("                                                                        </div>\n");
      out.write("                                                                        <div class=\"modal-body\">\n");
      out.write("                                                                            <table width=\"570\" height=\"100\" border=\"1\" align=\"center\" cellspacing=\"0\" cellpadding=\"5\" bgcolor=\"#FFFFFF\" bordercolor=\"#0000FF\" style=\"border-collapse: collapse; border-radius:10px\">\n");
      out.write("                                                                                <tr>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\" width=\"250px\"><label for=\"edit-hoten-\">1. HỌ VÀ TÊN : </label></td>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\">");
out.print(rs.getString(1));
      out.write("</td>\n");
      out.write("                                                                                </tr>\n");
      out.write("                                                                                <tr>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\">\n");
      out.write("                                                                                        <label for=\"edit-hoten-\">2. MÃ SỐ GIÁO VIÊN : </label></td>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\">");
out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                                                                                </tr>\n");
      out.write("                                                                                <tr>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\">\n");
      out.write("                                                                                        <label for=\"edit-hoten-\">3. KHOA : </label></td>\n");
      out.write("                                                                                    <td style=\"padding-left:10px\">");
out.print(rs.getString("TENKHOA"));
      out.write("</td>\n");
      out.write("                                                                                </tr>\n");
      out.write("                                                                            </table>\n");
      out.write("                                                                            </p>\n");
      out.write("\n");
      out.write("                                                                            <canvas id=\"buyers1\" width=\"500\" height=\"400\"></canvas> \n");
      out.write("                                                                            <script>\n");
      out.write("\n");
      out.write("                                                                                // line chart data\n");
      out.write("                                                                                var buyerData = {\n");
      out.write("                                                                                    labels: [\"January\", \"February\", \"March\", \"April\", \"May\", \"June\"],\n");
      out.write("                                                                                    datasets: [\n");
      out.write("                                                                                        {\n");
      out.write("                                                                                            fillColor: \"rgba(172,194,132,0.4)\",\n");
      out.write("                                                                                            strokeColor: \"#ACC26D\",\n");
      out.write("                                                                                            pointColor: \"#fff\",\n");
      out.write("                                                                                            pointStrokeColor: \"#9DB86D\",\n");
      out.write("                                                                                            data: [203, 156, 99, 251, 305, 247]\n");
      out.write("                                                                                        }\n");
      out.write("                                                                                    ]\n");
      out.write("                                                                                };\n");
      out.write("\n");
      out.write("                                                                                // get line chart canvas\n");
      out.write("                                                                                var buyers = document.getElementById('buyers1').getContext('2d');\n");
      out.write("\n");
      out.write("                                                                                // draw line chart\n");
      out.write("                                                                                new Chart(buyers).Line(buyerData);\n");
      out.write("                                                                            </script>\n");
      out.write("\n");
      out.write("                                                                        </div>\n");
      out.write("                                                                        <div class=\"modal-footer\">\n");
      out.write("                                                                            <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n");
      out.write("                                                                        </div>\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                </div>\n");
      out.write("                                                            </div>\n");
      out.write("                                                        </td>\n");
      out.write("                                                    </tr>\n");
      out.write("\n");
      out.write("                                                    ");

                                                            }
                                                            rs.close();
                                                            stmt.close();
                                                            conn.close();
                                                        } catch (Exception ex) {
                                                            ex.printStackTrace();
                                                        }
                                                    
      out.write("                                            \n");
      out.write("                                                    </div>\n");
      out.write("                                                    </div>\n");
      out.write("\n");
      out.write("                                                    </div> <!-- /.row -->\n");
      out.write("                                                    <div class=\"card-body\"></div>\n");
      out.write("                                                    </div>\n");
      out.write("                                                    </div><!-- /# column -->\n");
      out.write("                                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <!-- .animated -->\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <!-- /.content -->\n");
      out.write("                                                    <div class=\"clearfix\"></div>\n");
      out.write("                                                    <!-- Footer -->\n");
      out.write("                                                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("                                                    <!-- /.site-footer -->\n");
      out.write("                                                    </div>\n");
      out.write("                                                    <!-- /#right-panel -->\n");
      out.write("\n");
      out.write("                                                    <!-- Scripts -->\n");
      out.write("                                                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "scripts.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("                                                    <!--Local Stuff-->\n");
      out.write("                                                    <script>\n");
      out.write("\n");
      out.write("                                                    </script>\n");
      out.write("                                                    </body>\n");
      out.write("                                                    </html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
