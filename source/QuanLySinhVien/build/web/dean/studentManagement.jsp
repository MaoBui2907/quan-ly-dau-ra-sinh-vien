<%-- 
    Document   : classManagement
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

        .header-fixed {
            overflow: auto;
            max-height: 420px;
        }

        .header-fixed thead th {
            position: sticky;
            top: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th,
        td {
            padding: 8px 16px;
        }

        th {
            background: #ffffff;
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
                                <div class="card-body row">
                                    <div class="header-fixed col-lg-12" style="margin-top: 5px">
                                        <table id="students" class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>MSSV</th>
                                                    <th>Họ tên</th>
                                                    <th>Lớp sinh hoạt</th>
                                                    <th>Số chuẩn đầu ra đã đạt</th>
                                                </tr>
                                            </thead>
                                            <tbody id="studentList">

                                            </tbody>
                                        </table>
                                    </div>
                                    <div id='loading' class="col-lg-12 text-center">
                                        <div class="spinner-border text-primary" role="status">
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
            <!-- Footer -->
            <!-- /.site-footer -->
        </div>
        <div class="clearfix"></div>
        <jsp:include page="../partials/footer.jsp" />
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
            $jq(document).ready(function () {
                $jq.ajax({
                    url: "/quanlysinhvien",
                    method: "post",
                    success: function (respone) {
                        $jq("#loading").hide()
                        $jq("#studentList").html(respone)
                    }
                })
            })

            $jq(".subject").click(function (e) {
                $jq("#decriptionModal").modal('show');
            })
        </script>
</body>

</html>