<%-- 
    Document   : studentManagement
    Created on : May 5, 2019, 12:53:02 PM
    Author     : nguyenmao
--%>

<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <jsp:include page="../partials/head.jsp" />

        <style>
            .header-fixed    { overflow: auto; height: 300px; }
            .header-fixed thead th { position: sticky; top: 0; }
            table  { border-collapse: collapse; width: 100%; }
            th, td { padding: 8px 16px; }
            th     { background: #ffffff; }
        </style>

        <%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement"%>
    </head>

    <body>
        <!-- Left Panel -->
        <jsp:include page="../partials/leftPanel.jsp"/>
        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">

            <!-- Header-->
            <jsp:include page="../partials/header.jsp"/>
            <!-- /#header -->

            <!-- Content -->
            <div class="content">
                <!-- Animated -->
                <div class="animated fadeIn">
                    <!--  Traffic  -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="box-title">QUẢN LÝ LỚP HỌC</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <form action="/quanlysinhvien" method="POST">
                                                <div class="row form-group">
                                                    <div class="col-md-2 offset-md-2 col-sm-12">
                                                        <label class="form-control-label" for="year">Lớp học</label>
                                                    </div>
                                                    <div class="col-md-4 col-sm-12">
                                                        <select class="form-control" name="class" id="year">
                                                            <%
                                                                ArrayList<String> classList = (ArrayList<String>) request.getSession().getAttribute("classes");
                                                                for (String className : classList) {
                                                            %>
                                                            <option value="<%=className%>"><%=className%></option>
                                                            <%
                                                                }
                                                            %>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-2 col-sm-12">
                                                        <button type="submit" class="form-control btn btn-primary" style="">Quản lý</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-12" style="margin-top: 10px">
                                            <label style="">Danh sách sinh viên</label>
                                            <div class="header-fixed" style="margin-top: 5px">
                                                <table class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>MSSV</th>
                                                            <th>Họ tên</th>
                                                            <th>Điểm quá trình</th>
                                                            <th>Điểm giữa kỳ</th>
                                                            <th>Điểm thực hành</th>
                                                            <th>Điểm cuối kỳ</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>312354</th>
                                                            <th>Đỗ Thị B</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Bùi Văn C</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>312354</th>
                                                            <th>Đỗ Thị B</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Bùi Văn C</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Nguyễn Văn A</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>312354</th>
                                                            <th>Đỗ Thị B</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr>
                                                        <tr>
                                                            <th>1652164</th>
                                                            <th>Bùi Văn C</th>
                                                            <th>9</th>
                                                            <th>8.5</th>
                                                            <th>8</th>
                                                            <th>9</th>
                                                        </tr> 
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <form action="/quanlysinhvien" method="POST">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <button id="pointUpdate" class="btn btn-outline-info float-right" style="margin-top:30px">Cập nhật điểm thi</button>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <button id="exportList" class="btn btn-outline-primary" style="margin-top:30px">Xuất danh sách sinh viên</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /# column -->
                </div>
                <!--  /Traffic -->

            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <jsp:include page="../partials/footer.jsp"/>
        <!-- /.site-footer -->
        <!-- /#right-panel -->

        <!-- Scripts -->
        <jsp:include page="../partials/scripts.jsp"/>

        <!--Local Stuff-->
        <script>
            $('#year').change(function () {
                $.ajax({
                    url: "/quanlylophoc",
                    method: "POST",
                    data: {
                        "class": $(this).val()},
                    success: function (result) {
                        console.log(result)
                    }
                })
            })
        </script>
    </body>
</html>
