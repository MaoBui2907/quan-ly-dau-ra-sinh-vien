<%-- 
    Document   : login
    Created on : May 3, 2019, 7:35:06 PM
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
                        <form action="/login" method="POST">
                            <div class="form-group">
                                <h5>Tên truy cập <t style="color:red">*</t></h5>
                                <input type="text" class="form-control" name="email">
                            </div>
                            <div class="form-group">
                                <h5>Mật khẩu <t style="color:red">*</t></h5>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Nhớ mật khẩu
                                </label>
                                <label class="pull-right">
                                    <a href="/forget">Quên mật khẩu?</a>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-success btn-flat m-b-30 m-t-30">Đăng nhập</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../partials/scripts.jsp"/>
    </body>
</html>
