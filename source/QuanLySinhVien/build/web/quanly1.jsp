<%-- 
    Document   : index
    Created on : May 3, 2019, 7:35:06 PM
    Author     : nguyenmao
--%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <jsp:include page="head.jsp" />
    </head>

    <body>
        <!-- Left Panel -->
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <% String role = (String) request.getAttribute("role");%>
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="/homepage"><i class="menu-icon fa fa-laptop"></i>Thông tin sinh viên</a>
                        </li>
                        <li class="menu-title">Bảng điều khiển</li><!-- /.menu-title -->
                        <li class="">
                            <a href="#"><i class="menu-icon fa fa-fire"></i>Kết quả học tập</a>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-cogs"></i>Quá trình học tập</a>
                            <ul class="sub-menu children dropdown-menu">                            
                                <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Chuẩn đầu ra</a></li>
                                <li><i class="fa fa-bar-chart"></i><a href="ui-buttons.html">Lớp học</a></li>
                            </ul>
                        </li>
                    </ul>

                </div><!-- /.navbar-collapse -->
            </nav>
        </aside>
        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">

            <!-- Header-->
            <jsp:include page="header.jsp"/>
            <!-- /#header -->

            <!-- Content -->
            <div class="content">
                <!-- Animated -->
                <div class="animated fadeIn">
                    <!-- Widgets  -->

                    <!-- /Widgets -->
                    <!--  Traffic  -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">Traffic </h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="card-body">
                                            <h1 align="center" style="color: #0000ff" style="margin-top:100px">CHI TIẾT GIÁO VIÊN</h1>
                                            <form>
                                                <table width="800" height="450" border="1" align="center" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF" bordercolor="#0000FF" style="border-collapse: collapse; border-radius:10px">

                                                    <tr align="center" bgcolor="#CCCCCC" style="border-radius:10px; font-size:16px">
                                                        <td height="60px" width="200px"><b>Mã Số Giáo Viên</b></td>
                                                        <td height="60px" width="200px"><b>Tên Giáo Viên</b></td>
                                                        <td height="60px" width="200px"><b>Chi Tiết</b></td>
                                                    </tr>

                                                    <%-- Kết nối CSDL --%>
                                                    <%
                                                        try {
                                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                            String connectionURL;
                                                            connectionURL = "jdbc:sqlserver://DESKTOP-KK4SMEM\\SQLEXPRESS:1433;instance=SQLEXPRESS;databaseName=QL_ChuanDauRa";
                                                            Connection conn = DriverManager.getConnection(connectionURL, "sa", "23051998");
                                                            String query = "Select * from GIAOVIEN,QUANLY,KHOA WHERE QUANLY.MAGV = GIAOVIEN.MAGV AND KHOA.MAKHOA = GIAOVIEN.MAKHOA";
                                                            Statement stmt = conn.createStatement();
                                                            ResultSet rs = stmt.executeQuery(query);
                                                            while (rs.next()) {
                                                    %>
                                                    <tr align="center">
                                                        <td><%out.print(rs.getString(1));%></td>
                                                        <td><%out.print(rs.getString(2));%></td>
                                                        <td align="center" width="200px">
                                                            <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                                                                Thông Tin
                                                            </button>

                                                            <!-- Modal -->

                                                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                            <h4 class="modal-title" id="myModalLabel">Thông Tin Giáo Viên</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <table width="570" height="100" border="1" align="center" cellspacing="0" cellpadding="5" bgcolor="#FFFFFF" bordercolor="#0000FF" style="border-collapse: collapse; border-radius:10px">
                                                                                <tr>
                                                                                    <td style="padding-left:10px" width="250px"><label for="edit-hoten-">1. HỌ VÀ TÊN : </label></td>
                                                                                    <td style="padding-left:10px"><%out.print(rs.getString(1));%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="padding-left:10px">
                                                                                        <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
                                                                                    <td style="padding-left:10px"><%out.print(rs.getString(2));%></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="padding-left:10px">
                                                                                        <label for="edit-hoten-">3. KHOA : </label></td>
                                                                                    <td style="padding-left:10px"><%out.print(rs.getString("TENKHOA"));%></td>
                                                                                </tr>
                                                                            </table>
                                                                            </p>

                                                                            <canvas id="buyers1" width="500" height="400"></canvas> 
                                                                            <script>

                                                                                // line chart data
                                                                                var buyerData = {
                                                                                    labels: ["January", "February", "March", "April", "May", "June"],
                                                                                    datasets: [
                                                                                        {
                                                                                            fillColor: "rgba(172,194,132,0.4)",
                                                                                            strokeColor: "#ACC26D",
                                                                                            pointColor: "#fff",
                                                                                            pointStrokeColor: "#9DB86D",
                                                                                            data: [203, 156, 99, 251, 305, 247]
                                                                                        }
                                                                                    ]
                                                                                };

                                                                                // get line chart canvas
                                                                                var buyers = document.getElementById('buyers1').getContext('2d');

                                                                                // draw line chart
                                                                                new Chart(buyers).Line(buyerData);
                                                                            </script>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <%
                                                            }
                                                            rs.close();
                                                            stmt.close();
                                                            conn.close();
                                                        } catch (Exception ex) {
                                                            ex.printStackTrace();
                                                        }
                                                    %>                                            
                                                    </div>
                                                    </div>

                                                    </div> <!-- /.row -->
                                                    <div class="card-body"></div>
                                                    </div>
                                                    </div><!-- /# column -->
                                                    </div>


                                                    </div>
                                                    <!-- .animated -->
                                                    </div>
                                                    <!-- /.content -->
                                                    <div class="clearfix"></div>
                                                    <!-- Footer -->
                                                    <jsp:include page="footer.jsp"/>
                                                    <!-- /.site-footer -->
                                                    </div>
                                                    <!-- /#right-panel -->

                                                    <!-- Scripts -->
                                                    <jsp:include page="scripts.jsp"/>

                                                    <!--Local Stuff-->
                                                    <script>

                                                    </script>
                                                    </body>
                                                    </html>

