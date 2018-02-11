<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Karaulians.login" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login panel</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel=" stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link href="assets/css/AdminLTE.min.css" rel="stylesheet" />
    <!-- iCheck -->
    <link href="assets/css/blue.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>User Login</b></a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form class="m-t" id="myForm" role="form" action="javascript:;">

                <div class="form-group has-feedback">
                    <input type="text" placeholder="Email" name="luemail" class="form-control" id="email" />


                </div>
                <div class="form-group has-feedback">
                    <input type="password" placeholder="Password" name="lupwd" class="form-control" id="password" />


                </div>
                <div class="row">

                    <div class="col-xs-12">
                        <button type="button" class="btn btn-primary btn-block btn-flat" id="btnLogin"><span>Sign In</span></button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>- OR -</p>
                <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                    <i class="fa fa-facebook"></i>Sign in using
                    Facebook
                </a>
                <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                    <i class="fa fa-google-plus"></i>Sign in using
                    Google+
                </a>
            </div>
            <!-- /.social-auth-links -->
            <a href="register.aspx">Register a new membership</a>

            <!-- /.login-box -->
            <!-- jQuery 2.2.3 -->

            <script src="assets/js/jquery.min.js"></script>
            <!-- Bootstrap 3.3.6 -->
            <script src="assets/js/bootstrap.min.js"></script>
            <!-- iCheck -->
            <script src="assets/js/icheck.min.js"></script>
            <script>
                $(function () {
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue',
                        increaseArea: '20%' // optional
                    });
                });
            </script>
            <script>


                $(document).keypress(function (event) {
                    var keycode = event.keyCode || event.which;
                    if (keycode == '13' || keycode == '10') {
                        $('#btnLogin').trigger('click');
                    }
                });

                $('#btnLogin').click(function () {
                    
                    $.ajax({
                        url: '/api/service/Login',
                        type: 'POST',
                        data: {
                            //Login_Username: $("#email").val(),
                            //Password_login: $("#password").val(),
                            //Login_Type: $("input[name='typeofuser']:checked").val()
                            email: $("#email").val(),
                           password: $("#password").val()
                        },
                        success: function (response) {
                            console.log(response);
                            if (response.status == 'Success') {
                                var data = response.data;
                                SaveUserData(data);
                            } else {
                                alert("Invalid username password");
                            }
                        },
                        failure: function (response) {
                        }
                    });
                });
                function SaveUserData(data) {
                    if (data != null) {
                        console.log(data);
                        var obj = {};
                        obj.id = data.id;
                        obj.email = data.email;
                        obj.usertype = data.RoleName;
                        obj.name = data.first_name; obj.profile_pic = data.profile_pic;
                        $.ajax({
                            type: 'POST',
                            url: 'login.aspx/SaveUserLoginData',
                            data: JSON.stringify(obj),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data != null || data != "") {
                                    var role = data.d;
                                    if (role == "Admin") {
                                        window.location = "/Admin/AdminIndex.aspx";
                                    }
                                    else {
                                        window.location = "/default.aspx";
                                    }
                                }
                                else {
                                    alert("Please Check Login Data.");
                                }
                            },
                            failure: function (response) {
                            }
                        });
                    }
                    else {
                        $("#overlay").hide();
                    }
                }
                
            </script>
        </div>
    </div>
</body>
</html>