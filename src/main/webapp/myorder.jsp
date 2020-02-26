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
        <title>Matrix Pharmacy About</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 

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
                        <input type="text" id="searchproduct" class="form-control" placeholder="Search product name and hit enter...">
                    </div>
                </div>
                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone"><img src="CompanyLog/logo .png"/></a>
                            </div>
                        </div>

                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="homeController">Home</a></li>
                                    <li><a href="product">Products</a></li>
                                    <li class="active"><a href="myOrders">My Orders</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                    <li><b>${username}</b></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" id="searchwords" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
                            <a href="CartShow" class="icons-btn d-inline-block bag">
                                <span class="icon-shopping-bag"></span>
                            </a>
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
            <div class="container">
                <div class="row">
                    <table class="table table-hover" id="loop" style="font-size: 15px;">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Image</th>
                                <th scope="col">Company Name</th>
                                <th scope="col">product Name</th>
                                <th scope="col">Product Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Packaging</th>
                                <th scope="col">Order Again.</th>
                            </tr>
                        </thead>
                        <c:forEach items="${allvalue}" var="op">
                            <tbody class="jackin">
                                <tr onclick="myfunction(this)">
                                    <th scope="row" >${op.id}</th>
                                    <td><image class="img-thumbnail" src="medicineimage/${op.image}"/></td>
                                    <td>${op.companyname}</td>
                                    <td>${op.productname}</td>
                                    <td>${op.price}</td>
                                    <td>${op.quantity}</td>
                                    <td>${op.packaging}</td>
                                    <td><button class="btn btn-primary" onclick="selectinput2()">Get It Again.</button></td>
                                    <td style="visibility: hidden">${op.productid}</td>
                                </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

                            <div class="block-7">
                                <h3 class="footer-heading mb-4">About Us</h3>
                                <p>A medicine cat has no time for doubt. Put your energy into today and stop worrying about the past.</p>
                            </div>

                        </div>
                        <div class="col-lg-3 mx-auto mb-5 mb-lg-0">
                            <h3 class="footer-heading mb-4">Quick Links</h3>
                            <ul class="list-unstyled">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="myOrders">My Orders</a></li>
                                <li><a href="signin.jsp">Sign In</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="block-5 mb-5">
                                <h3 class="footer-heading mb-4">Contact Info</h3>
                                <ul class="list-unstyled">
                                    <li class="phone"><a href="tel://+918886821109">+91 8886821109</a></li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                                with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank"
                                                                                         class="text-primary">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>
        <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
        <script type="text/javascript" src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
                                    function selectinput2() {
                                        var get, productid, quan, brandname, companyname;
                                        var cartdelete = "cartdelete";
                                        var rindex, table = document.getElementById('loop');
                                        for (var i = 0; i < table.rows.length; i++) {
                                            table.rows[i].onclick = function () {
                                                rindex = this.rowIndex;
                                                productid = this.cells[8].innerHTML;
                                                companyname = this.cells[2].innerHTML;
                                                brandname = this.cells[3].innerHTML;
                                                quan = this.cells[5].innerHTML;
                                                get = this.cells[0].innerHTML;
                                                document.location.href = "BookProduct?cartdelete=" + cartdelete + "&tablename=" + companyname + "&brandname=" + brandname + "&id=" + get + "&qun=" + quan + "&productid=" + productid;
                                            };
                                        }
                                    }
        </script>

    </body>

</html>