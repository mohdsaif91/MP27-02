<%-- 
    Document   : generateOrder
    Created on : Dec 29, 2019, 5:27:18 PM
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
        <title>Matrix Pharmacy Generate Discount</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
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
                                    <li><a href="getorders">Home</a></li>
                                    <li><a href="getorders">Orders</a></li>
                                    <li><a href="getMessage">User Message</a></li>
                                    <li><a href="Addcompany">ADD</a></li>
                                    <li><a href="UpdateandDelete">Update and Delete</a></li>
                                    <li class="active"><a href="generateOrder.jsp">Generate Discount</a></li>
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
            <div class="container">
                <div class="row mt-3">
                    <div class="col-2">
                        <button id="getdiscount" data-tip="5" onclick="getdis(this)" class="btn btn-danger lg">Discount 5 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="10" class="btn btn-success">Discount 10 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="15" class="btn btn-primary">Discount 15 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="20" class="btn btn-warning">Discount 20 %</button>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="25" class="btn btn-danger lg">Discount 25 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="30" class="btn btn-success">Discount 30 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="35" class="btn btn-primary">Discount 35 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="40" class="btn btn-warning">Discount 40 %</button>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="45" class="btn btn-danger lg">Discount 45 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="50" class="btn btn-success">Discount 50 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="55" class="btn btn-primary">Discount 55 %</button>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="60" class="btn btn-warning">Discount 60 %</button>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-2">
                        <button onclick="getdis(this)" data-tip="65" class="btn btn-danger">Discount 65 %</button>
                    </div>

                </div>
                <div class="row mt-5">
                    <div class="col-6 text-center">
                        <input type="text" class="input-group h4 text-center" placeholder="Discount Code" id="discountnum"/>
                    </div>
                    <div class="col-1"></div>
                    <div id="buff">Buffering....</div>
                    <div class="col-1"></div>
                    <div class="spinner-border" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
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
                                $('.spinner-border').hide();
                                $('#buff').hide();
                            });
                            function getdis(e) {
                                $('.spinner-border').show();
                                $('#buff').show();
                                var data = e.getAttribute('data-tip');
                                $.ajax({
                                    url: 'generateDiscount',
                                    data: {
                                        data: data
                                    }, success: function (response) {
                                        $('#buff').hide();
                                        $('.spinner-border').hide();
                                        $('#discountnum').val(response);
                                    }
                                });
                            }

        </script>

    </body>

</html>