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
                                    <h4 class="box-title">Quản lý lớp học</h4>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <form action="/quanlysinhvien" method="POST">
                                                <select name="className" value="02">
                                                    <option value="01">IS201.J21</option>                                                    
                                                    <option value="02">IS201.J22</option>
                                                    <option value="03">IS201.J23</option>

                                                </select>
                                                <input type="submit" class="button" value="Quản lý"/>
                                            </form>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-12" style="overflow: auto; height: 500px">
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
            jQuery(document).ready(function ($) {
                "use strict";

                // Pie chart flotPie1
                var piedata = [
                    {label: "Desktop visits", data: [[1, 32]], color: '#5c6bc0'},
                    {label: "Tab visits", data: [[1, 33]], color: '#ef5350'},
                    {label: "Mobile visits", data: [[1, 35]], color: '#66bb6a'}
                ];

                $.plot('#flotPie1', piedata, {
                    series: {
                        pie: {
                            show: true,
                            radius: 1,
                            innerRadius: 0.65,
                            label: {
                                show: true,
                                radius: 2 / 3,
                                threshold: 1
                            },
                            stroke: {
                                width: 0
                            }
                        }
                    },
                    grid: {
                        hoverable: true,
                        clickable: true
                    }
                });
                // Pie chart flotPie1  End
                // cellPaiChart
                var cellPaiChart = [
                    {label: "Direct Sell", data: [[1, 65]], color: '#5b83de'},
                    {label: "Channel Sell", data: [[1, 35]], color: '#00bfa5'}
                ];
                $.plot('#cellPaiChart', cellPaiChart, {
                    series: {
                        pie: {
                            show: true,
                            stroke: {
                                width: 0
                            }
                        }
                    },
                    legend: {
                        show: false
                    }, grid: {
                        hoverable: true,
                        clickable: true
                    }

                });
                // cellPaiChart End
                // Line Chart  #flotLine5
                var newCust = [[0, 3], [1, 5], [2, 4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

                var plot = $.plot($('#flotLine5'), [{
                        data: newCust,
                        label: 'New Data Flow',
                        color: '#fff'
                    }],
                        {
                            series: {
                                lines: {
                                    show: true,
                                    lineColor: '#fff',
                                    lineWidth: 2
                                },
                                points: {
                                    show: true,
                                    fill: true,
                                    fillColor: "#ffffff",
                                    symbol: "circle",
                                    radius: 3
                                },
                                shadowSize: 0
                            },
                            points: {
                                show: true,
                            },
                            legend: {
                                show: false
                            },
                            grid: {
                                show: false
                            }
                        });
                // Line Chart  #flotLine5 End
                // Traffic Chart using chartist
                if ($('#traffic-chart').length) {
                    var chart = new Chartist.Line('#traffic-chart', {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                        series: [
                            [0, 18000, 35000, 25000, 22000, 0],
                            [0, 33000, 15000, 20000, 15000, 300],
                            [0, 15000, 28000, 15000, 30000, 5000]
                        ]
                    }, {
                        low: 0,
                        showArea: true,
                        showLine: false,
                        showPoint: false,
                        fullWidth: true,
                        axisX: {
                            showGrid: true
                        }
                    });

                    chart.on('draw', function (data) {
                        if (data.type === 'line' || data.type === 'area') {
                            data.element.animate({
                                d: {
                                    begin: 2000 * data.index,
                                    dur: 2000,
                                    from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                    to: data.path.clone().stringify(),
                                    easing: Chartist.Svg.Easing.easeOutQuint
                                }
                            });
                        }
                    });
                }
                // Traffic Chart using chartist End
                //Traffic chart chart-js
                if ($('#TrafficChart').length) {
                    var ctx = document.getElementById("TrafficChart");
                    ctx.height = 150;
                    var myChart = new Chart(ctx, {
                        type: 'line',
                        data: {
                            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                            datasets: [
                                {
                                    label: "Visit",
                                    borderColor: "rgba(4, 73, 203,.09)",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(4, 73, 203,.5)",
                                    data: [0, 2900, 5000, 3300, 6000, 3250, 0]
                                },
                                {
                                    label: "Bounce",
                                    borderColor: "rgba(245, 23, 66, 0.9)",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(245, 23, 66,.5)",
                                    pointHighlightStroke: "rgba(245, 23, 66,.5)",
                                    data: [0, 4200, 4500, 1600, 4200, 1500, 4000]
                                },
                                {
                                    label: "Targeted",
                                    borderColor: "rgba(40, 169, 46, 0.9)",
                                    borderWidth: "1",
                                    backgroundColor: "rgba(40, 169, 46, .5)",
                                    pointHighlightStroke: "rgba(40, 169, 46,.5)",
                                    data: [1000, 5200, 3600, 2600, 4200, 5300, 0]
                                }
                            ]
                        },
                        options: {
                            responsive: true,
                            tooltips: {
                                mode: 'index',
                                intersect: false
                            },
                            hover: {
                                mode: 'nearest',
                                intersect: true
                            }

                        }
                    });
                }
                //Traffic chart chart-js  End
                // Bar Chart #flotBarChart
                $.plot("#flotBarChart", [{
                        data: [[0, 18], [2, 8], [4, 5], [6, 13], [8, 5], [10, 7], [12, 4], [14, 6], [16, 15], [18, 9], [20, 17], [22, 7], [24, 4], [26, 9], [28, 11]],
                        bars: {
                            show: true,
                            lineWidth: 0,
                            fillColor: '#ffffff8a'
                        }
                    }], {
                    grid: {
                        show: false
                    }
                });
                // Bar Chart #flotBarChart End
            });
        </script>
    </body>
</html>
