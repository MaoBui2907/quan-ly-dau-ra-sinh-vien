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
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <jsp:include page="../partials/head.jsp" />
        <style>
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


            <!-- Scripts -->
            <jsp:include page="../partials/scripts.jsp"/>

            <!--Local Stuff-->
            <script>

            </script>
    </body>
</html>