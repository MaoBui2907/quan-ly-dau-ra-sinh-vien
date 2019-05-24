<%-- 
    Document   : leftPanel
    Created on : May 3, 2019, 8:37:18 PM
    Author     : nguyenmao
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <% String role = (String) request.getAttribute("role");%>
            <c:choose>
                <c:when test="${role == \"student\"}">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="/homepage"><i class="menu-icon fa fa-laptop"></i>Thông tin sinh viên</a>
                        </li>
                        <li class="menu-title">Bảng điều khiển</li><!-- /.menu-title -->
                        <li class="">
                            <a href="/ketquahoctap"><i class="menu-icon fa fa-fire"></i>Kết quả học tập</a>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="/quatrinhhoctap" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-cogs"></i>Quá trình học tập</a>
                            <ul class="sub-menu children dropdown-menu">                            
                                <li><i class="fa fa-puzzle-piece"></i><a href="/chuandaura">Chuẩn đầu ra</a></li>
                                <li><i class="fa fa-bar-chart"></i><a href="/lophoc">Lớp học</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
                <c:when test="${role == \"teacher\" }">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="/homepage"><i class="menu-icon fa fa-laptop"></i>Thông tin giáo viên</a>
                        </li>
                        <li class="menu-title">Bảng điều khiển</li><!-- /.menu-title -->
                        <li class="">
                            <a href="#"><i class="menu-icon fa fa-fire"></i>Thống kê giảng dạy</a>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-cogs"></i>Quá trình học tập</a>
                            <ul class="sub-menu children dropdown-menu">                            
                                <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Quản lý lớp học</a></li>
                                <li><i class="fa fa-bar-chart"></i><a href="ui-buttons.html">Lớp học</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
                <c:when test="${role == \"dean\"}">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="/homepage"><i class="menu-icon fa fa-laptop"></i>Thông tin trưởng khoa</a>
                        </li>
                        <li class="menu-title">Bảng điều khiển</li><!-- /.menu-title -->
                        <li class="">
                            <a href="#"><i class="menu-icon fa fa-fire"></i>Thống kê giảng dạy</a>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-cogs"></i>Quá trình học tập</a>
                            <ul class="sub-menu children dropdown-menu">                            
                                <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Quản lý giáo viên</a></li>
                                <li><i class="fa fa-bar-chart"></i><a href="ui-buttons.html">Quản lý sinh viên</a></li>
                            </ul>
                        </li>
                    </ul>
                </c:when>
            </c:choose>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>