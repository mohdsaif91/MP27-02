<%-- 
    Document   : updateanddelete
    Created on : Dec 9, 2019, 9:47:17 PM
    Author     : saif
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <title>Matrix Pharmacy Update & Delete</title>
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
            k:hover{
                cursor: pointer;
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
                                    <li class="active"><a href="UpdateandDelete">Update and Delete</a></li>
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
                    <div class="row mt-2">
                        <div class="col-3">
                            <div class="text-center text-danger">
                                <b>Category Name</b>
                            </div>
                            <div class="list-group text-center">
                                <c:forEach items="${category}" var="cat">
                                    <k href="#" class="list-group-item list-group-item-action list-group-item-dark"  id="name">
                                        <lo>${cat.companyname}</lo>
                                    </k>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="text-center text-dark">
                                <b>Product Name</b>
                            </div>
                            <div id="subcatelist">
                            </div>
                        </div>
                        <div class="col-6 ">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active text-danger" data-toggle="tab" href="#home">Update Product</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu1">Update Category</a>
                                </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home" class="container tab-pane active"><br>
                                    <div class="row">
                                        <div class="col-4 text-center text-dark">
                                            <b>Updating Product </b>
                                        </div>
                                        <div class="col-4 col-sm-4 m-l-7">
                                            <button class="btn btn-warning pull-right" id="deleteproduct">Delete Product</button>
                                        </div>
                                        <form action="UpdateImageWithAjax" method="post" enctype="multipart/form-data">
                                            <div class="row text-center">
                                                <div class="form-group mb-3 p-1">
                                                    <input type="text" name="companyname" class="form-control" id="companyname" required="can't be null" placeholder="Company Name">
                                                </div>
                                                <div class="form-group mb-3 p-1">
                                                    <input type="text" name="genericname" class="form-control" id="genericname" required="can't be null" placeholder="Generic Name">
                                                </div>
                                                <div class="form-group mb-3 p-1">
                                                    <input type="text" name="brandname" class="form-control" id="brandname" required="can't be null" placeholder="Brand Name">
                                                </div>
                                                <div class="form-group mb-3 p-1">
                                                    <input type="text" name="productprice" class="form-control" id="productprice" required="can't be null" placeholder="Product Price">
                                                </div>
                                                <div class="form-group mb-3 p-1">
                                                    <input type="text" name="packaging" class="form-control" id="packaging" required="can't be null" placeholder="Packaging">
                                                </div>
                                                <div class="form-group mb-3 p-1">
                                                    <textarea class="form-control" id="description" name="description"></textarea>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="card" style="width: 15rem">
                                                            <img class="card-img-top" style="height: 130px;"id="imagecate" src="" alt="Card image cap">
                                                            <div class="card-body">
                                                                <input type="file" name="imagenamepro" class="form-control-file" id="imageofpro" required="can't be null"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="mt-1">
                                                            <button class="btn btn-info mt-5" id="updateproduct">Update Product</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-3 p-1" style="visibility: hidden">
                                                    <input type="text" name="id" class="form-control" id="king" required="can't be null" placeholder="Packaging">
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                                <div id="menu1" class="container tab-pane fade"><br>
                                    <div class="row">
                                        <div class="col-4 col-sm-4 text-center">
                                            <h6>Update Category</h6>
                                        </div>
                                        <div class="col-2"></div>
                                        <div class="mt-1">
                                            <button class="btn btn-warning " id="deletectegory">Delete Category</button>
                                        </div>
                                    </div>
                                    <form id="cateform" action="myOrders" method="post" enctype="multipart/form-data">
                                        <div class="form-group mb-3 p-1 mt-2 ">
                                            <input type="text" name="companyname" class="form-control text-center" id="companynameedit" required="can't be null" placeholder="Companyname">
                                        </div>
                                        <div class="mb-3 p-1">
                                            <div class="card" style="width: 15rem">
                                                <img class="card-img-top" style="height: 130px;" id="imageedit" src="" alt="Card image cap">
                                                <div class="card-body">
                                                    <input type="file" name="imagenamecate" class="form-control-file" id="inputGroupFile01" required="can't be null"/>
                                                </div>
                                            </div>
                                            <div class="center-block">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-4">
                                                <div clas   s="mt-1">
                                                    <button class="btn btn-danger" id="updatecate">Update Product</button>
                                                </div>
                                            </div>
                                        </div>
                                        <input type="text" style="visibility: hidden" name="cateid" class="form-control text-center" id="cateid">
                                    </form>

                                </div>
                            </div>
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
                $.get('UpdateandDelete', {subname: i, data: subvalue, tablename: subvalue}, function (responsivetext) {
                    if (responsivetext !== null) {
                        $.each(responsivetext, function (key, value) {
                            $('#king').val(value.id);
                            $('#companyname').val(value.companyname);
                            $('#genericname').val(value.genericname);
                            $('#brandname').val(value.brandname);
                            $('#productprice').val(value.productprice);
                            $('#packaging').val(value.packaging);
                            $('#imagecate').attr('src', 'medicineimage/' + value.imagename);
                            $('#description').val(value.description);
                        });
                    }
                });
            }


        </script>

    </body>
</html>