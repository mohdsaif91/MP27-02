<%-- 
    Document   : shop.jsp
    Created on : Jan 15, 2020, 9:50:49 PM
    Author     : saif
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <title>Matrix Pharmacy Products</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">

        <link rel="icon"    href ="CompanyLog/icons8-medical-bag-96.png" type = "image/x-icon">  
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            k:hover{
                cursor: pointer;
            }
            @media only screen and (max-width: 500px) {
                body{
                    font-size: 8px;
                    text-transform: lowercase;
                }
            }
            @media only screen and (max-width: 851px) {
                body{
                    font-size: 10px;
                    text-transform: lowercase;
                }
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
                <div class="container"  style="height: 50% !important;">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone">
                                    <img src="CompanyLog/logo .png"/>
                                </a>
                            </div>
                        </div>
                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="getorders">Home</a></li>
                                    <li><a href="getorders">Orders</a></li>
                                    <li><a href="Addcompany">ADD</a></li>
                                    <li><a href="UpdateandDelete">Update and Delete</a></li>
                                    <li><a href="generateOrder.jsp">Generate Discount</a></li>
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
                    <div class="row mt-2">
                        <div class="col-3 col-sm-2 col-sm-push-2">
                            <div class="text-center text-danger">
                                <k><b>Category Name</b>(click on category)</k>
                            </div>
                            <div class="list-group text-xs-left">
                                <c:forEach items="${category}" var="cat">
                                    <k href="#" class="list-group-item list-group-item-action list-group-item-dark" id="name">
                                        <lo>${cat.companyname}</lo>
                                    </k>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-3 col-sm-2 col-sm-push-2">
                            <div class="text-center text-dark">
                                <k><b>Product Name</b>(click on product)</k>
                            </div>
                            <div id="subcatelist" class="text-left">
                            </div>
                        </div>
                        <div class="col-6 col-sm-8 col-sm-pull-6 ">
                            <!-- Tab panes -->
                            <div class="row">
                                <div class="col-6 text-center text-dark">
                                    <b>Product Information</b>
                                </div>
                                <div class="row text-center">
                                    <div class="col-8">
                                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                            <table class="table custom-table">
                                                <thead>
                                                <th>Product Information </th>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Company Name- <b class="text-black" id="companyname"></b></td>

                                                        <td>Generic Name- <b class="text-black" id="genericname"></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td>BrandName- <b class="text-black" id="brandname"></b></td>
                                                        <td>Product Price($)-<b class="text-black" id="productprice"></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Packaging- <b class="text-black" id="packaging"></b></td>
                                                        <td>Description- <po style="font-size: 8px" class="text-black" id="description"></po></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12"></div>
                                        <div class="col-6">
                                            <div class="card" style="width: 15rem">
                                                <div class="card-body">
                                                    <img class="card-img-top" id="imagecate" src="" alt="Card image cap">
                                                    <input type="file" name="imagenamepro" class="form-control-file" id="imageofpro" required="can't be null"/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 col-sm-push-6">
                                            <div class="mt-1">
                                                <button class="btn btn-info mt-5" id="updateproduct">Get Product</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3 p-1" style="visibility: hidden">
                                        <input type="text" name="id" class="form-control" id="king" required="can't be null" placeholder="Packaging">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
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
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script>
                                    $('#deletectegory').click(function () {
                                        var id = $('#cateid').val();
                                        var categoryName = $('#companynameedit').val();
                                        alert("<h5>By Deleting this Category All Products</h5>");
                                        $.ajax({
                                            url: 'myOrders',
                                            type: 'get',
                                            data: {
                                                id: id,
                                                deletecate: 'categorydelete',
                                                categoryName: categoryName
                                            }, sucess: function () {
                                                alert("category Delete");
                                            }
                                        });
                                    });
                                    $('#deleteproduct').click(function () {
                                        var id = $('#king').val();
                                        var catename = $('#companyname').val();
                                        $.ajax({
                                            url: 'myOrders',
                                            type: 'post',
                                            data: {
                                                id: id,
                                                catename: catename,
                                                type: 'deleteCate'
                                            }, sucess: function () {
                                                alert("delete");
                                            }
                                        });
                                    });
                                    $('#updateproduct').click(function () {
                                        $('form').submit(function (event) {
                                            event.preventDefault();
                                            $.ajax({
                                                url: $(this).attr('action'),
                                                type: $(this).attr('method'),
                                                data: new FormData(this),
                                                contentType: false,
                                                cache: false,
                                                processData: false,
                                                success: function (response) {
                                                    $('.center-block').html(response);
                                                }
                                            });

                                            return false;
                                        });
                                    });

                                    $('#updatecate').click(function () {
                                        alert("clicked");
                                        $('#cateform').submit(function (event) {
                                            event.preventDefault();
                                            $.ajax({
                                                url: $(this).attr('action'),
                                                type: $(this).attr('method'),
                                                data: new FormData(this),
                                                contentType: false,
                                                cache: false,
                                                processData: false,
                                                success: function (response) {
                                                    $('.center-block').html(response);
                                                }
                                            });
                                            event.preventDefault();
                                            return false;
                                        });
                                    });
                                    var subvalue = '';
                                    $('k').click(function () {
                                        var i = $(this).index();
                                        var name = document.getElementsByTagName('lo')[i].innerHTML;
                                        subvalue = name;
                                        $.post('UpdateandDelete', {tablename: name}, function (responsivetext) {
                                            if (responsivetext !== null) {
                                                var dj = $('#subcatelist');
                                                $('#subcatelist').empty();
                                                $.each(responsivetext, function (key, value) {
                                                    var putin = $('<div class="list-group" ><a id="subcatlisto" href="#" onClick="getsublist(event)"  class="list-group-item list-group-item-action list-group-item-info"></a></div>');
                                                    putin.children().text(value['brandname']);
                                                    putin.appendTo(dj);
                                                });
                                                getcateimage(name);
                                            } else {
                                                alert("Losses");
                                            }
                                        });
                                    });
                                    function getcateimage(names) {
                                        $.post('UpdateandDelete', {tabname: names}, function (responsivetext) {
                                            if (responsivetext !== null) {
                                                $.each(responsivetext, function (key, value) {
                                                    $('#imageedit').attr('src', 'CompanyName/' + value.companyImageName);
                                                    $('#cateid').val(value.id);
                                                    $('#companynameedit').val(value.companyname);
                                                });
                                            }
                                        });
                                    }
                                    function getsublist(event) {
                                        var i = event.target.innerHTML;
                                        $.get('UpdateandDelete', {subname: i, data: subvalue}, function (responsivetext) {
                                            if (responsivetext !== null) {
                                                $.each(responsivetext, function (key, value) {
                                                    $('#king').val(value.id);
                                                    $('#companyname').val(value.companyname);
                                                    $('#companyname').text(value.companyname);
                                                    $('#genericname').val(value.genericname);
                                                    $('#genericname').text(value.genericname);
                                                    $('#brandname').val(value.brandname);
                                                    $('#brandname').text(value.brandname);
                                                    $('#productprice').val(value.productprice);
                                                    $('#productprice').text(value.productprice);
                                                    $('#packaging').val(value.packaging);
                                                    $('#packaging').text(value.packaging);
                                                    $('#imagecate').attr('src', 'medicineimage/' + value.imagename);
                                                    $('#description').val(value.description);
                                                    $('#description').text(value.description);
                                                });
                                            }
                                        });
                                    }


        </script>

    </body>
</html>