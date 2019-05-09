<%-- 
    Document   : studentManagement
    Created on : May 5, 2019, 12:53:02 PM
    Author     : nguyenmao
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <jsp:include page="head.jsp" />

        <style>
            .header-fixed    { overflow: auto; height: 300px; }
            .header-fixed thead th { position: sticky; top: 0; }
            table  { border-collapse: collapse; width: 100%; }
            th, td { padding: 8px 16px; }
            th     { background: #ffffff; }
        </style>

    </head>

    <body>
        <!-- Left Panel -->
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <% String role = (String) request.getAttribute("role");%>

                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="/homepage"><i class="menu-icon fa fa-laptop"></i>Thông tin giáo viên</a>
                        </li>
                        <li class="menu-title">Bảng điều khiển</li><!-- /.menu-title -->
                        <li class="">
                            <a href="#"><i class="menu-icon fa fa-fire"></i>Quá trình giảng dạy</a>
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

                    <!--  Traffic  -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">QUẢN LÝ LỚP HỌC</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <form action="/quanlysinhvien" method="POST">
                                                <div class="row">
                                                    <div class="form-group col-md-3 col-sm-12">
                                                        <label for="year">Năm học</label>
                                                        <select class="form-control " name="year" id="year" value="02">
                                                            <option value="">2018</option>                                                    
                                                            <option value="02">2019</option>
                                                            <option value="03">2020</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3 col-sm-12">
                                                        <label for="term">Học kỳ</label>
                                                        <select class="form-control " name="term" id="term" value="02">
                                                            <option value="01">1</option>                                                    
                                                            <option value="02">2</option>
                                                            <option value="03">3</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-3 col-sm-12">
                                                        <label for="classname">Lớp học</label>
                                                        <select class="form-control " name="classname" id="classname" value="02">
                                                            <option value="01">IS201.J21</option>                                                    
                                                            <option value="02">IS201.J22</option>
                                                            <option value="03">IS201.J23</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 col-sm-12">
                                                        <button type="submit" class="btn btn-primary" style="margin:30px 10px; width: 80%">Quản lý</button>
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
        <jsp:include page="footer.jsp"/>
        <!-- /.site-footer -->
        <!-- /#right-panel -->

        <!-- Scripts -->
        <jsp:include page="scripts.jsp"/>

        <!--Local Stuff-->
        <script>
            
        </script>
    </body>
</html>
