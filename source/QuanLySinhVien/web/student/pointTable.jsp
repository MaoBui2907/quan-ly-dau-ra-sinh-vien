<%-- 
    Document   : pointTable
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
              <h4 class="box-title"><%= request.getSession().getAttribute("title")%></h4>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-12">
                      <table id="points" class="table table-hover border border-default">
                        <thead>
                          <tr>
                            <th scope="col">Học kỳ</th>
                            <th scope="col">Mã môn</th>
                            <th scope="col">Tên môn</th>
                            <th scope="col">Điểm QT</th>
                            <th scope="col">Điểm GK</th>
                            <th scope="col">Điểm TH</th>
                            <th scope="col">Điểm CK</th>
                            <th scope="col">Điểm HP</th>
                          </tr>
                        </thead>
                        <tbody id="pointTable">

                        </tbody>
                      </table>
                    </div>
                    <div id='loading' class="col-lg-12 text-center">
                      <div class="spinner-border text-primary" role="status">
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="col-12">
                        <form>
                          <div class="row justify-content-center">
                            <div class="col-md-3 align-self-center">
                              <button id="exportList" class="btn btn-outline-primary" style="margin-top:30px">Xuất bảng
                                điểm</button>
                            </div>
                          </div>
                        </form>
                      </div>
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
  </div>
  <!-- /#right-panel -->

  <!--modal-->
  <div class="modal fade" id="decriptionModal">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>
  <!-- Scripts -->
  <jsp:include page="../partials/scripts.jsp" />

  <!--Local Stuff-->
  <script>
    $jq("#exportList").click(function (e) {
      $jq('#points').table2csv({
        header_body_space: 0
      });
    })
    $jq(document).ready(function () {
      $jq.ajax({
        url: "/bangdiemsinhvien",
        method: "post",
        data: {},
        success: function (respone) {
          $jq("#pointTable").html(respone)
          $jq("#loading").hide()
        }
      });
      $jq("tr.object").click(function (e) {
        e.preventDefault();
        $jq("#decriptionModal").modal('show');
      })
    })
  </script>
</body>

</html>