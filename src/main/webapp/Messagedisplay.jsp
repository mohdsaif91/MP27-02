<%-- 
    Document   : Messagedisplay
    Created on : Jan 29, 2020, 11:56:24 PM
    Author     : saif
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <title>Admin Home</title>
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
        <link rel="stylesheet" href="css/orderShow.css">
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
                                <a href="homeController" class="js-logo-clone">Pharma</a>
                                <div class="mr-3 text-danger" id="design"><h6>${paymsg}</h6></div>
                            </div>
                        </div>

                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li class="active"><a href="getorders">Home</a></li>
                                    <li><a href="getorders">Orders</a></li>
                                    <li><a href="Addcompany">ADD</a></li>
                                    <li><a href="UpdateandDelete">Update and Delete</a></li>
                                    <li><a href="generateOrder.jsp">Generate Discount</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                    class="icon-menu"></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid" id="dispdetials">
                <div class="row" >
                    <c:forEach items="${mesgd}" var="op">
                        <div class="container">
                            <div class="view-account">
                                <section class="module">
                                    <div class="module-inner">
                                        <div class="row">
                                            <div class="col-3"></div>
                                            <div class="col-4">
                                                <div class="title lead text-center">
                                                    <b>Message Information</b>
                                                </div>
                                            </div>
                                            <div class="col-4"></div>
                                        </div>
                                        <div class="row fieldset-title title ml-2 mt-3">
                                            <h6 class="col-lg-4  col-md-6 col-sm-5">User Name-><span class="label text-uppercase text-danger label-color-4">${op.username}</span></h6>
                                            <h6 class="col-lg-4 col-md-6 col-sm-7">Message Id-><span class=" label label-warning text-danger" id="orderid"> ${op.id}</span></h6>
                                            <h6 class="col-lg-4 col-md-4 col-sm-6"><small>Email id-></small> <span class="label  text-danger label-color-4">${op.email}</span></h6>
                                        </div>
                                        <div class="row fieldset-title title ml-2 mt-3">
                                            <h6 class="col-lg-4  col-md-6 col-sm-5">First Name-><span class="label text-uppercase text-danger label-color-4">${op.firstname}</span></h6>
                                            <h6 class="col-lg-4 col-md-6 col-sm-7">Last Name-><span class=" label label-warning text-danger" id="orderid"> ${op.lastname}</span></h6>
                                        </div>
                                        <div class="row fieldset-title title ml-2 mt-3">
                                            <h6 class="col-lg-4  col-md-6 col-sm-5">Subject-><span class="label text-uppercase text-danger label-color-4">${op.subject}</span></h6>
                                        </div>
                                        <div class="row fieldset-title title ml-2 mt-3">
                                            <h6 class="col-lg-12  col-md-12 col-sm-12">Message-><span class="label text-uppercase text-danger label-color-4">${op.message}</span></h6>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </c:forEach>
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
                var p = $('#pay').text();
                if (p === 'yes') {
                    $('#sendthedata').val('Send It To package department');
                    $('#sendthedata').addClass('btn btn-primary');
                    $('#dispdetials').addClass('text-warning');
                } else {
                    $('#sendthedata').val('Send Payment Request');
                    $('#sendthedata').addClass('btn btn-danger');
                }
            });
            $('#sendthedata').click(function () {
                var id = document.getElementById("orderid").textContent;
                var payed = document.getElementById("pay").textContent;
                document.location.href = "PaymentRequestSend?orderid=" + id + "&payed=" + payed;
            });


        </script>
    </body>
</html>
