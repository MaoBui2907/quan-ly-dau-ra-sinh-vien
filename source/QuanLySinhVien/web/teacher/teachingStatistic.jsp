<%-- 
    Document   : TeachingStatic
    Created on : May 3, 2019, 7:35:06 PM
    Author     : nguyenmao
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->

<head>
  <jsp:include page="../partials/head.jsp" />
  <style>

  </style>
</head>

<body>
  <!-- Left Panel -->
  <jsp:include page="../partials/leftPanel.jsp" />
  <!-- /#left-panel -->
  <!-- Right Panel -->
  <div id="right-panel" class="right-panel">
    <!-- Header-->
    <jsp:include page="../partials/header.jsp" />
    <!-- /#header -->
    <!-- Content -->
    <div class="content">
      <!-- Animated -->
      <div class="animated fadeIn row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 col-sm-12">
              <div class="card border border-primary">
                <div class="card-header">
                  <h4 class="box-title">Thống kê môn học</h4>
                </div>
                <div class="card-body">
                  <canvas id="objectsChart"></canvas>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-sm-12">
              <div class="card border border-primary">
                <div class="card-header">
                  <h4 class="box-title">Thống kê quá trình</h4>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card-body">
                      <canvas id="teachingChart"></canvas>
                    </div>
                  </div>
                </div> <!-- /.row -->
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="card border border-primary">
            <div class="card-header">
              <h4 class="box-title">Thống kê cá nhân</h4>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="card-body">
                  <div class="row">
                    <div class="col-md-7 col-sm-12">
                      <dl class="row">
                        <dt class="col-sm-7">
                          <i class="pe-7s-door-lock" style="color: blue"></i> Tổng số lớp đã dạy</dt>
                        <dd class="col-sm-5"><%= request.getSession().getAttribute("total")%></dd>
                        <dt class="col-sm-7">
                          <i class="pe-7s-user" style="color: green"></i> Năm bắt đầu</dt>
                        <dd class="col-sm-5"><%= request.getSession().getAttribute("start")%>
                        </dd>
                        <dt class="col-sm-7">
                          <i class="pe-7s-network" style="color: blue"></i> Trung bình đạt chuẩn</dt>
                        <dd class="col-sm-5"><%= request.getSession().getAttribute("avgProgress")%>
                        </dd>
                        <dt class="col-sm-7">
                          <i class="pe-7s-note" style="color: green"></i> Quá trình cao nhất</dt>
                        <dd class="col-sm-5"><%= request.getSession().getAttribute("maxProgress")%>
                        </dd>
                        <dt class="col-sm-7">
                          <i class="pe-7s-keypad" style="color: blue"></i> Lớp đạt chuẩn cao nhất</dt>
                        <dd class="col-sm-5">
                          <%= (String) request.getSession().getAttribute("maxClass")%></dd>
                      </dl>
                    </div>
                    <div class="col-md-5 col-sm-12">
                      <canvas id="personalChart"></canvas>
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
    </div>
      <div class="clearfix"></div>
      <!-- Footer -->
      <jsp:include page="../partials/footer.jsp" />
      <!-- /.site-footer -->
    <!-- /#right-panel -->

    <!-- Scripts -->
    <jsp:include page="../partials/scripts.jsp" />

    <!--Local Stuff-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>
    <script>
      // object statis chart
      var ctx = document.getElementById("objectsChart");
      ctx.height = 200;
      var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
          datasets: [{
            data: <%= session.getAttribute("subjectDatas") %> ,
            backgroundColor: [
              "red",
              "blue",
              "green",
              "yellow",
              "gray",
              "purple"
            ],
            hoverBackgroundColor: [
              "red",
              "blue",
              "green",
              "yellow",
              "gray",
              "purple"
            ]

          }],
          labels: <%= session.getAttribute("subjectNames") %>
        },
        options: {
          responsive: true,
          legend: {
            display: true,
            position: 'top',
            labels: {
              usePointStyle: true,
              fontFamily: 'Montserrat',
            },
          },
          title: {
            display: true,
            text: "Tỉ lệ sô lớp giảng dạy theo môn",
            position: "bottom"
          }
        },
      });

      // teaching statis chart
      var ctt = document.getElementById("teachingChart");
      ctt.height = 200;
      var myChart = new Chart(ctt, {
        type: 'line',
        data: {
          labels: <%= session.getAttribute("years") %> ,
          type: 'line',
          defaultFontFamily: 'Montserrat',
          datasets: [{
            label: 'Tổng số lớp',
            data: <%= session.getAttribute("totalClass") %>,
            backgroundColor: 'transparent',
            borderColor: 'rgba(220,53,69,0.75)',
            borderWidth: 3,
            pointStyle: 'circle',
            pointRadius: 5,
            pointBorderColor: 'transparent',
            pointBackgroundColor: 'rgba(220,53,69,0.75)',
          },{
            label: 'Lớp TB đạt > 80%',
            data: <%= session.getAttribute("positiveClass") %>,
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
              ticks: {
                //                                        fixedStepSize: 1
              },
              scaleLabel: {
                display: true,
                labelString: 'Lớp'
              }
            }]
          },
          title: {
            display: true,
            text: 'Quá trình giảng dạy theo năm',
            position: "bottom"
          }
        }
      });

      // personal chart
      var ctp = document.getElementById("personalChart");
      ctp.height = 160;
      var myChart = new Chart(ctp, {
        type: 'radar',
        data: {
          datasets: [{
            data: [45, 25, 20, 10],
            backgroundColor: [
              "red",
              "blue",
              "green",
              "yellow"
            ],
            hoverBackgroundColor: [
              "red",
              "blue",
              "green",
              "yellow"
            ]

          }],
          labels: [
            "green",
            "green",
            "green"
          ]
        },
        options: {
          responsive: true,
          legend: {
            display: true,
            position: 'top',
            labels: {
              usePointStyle: true,
              fontFamily: 'Montserrat',
            },
          },
          title: {
            display: true,
            text: "Tỉ lệ sô lớp giảng dạy",
            position: "bottom"
          }
        },
      });
    </script>
</body>

</html>