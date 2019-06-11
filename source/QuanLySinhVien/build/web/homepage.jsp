<%-- 
    Document   : index
    Created on : May 3, 2019, 7:35:06 PM
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
        <jsp:include page="partials/head.jsp" />
        <style>
            .widget .card {
                height: 110px
            }
        </style>
    </head>

    <body>
        <!-- Left Panel -->
        <jsp:include page="partials/leftPanel.jsp"/>
        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">
            <!-- Header-->
            <jsp:include page="partials/header.jsp"/>
            <!-- /#header -->
            <!-- Content -->
            <div class="content">
                <!-- Animated -->
                <div class="animated fadeIn row">
                    <div class="row col-lg-12">
                        <div class="col-lg-3 col-md-6 widget">
                            <div class="card border border-primary">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-1">
                                            <i class="pe-7s-users"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">12</span></div>
                                                <div class="stat-heading">Giáo viên khoa</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 widget">
                            <div class="card border border-danger">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-1">
                                            <i class="pe-7s-study"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">70</span></div>
                                                <div class="stat-heading">Sinh viên khoa</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 widget">
                            <div class="card border border-default">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-1">
                                            <i class="pe-7s-notebook"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">2</span></div>
                                                <div class="stat-heading">Lớp giảng dạy</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 widget">
                            <div class="card border border-success">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-1">
                                            <i class="pe-7s-medal"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">98</span> %</div>
                                                <div class="stat-heading">TB Đạt chuẩn TN</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="card border border-primary">
                            <div class="card-header">
                                <h4 class="box-title"><%= request.getSession().getAttribute("title")%></h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-5 col-sm-12" style="padding: 10px 30px">
                                                <dl class="row">
                                                    <dt class="col-sm-5">
                                                        <i class="pe-7s-door-lock" style="color: blue"></i> MS</dt>
                                                    <dd class="col-sm-7"><%= request.getSession().getAttribute("id")%></dd>
                                                    <dt class="col-sm-5">
                                                        <i class="pe-7s-user" style="color: green"></i> Họ tên</dt>
                                                    <dd class="col-sm-7"><%= request.getSession().getAttribute("name")%></dd>
                                                    <dt class="col-sm-5">
                                                        <i class="pe-7s-network" style="color: blue"></i> Khoa</dt>
                                                    <dd class="col-sm-7"><%= request.getSession().getAttribute("faculty")%></dd>
                                                    <dt class="col-sm-5">
                                                        <i class="pe-7s-note" style="color: green"></i> Email</dt>
                                                    <dd class="col-sm-7"><%= request.getSession().getAttribute("email")%></dd>
                                                    <dt class="col-sm-5">
                                                        <i class="pe-7s-keypad" style="color: blue"></i> SDT</dt>
                                                    <dd class="col-sm-7"><%= '0' + (String) request.getSession().getAttribute("phone")%></dd>
                                                </dl>
                                            </div>
                                            <div class="col-md-7 col-sm-12" style="padding:0px 40px">
                                                <canvas id="analys-chart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- /.row -->
                        </div>
                    </div><!-- /# column -->
                    <!--  /Traffic -->
                    <!-- .animated -->
                </div>
                <!-- /.content -->
                <div class="clearfix"></div>
                <!-- Footer -->
                <jsp:include page="partials/footer.jsp"/>
                <!-- /.site-footer -->
            </div>
            <!-- /#right-panel -->

            <!-- Scripts -->
            <jsp:include page="partials/scripts.jsp"/>

            <!--Local Stuff-->
            <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>
            <script>
                var ctx = document.getElementById("analys-chart");
                ctx.height = 150;
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ["2012", "2013", "2014", "2015", "2016", "2017", "2018"],
                        type: 'line',
                        defaultFontFamily: 'Montserrat',
                        datasets: [{
                                label: "Tuyển sinh",
                                data: [0, 30, 15, 110, 50, 63, 120],
                                backgroundColor: 'transparent',
                                borderColor: 'rgba(220,53,69,0.75)',
                                borderWidth: 3,
                                pointStyle: 'circle',
                                pointRadius: 5,
                                pointBorderColor: 'transparent',
                                pointBackgroundColor: 'rgba(220,53,69,0.75)',
                            }, {
                                label: "Tốt nghiệp",
                                data: [0, 50, 40, 80, 35, 99, 80],
                                backgroundColor: 'transparent',
                                borderColor: 'rgba(40,167,69,0.75)',
                                borderWidth: 3,
                                pointStyle: 'circle',
                                pointRadius: 5,
                                pointBorderColor: 'transparent',
                                pointBackgroundColor: 'rgba(40,167,69,0.75)',
                            }]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            titleFontSize: 12,
                            titleFontColor: '#000',
                            bodyFontColor: '#000',
                            backgroundColor: '#fff',
                            titleFontFamily: 'Montserrat',
                            bodyFontFamily: 'Montserrat',
                            cornerRadius: 3,
                            intersect: false,
                        },
                        legend: {
                            display: false,
                            labels: {
                                usePointStyle: true,
                                fontFamily: 'Montserrat',
                            },
                        },
                        scales: {
                            xAxes: [{
                                    display: true,
                                    gridLines: {
                                        display: false,
                                        drawBorder: true
                                    },
                                    scaleLabel: {
                                        display: false,
                                        labelString: 'Month'
                                    }
                                }],
                            yAxes: [{
                                    display: true,
                                    gridLines: {
                                        display: false,
                                        drawBorder: true
                                    },
                                    scaleLabel: {
                                        display: true,
                                        labelString: 'Sinh viên'
                                    }
                                }]
                        },
                        title: {
                            display: true,
                            text: 'Số lượng sinh viên khoa các năm'
                        }
                    }
                });
            </script>
    </body>
</html>
