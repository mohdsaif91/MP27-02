<%-- 
    Document   : displayPackage
    Created on : Dec 4, 2019, 9:32:02 PM
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
        <title>Matrix Pharmacy</title>
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
            <div class="container-fluid" id="dispdetials">
                <div class="row" >
                    <c:forEach items="${packageList}" var="op">
                        <div class="container">
                            <div class="view-account">
                                <section class="module">
                                    <div class="module-inner">
                                        <div class="side-bar">
                                            <div class="row">
                                                <div class="col-1"></div>
                                                <div class="col-10"><b class="text-center ">Product Information</b></div>
                                                <div class="col-1"></div>
                                            </div>
                                            <div class="user-info">
                                                <img class="img-profile img-circle img-responsive center-block" src="medicineimage/${op.imagename}" alt=""><br/>
                                                <ul class="media-body list list-unstyled">
                                                    <li class="name">
                                                        <label class="label label-color-1 "><h4>Quantity:- <o class="text-danger">${op.quantity}</o></h4></label>
                                                    </li>
                                                    <li>Product Id-> <o class="text-danger" >${op.productid}</o></li>
                                                    <li class="email"><a href="#"></a></li>
                                                    <li class="activity">Date-<o class="text-danger">${op.yyyy_mm_dd}</o>
                                                    (HH:MM:SS)</li>
                                                    <fieldset class="fieldset"></fieldset>
                                                    <li class="name ">
                                                        <label class="label label-color-1"><h6><small>Product Price-> </small> <o class="text-danger">${op.productprice}</o></h6></label>
                                                    </li>
                                                    <li><small>GenericName-> </small><o class="text-danger">${op.genericname}</o></li>
                                                    <li><small>CompanyName-> </small><o class="text-danger">${op.companyname}</o></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="content-panel">
                                            <div class="row">
                                                <div class="col-3"></div>
                                                <div class="col-4">
                                                    <div class="title lead text-center">
                                                        <b>Customer Information</b>
                                                    </div>
                                                </div>
                                                <div class="col-4"></div>
                                            </div>
                                            <div class="row fieldset-title title">
                                                <h6 class="col-lg-5 col-md-6 col-sm-5">Customer Name-> <span class="label text-uppercase text-danger label-color-4">${op.firstname} ${op.lastname}</span></h6>
                                                <h6 class="col-lg-7 col-md-6 col-sm-7">Order Id-><span class=" label label-warning text-danger" id="orderid"> ${op.id}</span></h6>
                                                <h6 class="col-12"></h6> 
                                                <h6 class="col-lg-3 col-md-4 col-sm-6 "><small>User Name-></small><span class="label  text-danger label-color-4"> ${op.username}</span></h6>
                                                <h6 class="col-lg-5 col-md-4 col-sm-6"><small>Email id-></small> <span class="label  text-danger label-color-4">${op.emailid}</span></h6>
                                                <h6 class="col-lg-4 col-md-4 col-sm-6"><small>Mobile-></small><span class="label  text-danger label-color-4">${op.mobilenum}</span></h6>
                                            </div>
                                            <div class="row text-center mtn">

                                            </div>

                                            <form class="form-horizontal">
                                                <div class="title lead text-center">
                                                    <b>Address Information</b>
                                                </div>
                                                <fieldset class="fieldset">
                                                    <div class="row text-center">
                                                        <label class="col-md-3 col-lg-5 col-sm-3 col-xs-12 text-black control-label"><h5><small>Address line 1 :-</small><o class="text-danger">${op.address1}</o></h5></label>
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h5><small>Address line 2 :-</small><o class="text-danger">${op.address2}</o></h5></label>
                                                    </div>
                                                    <div class="row text-center">
                                                        <label class="col-md-3 col-lg-3 col-sm-3 col-xs-12 text-black control-label"><h6><small>City :-</small><o class="text-danger">${op.city}</o></h6></label>
                                                        <label class="col-md-3 col-lg-3 col-sm-3 col-xs-12 text-black control-label"><h6><small>State :-</small><o class="text-danger">${op.state}</o></h6></label>
                                                        <label class="col-md-3 col-lg-3 col-sm-3 col-xs-12 text-black control-label"><h6><small>Country :-</small><o class="text-danger">${op.country}</o></h6></label>
                                                        <label class="col-md-3 col-lg-3 col-sm-3 col-xs-12 text-black control-label"><h6><small>ZipCode :-</small><o class="text-danger">${op.zipcode}</o></h6></label>
                                                    </div>
                                                </fieldset>
                                                <hr>
                                                <div class="row">
                                                    <div class="col-3"></div>
                                                    <div class="col-4">
                                                        <div class="title lead text-center">
                                                            <b>Payment Information</b>
                                                        </div>
                                                    </div>
                                                    <div class="col-4"></div>
                                                </div>
                                                <fieldset class="fieldset">
                                                    <div class="row">
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Payment Option-></small><o class="text-danger">${op.paymentoption}</o></h4></label>
                                                        <label class="label label-color-1"><h6><b>Product Price-></b><o class="text-danger"> ${op.productprice}</o></h6></label>
                                                    </div>
                                                    <div class="row ">
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Card Holder Name-></small><o class="text-danger">${op.cardHoldeName}</o></h4></label>
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Card Number-></small><o class="text-danger">${op.cardNumber}</o></h4></label>
                                                        <l class="col-6"></l>
                                                    </div>
                                                    <div class="row ">
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Expiry Date-></small><o class="text-danger">${op.expiryDate}</o></h4></label>
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Card CVV Number-></small><o class="text-danger">${op.cvvNumber}</o></h4></label>
                                                        <l class="col-6"></l>
                                                    </div>
                                                    <div class="row ">
                                                        <label class="col-md-3 col-lg-6 col-sm-3 col-xs-12 text-black control-label"><h4><small>Payment Status-></small><o class="text-danger" id="pay">${op.paymentdoen}</o></h4></label>
                                                    </div>
                                                </fieldset>
                                            </form>
                                            <div class="form-group">
                                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                                    <input type="submit" class="btn btn-secondary"  id="sendthedata" value="Back TO Order Table">
                                                </div>
                                            </div>

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
            $('#sendthedata').click(function () {
                document.location.href = "AdminOrder?pay=pack";
            });

        </script>
    </body>
</html>
