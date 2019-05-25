<%-- 
    Document   : change
    Created on : May 25, 2019, 1:45:50 PM
    Author     : nguyenmao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <jsp:include page="../partials/head.jsp"/>
    </head>
    <body class="bg-dark">
        <div class="sufee-login d-flex align-content-center flex-wrap">
            <div class="container">
                <div class="login-content">
                    <div class="login-logo">
                        <a href="/homepage">
                            <img class="align-content" src="images/logo.png" alt="">
                        </a>
                    </div>
                    <div class="login-form">
                        <form action="/changePassword" method="POST">
                            <div class="form-group">
                                <h5>Mật khẩu cũ <t style="color:red">*</t></h5>
                                <input type="password" class="form-control" name="oldPassword">
                            </div>
                            <div class="form-group">
                                <h5>Mật khẩu mới<t style="color:red">*</t></h5>
                                <input type="password" class="form-control" name="newPassword">
                            </div>
                            <div class="form-group">
                                <h5>Mật khẩu mới<t style="color:red">*</t></h5>
                                <input type="password" class="form-control" name="newPassword">
                            </div>
                            <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Đổi mật khẩu</button>
                            <div class="register-link m-t-15 text-center">
                                <p style="margin-top: 10px"> hoặc <a href="/login"> Đăng nhập</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../partials/scripts.jsp"/>
    </body>
</html>
