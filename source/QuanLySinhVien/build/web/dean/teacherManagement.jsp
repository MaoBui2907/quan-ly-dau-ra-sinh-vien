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
                                        <table class="table table-hover border border-default">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Mã môn</th>
                                                    <th scope="col">Tên môn</th>
                                                    <th scope="col">Điểm QT</th>
                                                    <th scope="col">Điểm GK</th>
                                                    <th scope="col">Điểm TH</th>
                                                    <th scope="col">Điểm CK</th>                                                    
                                                    <th scope="col">Tổng kết</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="subject">
                                                    <th scope="row">IS201</th>
                                                    <td>Nhập môn độc dược</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>                                    
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                </tr>
                                                <tr class="subject">
                                                    <th scope="row">IS201</th>
                                                    <td>Nhập môn độc dược</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>                                    
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                </tr>
                                                <tr class="subject">
                                                    <th scope="row">IS201</th>
                                                    <td>Nhập môn độc dược</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>                                    
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                    <td>9.0</td>
                                                </tr>
                                            </tbody>
                                        </table>
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
                $jq(".subject").click(function (e) {

                    $jq("#decriptionModal").modal('show');
                })
            </script>
    </body>
</html>