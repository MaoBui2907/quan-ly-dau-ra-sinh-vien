<%-- 
    Document   : teacherManagement
    Created on : May 25, 2019, 1:36:58 PM
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
        <jsp:include page="../partials/head.jsp" />
        <style>
            .subject:hover {
                cursor: pointer
            }
            .header-fixed    { overflow: auto; height: 300px; }
            .header-fixed thead th { position: sticky; top: 0; }
            table  { border-collapse: collapse; width: 100%; }
            th, td { padding: 8px 16px; }
            th     { background: #ffffff; }
        </style>
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
                <div class="animated fadeIn row">
                    <div class="col-lg-12">
                        <div class="card border border-primary">
                            <div class="card-header">
                                <h4 class="box-title"><%= request.getSession().getAttribute("title")%></h4>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card-body">
                                            <div class="header-fixed" style="margin-top: 5px">
                                                <table id="teachers" class="table table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>MSGV</th>
                                                            <th>Họ tên</th>
                                                            <th>Học hàm</th>
                                                            <th>Học vị</th>
                                                            <th>Số lớp</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody id="teacherList">
                                                        
                                                    </tbody>
                                                </table>
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
                <div class="clearfix"></div>
                <!-- Footer -->
                <jsp:include page="../partials/footer.jsp"/>
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
            <jsp:include page="../partials/scripts.jsp"/>

            <!--Local Stuff-->
            <script>
                $jq(document).ready(function(){
                    $jq.ajax({
                        url: "/quanlygiaovien",
                        method: "post",
                        success: function(respone) {
                            $jq("#teacherList").html(respone)
                        }
                    })
                })

                $jq(".subject").click(function (e) {
                    $jq("#decriptionModal").modal('show');
                })
            </script>
    </body>
</html>