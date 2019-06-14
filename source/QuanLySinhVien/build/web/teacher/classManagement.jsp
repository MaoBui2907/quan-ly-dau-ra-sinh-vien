<%-- 
    Document   : studentManagement
    Created on : May 5, 2019, 12:53:02 PM
    Author     : nguyenmao
--%>

<%@page import="java.util.ArrayList"%>
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
        .header-fixed {
            overflow: auto;
            max-height: 350px;
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

    <%@page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement"%>
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
            <div class="animated fadeIn">
                <!--  Traffic  -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="box-title">QUẢN LÝ LỚP HỌC</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <form action="" method="">
                                            <div class="row form-group">
                                                <div class="col-md-2 offset-md-2 col-sm-12">
                                                    <label class="form-control-label" for="year">Lớp học</label>
                                                </div>
                                                <div class="col-md-4 col-sm-12">
                                                    <select class="form-control" name="class" id="class" value="">
                                                        <option value="">--Chọn lớp--</option>
                                                        <%
                                                                ArrayList<String> classList = (ArrayList<String>) request.getSession().getAttribute("classes");
                                                                for (String className : classList) {
                                                            %>
                                                        <option value="<%=className%>"><%=className%></option>
                                                        <%
                                                                }
                                                            %>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-2 col-sm-12">
                                                    <button type="submit" class="form-control btn btn-primary manage"
                                                        style="">Quản lý</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-12" style="margin-top: 10px">
                                        <label style="">Danh sách sinh viên</label>
                                        <div class="header-fixed" style="margin-top: 5px">
                                            <table id="students" class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>MSSV</th>
                                                        <th>Họ tên</th>
                                                        <th>Điểm quá trình</th>
                                                        <th>Điểm thực hành</th>
                                                        <th>Điểm giữa kỳ</th>
                                                        <th>Điểm cuối kỳ</th>
                                                        <th>Điểm TB</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="studentList">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div id='loading' class="col-12 text-center" style="display: none">
                                        <div class="spinner-border text-primary" role="status">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-md-5 col-sm-12">
                                                <form>
                                                    <input id="filecsv" class="form-control" type="file" hidden />
                                                    <button id="pointUpdate" class="btn btn-outline-info float-right"
                                                        style="margin-top:30px">
                                                        <span id="uploading" class="spinner-border spinner-border-sm"
                                                            role="status" aria-hidden="true"
                                                            style="display: none"></span>
                                                        Cập nhật điểm thi
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="col-md-7 col-sm-12">
                                                <button id="exportList" class="btn btn-outline-primary"
                                                    style="margin-top:30px">Xuất
                                                    danh sách sinh viên</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div>
            <!--  /Traffic -->
        </div>
        <!-- .animated -->
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <jsp:include page="../partials/footer.jsp" />
    </div>
    <!-- /.site-footer -->
    <!-- /#right-panel -->
    <form id='form' enctype="multipart/form-data">
        <input id='pointUpload' type='file' hidden />
    </form>
    <!-- Scripts -->
    <jsp:include page="../partials/scripts.jsp" />

    <!--Local Stuff-->
    <script>
        $jq("#exportList").click(function (e) {
            $jq('#students').table2csv({
                header_body_space: 0
            });
        })

        function processData(allText) {
            var allTextLines = allText.split(/\r\n|\n/);
            var headers = allTextLines[0].split(',');
            var lines = [];
            for (var i = 1; i < allTextLines.length; i++) {
                textList = allTextLines[i].split(',');
                lines.push("UPDATE BANGDIEM SET DIEMQT=" + textList[2] +
                    ", DIEMTH=" + textList[3] + ", DIEMGK=" + textList[4] +
                    ", DIEMCK=" + textList[5] + ", DIEMTB=" + textList[6] + " WHERE MSSV='" + textList[0] +
                    "' AND MALOPHOC='" + $jq("#class").val().substring(0, 9) + "' AND HOCKY=" + $jq("#class").val()
                    .substring(14, 15) +
                    " AND NAMHOC=" + $jq("#class").val().substring(16, 20))
            }
            return lines;
        }
        $jq("#pointUpdate").click(function (e) {
            e.preventDefault();
            $jq('#filecsv').click();

        })
        $jq('#filecsv').change(function () {
            var data = []
            var file = $jq('#filecsv').prop('files')[0];
            const reader = new FileReader()
            reader.onloadend = function (event) {
                data = processData(event.target.result);
                $jq.ajax({
                    url: "/capnhatdiem",
                    method: "post",
                    dataType: "json",
                    data: {
                        update: data,
                        class: $jq("#class").val()
                    },
                    beforeSend: function () {
                        $jq("#uploading").show()
                    },
                    complete: function (respone) {
                        $jq("#uploading").hide()
                        $jq(".manage").click()
                    }
                })

            }
            reader.readAsText(file)
        })
        $jq('.manage').click(function (e) {
            e.preventDefault();
            $jq.ajax({
                url: "/quanlylophoc",
                method: "post",
                data: {
                    "class": $jq("#class").val()
                },
                beforeSend: function () {
                    $jq("#studentList").html("")
                    $jq("#loading").show()

                },
                success: function (respone) {
                    $jq("#studentList").html(respone)
                    $jq("#loading").hide()
                }
            })
        })
    </script>
</body>

</html>