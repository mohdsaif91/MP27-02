<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            .login,
            .image {
                min-height: 100vh;
            }

            .bg-image {
                background-image: url('ogppharma.jpg');
                background-size: cover;
                background-position: center center;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row ">
                <!-- The image half -->
                <div class="col-md-6 d-md-flex bg-image">
                </div>
                <!-- The content half -->
                <div class="col-md-6 bg-light">
                    <div class="login d-flex align-items-center py-5">

                        <!-- Demo content-->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4">Pharmacy</h3>
                                    <p class="text-muted mb-4"></p>
                                    <form action="singin" method="post">
                                        <div class="form-group mb-3">
                                            <input id="inputEmail" name='username' type="text" placeholder="UserName" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input id="inputPassword" name='password' type="password" placeholder="Password"  class="form-control rounded-pill border-0 shadow-sm px-4 text-primary">
                                        </div>
                                        <div class="custom-control custom-checkbox mb-3">
                                            <input id="customCheck1" type="checkbox" checked class="custom-control-input">
                                            <label for="customCheck1" class="custom-control-label">Remember password</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm">Sign in</button>
                                    </form>
                                    <a href="signup.jsp" class="btn btn-danger btn-block text-uppercase mb-2 rounded-pill shadow-sm">Sign Up</a>
                                    <div class="border  text-center" style="opacity: 0.6;">
                                        <button class='btn btn-light' id='guest'><a href="#" rel="tooltip" title="Use UserName-' user ' and Password-' pass ' fro LogIn -we will not have any Record of Yours"><b>Guest Log in Click Me</b></a></button>
                                    </div>
                                </div>
                            </div>
                            <center>${msgs}</center>
                        </div>
                    </div><!-- End -->

                </div>
            </div><!-- End -->

        </div>
    </div>
</body>
<script>
    $('#guest').click(function () {
        alert("UserName- 'user' & Password- 'pass'\n Your date will not be saved");
    });

</script>
</html>