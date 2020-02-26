<%-- 
    Document   : adminhome
    Created on : Oct 10, 2019, 10:44:09 PM
    Author     : saif
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <title>Matrix Pharmacy Order Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 
        <link rel="stylesheet" href="css/style.css">
        <style>
            #loop{
                overflow: visible;
            }
            .img-thumbnail{
                height:70px;
                width:70px;
            } 
        </style>
    </head>

    <body>
        <div class="site-wrap">
            <div class="site-navbar py-2 ">
                <div class="search-wrap ">
                    <div class="container">
                        <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
                        <form action="#" method="post">
                            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
                        </form>
                    </div>
                </div>
                <div class="container-fluid ">
                    <div class="d-flex align-items-center justify-content-between ">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone">Matrix Pharma</a>
                            </div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-6 col-sm-2 col-md-4 text-danger"><h1>Package Orders</h1></div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="getorders">Home</a></li>
                                    <li><a href="getorders">Orders</a></li>
                                    <li><a href="getMessage">User Message</a></li>
                                    <li><a href="Addcompany">ADD</a></li>
                                    <li><a href="UpdateandDelete">Update and Delete</a></li>
                                    <li><a href="generateOrder.jsp">Generate Discount</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                    class="icon-menu"></span></a>

                            <a class="btn btn-primary dropdown-toggle" href="#" role="icon" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            </a>
                            <div class="dropdown-menu " aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="signin.jsp">Sign In</a>
                                <a class="dropdown-item" href="signin.jsp">Log Out</a>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-3 pb-2">
                                <input type="text" id="orderid"  placeholder="Order Id" class="form-control">
                            </div>
                            <div class="col-3 pb-2">
                                <input type="text" id="brandname"  placeholder="Brand Name" class="form-control">
                            </div>
                            <div class="col-3 pb-2">
                                <input type="text" id="companyname"  placeholder="Company Name" class="form-control">
                            </div>
                            <div class="col-3 pb-2">
                                <input type="text" id="firstname"  placeholder="First Name" class="form-control">
                            </div>
                        </div>
                    </div>
                    <table class="table table-danger table-responsive" id="loop" style="font-size: 15px;">
                        <thead>
                            <tr>
                                <th scope="col">Id(Click Here For more Info)</th>
                                <th scope="col">yyyy_mm_dd</th>
                                <th scope="col">Brand Name</th>
                                <th scope="col">Company Name</th>
                                <th scope="col">Image Name</th>
                                <th scope="col">Product Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                            </tr>
                        </thead>
                        <c:forEach items="${packageList}" var="op">
                            <tbody>
                                <tr>
                                    <th scope="row" class="idget text-danger">${op.id}</th>
                                    <td>${op.yyyy_mm_dd}</td>
                                    <td>${op.brandname}</td>
                                    <td>${op.companyname}</td>
                                    <td><image class="img-thumbnail" src="medicineimage/${op.imagename}"/></td>
                                    <td>${op.productprice}</td>
                                    <td>${op.quantity}</td>
                                    <td>${op.firstname}</td>
                                    <td>${op.lastname}</td>
                                    <td>${op.mobilenum}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                    <div class="col-12 col-sm-8 text-danger text-center mt-2">
                        <h3>${packagemsg}</h3>
                    </div>
                </div>
            </div>

        </div>
        <script type="text/javascript" src="vendor/select2/select2.min.js"></script>
        <script src="jquery.js"></script>
        <script src="jquery.form.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
            $('#orderid').change(function () {
                var orderid = $('#orderid').val();
                var data = 'orderid';
                helpGetData(orderid, data);
            });
            $('#brandname').change(function () {
                var barndname = $('#brandname').val();
                var data = 'brandname';
                helpGetData(barndname, data);
            });
            $('#companyname').change(function () {
                var companyname = $('#companyname').val();
                var data = 'companyname';
                helpGetData(companyname, data);
            });
            $('#firstname').change(function () {
                var firstname = $('#firstname').val();
                var data = 'firstname';
                helpGetData(firstname, data);
            });
            function helpGetData(data, searchby) {
                $.get('getDataForAdmin', {
                    data: data, searchby: searchby
                }, function (responsivetext) {
                    if (responsivetext !== null) {
                        $("#loop").find("tr:gt(0)").remove();
                        var tabledata = $("#loop");
                        $.each(responsivetext, function (key, value) {
                            var row = $('<tr onClick="getdata()"><th id="kill" class="idget text-danger"></th><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>');
                            row.children().eq(0).text(value['id']);
                            row.children().eq(1).text(value['yyyy_mm_dd']);
                            row.children().eq(2).text(value['brandname']);
                            row.children().eq(3).text(value['companyname']);
                            row.children().eq(4).text(value['imagename']);
                            row.children().eq(5).text(value['productprice']);
                            row.children().eq(6).text(value['quantity']);
                            row.children().eq(7).text(value['firstname']);
                            row.children().eq(8).text(value['lastname']);
                            row.appendTo(tabledata);
                        });
                    }
                });
            }
            $(document).ready(function () {
                selectrowinput();
            });
            function selectrowinput() {
                var get;
                var rindex, table = document.getElementById('loop');
                for (var i = 0; i < table.rows.length; i++) {
                    table.rows[i].onclick = function () {
                        rindex = this.rowIndex;
                        get = this.cells[0].innerHTML;
                        document.location.href = "PackageDisplay?orderid=" + get;
                    };
                }
            }
            function  getdata() {
                var get;
                var rindex, table = document.getElementById('loop');
                for (var i = 0; i < table.rows.length; i++) {
                    table.rows[i].onclick = function () {
                        rindex = this.rowIndex;
                        get = this.cells[0].innerHTML;
                        document.location.href = "PackageDisplay?orderid=" + get;
                    };
                }
            }
        </script>

    </body>

</html>