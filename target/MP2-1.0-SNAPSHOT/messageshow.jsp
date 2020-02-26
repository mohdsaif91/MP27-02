<%-- 
    Document   : messageshow
    Created on : Jan 29, 2020, 11:08:25 PM
    Author     : saif
--%>

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
        <title>Matrix Pharmacy Message</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 
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
            <div class="container">


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
                                        <li class="active"><a href="getMessage">User Message</a></li>
                                        <li><a href="Addcompany">ADD</a></li>
                                        <li><a href="UpdateandDelete">Update and Delete</a></li>
                                        <li><a href="generateOrder.jsp">Generate Discount</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row mt-3">
                        <div class="col-12 mr-1 ml-1">
                            <ul class="list-group">
                                <c:forEach items="${usermessage}" var ="op">
                                    <a href="#" class="list-group-item list-group-item-dark list-group-item-action flex-column align-items-start">
                                        <div class="d-flex w-100 justify-content-between">
                                            <h5 class="mb-1">${op.username}</h5>
                                            <small class="ogid">${op.id}</small>
                                        </div>
                                        <p class="mb-1">${op.subject}</p>
                                    </a>
                                </c:forEach>
                            </ul>
                        </div>
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
            $('.list-group-item').click(function () {
                var index = $(this).index();
                var id = document.getElementsByClassName("ogid")[index].innerHTML;
                document.location.href = "getMessage?getmsg='getit'&id=" + id;
            });
        </script>

    </body>
</html>
