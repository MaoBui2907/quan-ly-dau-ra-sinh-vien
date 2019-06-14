<%-- 
    Document   : outcomeStatistic
    Created on : May 25, 2019, 10:58:06 AM
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
    .subject:hover {
      cursor: pointer
    }
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
          <div class="card border border-primary">
            <div class="card-header">
              <h4 class="box-title">Thống kê các chuẩn đầu ra</h4>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-5 col-sm-12">
                      <div class="row">
                        <hr />
                        <div id='outcomes' class="col-lg-12">
                          <%= session.getAttribute("progress") %>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-7 col-sm-12">
                      <canvas id="outcomeChart"></canvas>
                    </div>
                  </div>
                </div>
              </div>
            </div> <!-- /.row -->
          </div>
        </div><!-- /# column -->
        <!--  /Traffic -->
      </div>
      <!-- .animated -->
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
      var data = '<%= session.getAttribute("totalOutcome") %>'
      var ctx = document.getElementById("outcomeChart");
      ctx.height = 200;
      var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          datasets: [{
            data: [data, 100 - data],
            backgroundColor: [
              "red",
              "gray"
            ],
            hoverBackgroundColor: [
              "red",
              "gray",
            ]
          }],
          labels: [
            "Đã đạt",
            "Chưa đạt"
          ]
        },
        options: {
          responsive: true,
          legend: {
            display: false,
            position: 'top',
            labels: {
              usePointStyle: true,
              fontFamily: 'Montserrat',
            },
          },
          title: {
            display: true,
            text: "Tiến trình đầu ra đã đạt được",
            position: "bottom"
          }
        },
      });
    </script>
</body>

</html>