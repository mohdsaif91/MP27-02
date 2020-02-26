

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Matrix Pharmacy Add Company</title>
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
    </head>

    <body>


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
                    <div class="main-nav d-none d-lg-block" style="border: 1px;">
                        <nav class="site-navigation text-right text-md-center" role="navigation">
                            <ul class="site-menu js-clone-nav d-none d-lg-block">
                                <li><a href="getorders">Home</a></li>
                                <li><a href="getorders">Orders</a></li>
                                <li><a href="getMessage">User Message</a></li>
                                <li class="active"><a href="Addcompany">ADD</a></li>
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
                <form action="Addcompany" method="Post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-12" style="height: 45px;width: 100%;">
                        </div>
                    </div>
                    <div class="row text-black text-center">
                        <div class="col-md-12 " style="font-size: 20px;">
                            <b>Adding Company And Product</b>
                            <center>
                                <ul id="tabsJustified" class="nav align-content-center nav-tabs" style="background-color: #b1dfbb">
                                    <li class="nav-item"><a href="" data-target="#addcompany" data-toggle="tab" class="nav-link  large text-uppercase active">Add Company</a></li>
                                    <li class="nav-item"><a href="" data-target="#addmedicine" data-toggle="tab" class="nav-link large text-uppercase king">Add Medicine</a></li>
                                </ul>
                            </center>
                            <br>
                            <div id="tabsJustifiedContent" class="tab-content justify-content-center">
                                <div id="addcompany" class="tab-pane active show fade">
                                    <div class="row">
                                        <div class="col-12">
                                            <center><b>Detials Of Company</b></center>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12" style="height: 45px;width: 100%;">
                                        </div>
                                    </div>
                                    <div class='row col text-center'>
                                        <div class="input-group col-6">
                                            <div class="input-group-lg">
                                                <input type="text" name="companyname" class="form-control" id="inputGroupFile01" placeholder="Company Name">
                                            </div>
                                            <div class="form-group">
                                            </div>
                                        </div>
                                        <div class="input-group col-6">

                                            <div class="custom-file">
                                                <input type="file" name="companyImage" class="custom-file-input" id="inputGroupFile01"
                                                       aria-describedby="inputGroupFileAddon01">
                                                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                            </div>
                                        </div>
                                        <div class="col-12" style="height: 45px;width: 100%;">
                                            <h6 class="ml-5">250X250(PX)</h6>
                                        </div>
                                        <div class='col-12 col text-center' >
                                            <button class='btn btn-danger' name="addcompany">Submit</button>
                                        </div>
                                    </div>
                                </div>
                                <div id="addmedicine" class="tab-pane fade  show justify-content-center">
                                    <div class="row">
                                        <div class="col-12 mt-2" style="font-size: 20px;">
                                            <b>Details Of Medicine</b>
                                        </div>
                                        <div class="row " >
                                            <div class="col-12" style="height: 45px;width: 100%;">
                                            </div>
                                        </div>
                                        <br/>
                                        <div class='row  '>
                                            <div class="form-group col-6 col-sm-6">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="genericname" class="form-control input-group-lg" id="inputGroupFile01" placeholder="Generic Name">
                                                </div>
                                                <div class="form-group">

                                                </div>
                                            </div>
                                            <div class="form-group col-6 col-sm-6">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="productdescription" class="form-control" id="inputGroupFile01" placeholder="Product Description">
                                                </div>
                                                <div class="form-group">
                                                </div>
                                            </div>
                                            <div class="col-12" style="height: 45px;width: 100%;">
                                            </div>
                                            <div class="form-group  col-6 col-sm-6">
                                                <select name="selectcompanyname" class="selectpicker w-100">
                                                    <c:forEach items="${companynames}" var="ko">
                                                        <option value="${ko.companyname}">${ko.companyname}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group col-6 col-sm-6">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="brandname" class="form-control" id="inputGroupFile01" placeholder="Brand Name">
                                                </div>
                                                <div class="form-group">
                                                </div>
                                            </div>

                                            <div class="form-group col-6  col-sm-6">
                                                <div class="custom-file">
                                                    <input type="file" name="companyImagename" class="custom-file-input" id="inputGroupFile01"
                                                           aria-describedby="inputGroupFileAddon01">
                                                    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                                </div>
                                                <div class="form-group">
                                                </div>
                                            </div>
                                            <div class="col-12" style="height: 45px;width: 100%;">
                                            </div>

                                            <div class="form-group col-6 col-sm-6">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="packing" class="form-control" id="inputGroupFile01" placeholder="Packing">
                                                </div>
                                                <div class="form-group">
                                                </div>
                                            </div>
                                            <div class="form-group col-6 col-sm-6">
                                                <div class="input-group-prepend">
                                                    <input type="text" name="productprice" class="form-control" id="inputGroupFile01" placeholder="Product Price">
                                                </div>
                                                <div class="form-group">
                                                </div>
                                            </div>

                                            <div class='col-12 col  col-sm-12 text-center' >
                                                <button class='btn  btn-block btn-danger 'name="addcompanyproduct">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
    <script>

    </script>

</html>