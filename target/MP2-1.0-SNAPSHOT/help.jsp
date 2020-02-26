<%-- 
    Document   : help
    Created on : Jan 15, 2020, 11:41:22 PM
    Author     : saif
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Matrix Pharmacy Product</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
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
        <style>
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <div class="site-navbar py-2">
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
                                    <li class="active"><a href="product">Products</a></li>
                                    <li><a href="myOrders">My Orders</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                    <li><b>${username}</b></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
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
            <div class="site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 mr-auto">
                            <div class="text-center">
                                <div class="row">
                                    <div class="col-6 col-sm-12" id="scroll">
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
                                    <div class="col-6 col-sm-12">
                                        <div class="text-center text-dark">
                                            <k><b>Product Name</b>(click on product)</k>
                                        </div>
                                        <div id="subcatelist" class="text-left">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <table class="table custom-table">
                                <thead>
                                <th>Product Information </th>
                                <th><div id="loadingbuffer">
                                        <h4>Processing....</h4>
                                        <div class="spinner-border text-dark mt-2" > </div>
                                    </div></th>
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
                            <div class="mb-5">
                                <div class="input-group mb-3" style="max-width: 220px;">
                                    <div class="input-group-prepend">
                                        <button class="btn btn-outline-info js-btn-minus" type="button">&minus;</button>
                                    </div>
                                    <input type="text" name="quantity" class="form-control text-center" id="quantity" value="1" placeholder=""
                                           aria-label="Example text with button addon" aria-describedby="button-addon1">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-info js-btn-plus" type="button">&plus;</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card" style="width: 15rem">
                                <div class="card-body">
                                    <img class="card-img-top" id="imagecate" src="" alt="Card image cap">
                                    <input type="file" name="imagenamepro" style="display:none" class="form-control-file" id="imageofpro" required="cannot be null"  required="can't be null"/>
                                </div>

                            </div>

                            <div class="row mt-3" >
                                <div class="col-lg-4 col-sm-4">
                                    <p><Button href="#" class="buy-now btn btn-sm height-auto px-4 py-3 btn-danger max-auto buy-nowo" style="padding-left: 15px">Buy Now</a></Button>
                                </div>
                                <div class="col-lg-4 col-sm-4">
                                    <p><Button href="#" class="buy-now btn btn-sm height-auto px-4 py-3 btn-black max-auto add-carto" id='supername' style="padding-left: 15px">Add To Cart</button></p>
                                </div>
                                <div class="form-group mb-3 p-1" style="visibility: hidden">
                                    <input type="text" name="id" class="form-control" id="king" required="can't be null" placeholder="Packaging">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-section bg-secondary bg-image" style="background-image: url('medicineimage/images/bg_2.jpg');">
                <div class="container">
                    <div class="row align-items-stretch">
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('medicineimage/images/bg_1.jpg');">
                                <div class="banner-1-inner align-self-center">
                                    <p>Life is choices, and they are relentless. No sooner have you made one choice than another is upon you.?
                                    </p>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 mb-5 mb-lg-0">
                            <a href="#" class="banner-1 h-100 d-flex" style="background-image: url('medicineimage/images/bg_2.jpg');">
                                <div class="banner-1-inner ml-auto  align-self-center">
                                    <h2>Rated by Experts</h2>
                                    <p>?Declare the past, diagnose the present, foretell the future.?
                                    </p>
                                </div>
                            </a>
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
                                    $(document).ready(function () {
                                        $('#loadingbuffer').hide();
                                    });
                                    var imp = null;
                                    var imptablename = '';
                                    $('.buy-nowo').click(function () {
                                        var id = $('#king').text();
                                        var tabnam = $('#companyname').text();
                                        var qun = $('#quantity').val();
                                        var hj = $('#brandname').text();
                                        if (id !== null && tabnam !== null && hj !== null) {
                                            document.location.href = "BookProduct?tablename=" + tabnam + "&brandname=" + hj + "&id=" + id + "&qun=" + qun;
                                        } else {
                                            alert("values Are Empty");
                                        }
                                    });
                                    var subvalue = '';
                                    $('k').click(function () {
                                        $('#loadingbuffer').show();
                                        var i = $(this).index();
                                        var name = document.getElementsByTagName('lo')[i].innerHTML;
                                        imptablename = name;
                                        subvalue = name;
                                        $.post('UpdateandDelete', {tablename: name}, function (responsivetext) {
                                            alert("Products Are Below");
                                            if (responsivetext !== null) {
                                                $('#loadingbuffer').hide();
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
                                        $('#loadingbuffer').show();
                                        var i = event.target.innerHTML;
                                        $.get('UpdateandDelete', {subname: i, data: subvalue, tablename: imptablename}, function (responsivetext) {
                                            if (responsivetext !== null) {
                                                $('#loadingbuffer').hide();
                                                $.each(responsivetext, function (key, value) {
                                                    $('#king').text(value.id);
                                                    $('#companyname').text(value.companyname);
                                                    $('#genericname').text(value.genericname);
                                                    $('#brandname').text(value.brandname);
                                                    $('#productprice').text(value.productprice);
                                                    $('#packaging').text(value.packaging);
                                                    $('#imagecate').attr('src', 'medicineimage/' + value.imagename);
                                                    $('#description').text(value.description);
                                                });
                                            }
                                        });
                                    }
                                    $('.add-carto').click(function () {
                                        var tabnam = $('#companyname').text();
                                        var hj = $('#brandname').text();
                                        var qun = $('#quantity').val();
                                        alert(tabnam + "-" + hj + "-" + qun);
                                        if (tabnam !== null && hj !== null) {
                                            document.location.href = "addToCartFromSearch?tablename=" + tabnam + "&brandname=" + hj + "&qun=" + qun;
                                        } else {
                                            alert("values are Empty");
                                        }
                                    });



        </script>

    </body>

</html>