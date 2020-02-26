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
        <title>Matrix Pharmacy Payment Request</title>
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
            <div class="site-navbar py-2">
                <div class="search-wrap">
                    <div class="container">
                        <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
                        <form action="#" method="post">
                            <input type="text" class="form-control" placeholder="Search keyword and hit enter...">
                        </form>
                    </div>
                </div>
                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone">Pharma</a>
                            </div>
                        </div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li class="active"><a href="adminhome.jsp">Home</a></li>
                                    <li><a href="AdminOrder">Orders</a></li>
                                    <li><a href="Addcompany">ADD</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <table class="table table-hover" id="loop" style="font-size: 15px;">
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
                        <c:forEach items="${orderList}" var="op">
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
                </div>
            </div>

        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
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
                        document.location.href = "singin?orderid=" + get;
                    };
                }
            }

        </script>

    </body>

</html>