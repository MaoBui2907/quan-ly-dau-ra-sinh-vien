<%-- 
    Document   : quanly
    Created on : May 23, 2019, 9:53:56 PM
    Author     : Cao Nam
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--@taglib prefix="f" uri="http://java.sun.com/jsf/core"--%>
<%--@taglib prefix="h" uri="http://java.sun.com/jsf/html"--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Lấy thông tin giáo viên</title>
    <meta charset="utf-8">     

    <script src="Chart.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body text="#000000" style="font-family: Arial, Helvetica, sans-serif;font-size: 13px">

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

            <%-- <tr align="center">
                    <td width="200px">DH065875</td>
                    <td width="200px">Nguyễn Thị Hoài</td>
                <td align="center" width="200px">
              <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1">
              Thông Tin
            </button>
             
            <!-- Modal -->
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <td style="padding-left:10px">.</td>
                    </tr>
                    <tr>
                    <td style="padding-left:10px">
                      <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
                      <td style="padding-left:10px">DH065875</td>
                      </tr>
                     <tr>
                     <td style="padding-left:10px">
                      <label for="edit-hoten-">3. KHOA : </label></td>
                      <td style="padding-left:10px">Khoa học máy tính</td>
                      </tr>
                    </table>
             </p>
             
                <canvas id="buyers1" width="500" height="400"></canvas> 
             <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
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



<tr align="center">
<td width="200px">DH698531</td>
        <td width="200px">Trần Thị Thuỳ Linh</td>
    <td align="center" width="200px">
   <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal2">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Trần Thị Thuỳ Linh</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH698531</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật phần mềm</td>
          </tr>
       	</table>
 </p>
 <canvas id="buyers2" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                    {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                    }
                ]
            };
        // get line chart canvas
        var buyers = document.getElementById('buyers2').getContext('2d');

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

<tr align="center">
        <td>DH796253</td>
        <td>Nguyễn Văn Tuấn</td>
   <td align="center" width="200px">
         <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal3">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Nguyễn Văn Tuấn</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH796253</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật máy tính</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers3" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers3').getContext('2d');

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

<tr align="center">
        <td>DH478963</td>
        <td>Trần Văn Minh</td>
    <td align="center" width="200px">
         <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal4">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Trần Văn Minh</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH478963</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Công nghệ thông tin</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers4" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers4').getContext('2d');

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

<tr align="center">
        <td>DH151754</td>
        <td>Trần Tuấn Tú</td>
    <td align="center" width="200px">
    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal5">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Trần Tuấn Tú</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH151754</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Khoa học máy tính</td>
          </tr>
       	</table>
        
        </p>
        <canvas id="buyers5" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers5').getContext('2d');

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

<tr align="center">
        <td>DH645398</td>
        <td>Trần Văn Thông</td>
    <td align="center" width="200px">
         <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal6">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Trần Văn Thông</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH645398</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật phần mềm</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers6" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers6').getContext('2d');

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

<tr align="center">
        <td>DH687542</td>
        <td>Nguyễn Tiến Dũng</td>
    <td align="center" width="200px">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal7">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Nguyễn Tiến Dũng</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH687542</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật máy tính</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers7" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers7').getContext('2d');

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

<tr align="center">
        <td>DH987632</td>
        <td>Nguyễn Phát Tài</td>
    <td align="center" width="200px">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal8">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Nguyễn Phát Tài</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH987632</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Công nghệ thông tin</td>
          </tr>
          </p>
       	</table>
        <canvas id="buyers8" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers8').getContext('2d');

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

<tr align="center">
        <td>DH675321</td>
        <td>Chính Minh Chu</td>
   <td align="center" width="200px">
        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal9">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Chính Minh Chu</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH675321</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật phần mềm</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers9" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers9').getContext('2d');

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

<tr align="center">
        <td>DH856121</td>
        <td>Hồ Trọng Thoại</td>
    <td align="center" width="200px">
   <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal10">
  Thông Tin
</button>
<!-- Modal -->
<div class="modal fade" id="myModal10" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
            <td style="padding-left:10px">Hồ Trọng Thoại</td>
        </tr>
        <tr>
        <td style="padding-left:10px">
          <label for="edit-hoten-">2. MÃ SỐ GIÁO VIÊN : </label></td>
          <td style="padding-left:10px">DH856121</td>
          </tr>
         <tr>
         <td style="padding-left:10px">
          <label for="edit-hoten-">3. KHOA : </label></td>
          <td style="padding-left:10px">Kỹ thuật máy tính</td>
          </tr>
       	</table>
        </p>
        <canvas id="buyers10" width="500" height="400"></canvas> 
 
 <script>

        // line chart data
        var buyerData = {
                labels : ["January","February","March","April","May","June"],
                datasets : [
                {
                                fillColor : "rgba(172,194,132,0.4)",
                                strokeColor : "#ACC26D",
                                pointColor : "#fff",
                                pointStrokeColor : "#9DB86D",
                                data : [203,156,99,251,305,247]
                        }
                ]
        };
        
        // get line chart canvas
        var buyers = document.getElementById('buyers10').getContext('2d');

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
</table>
</form>
</body>
</html> 
            <%--</f:view>--%>

