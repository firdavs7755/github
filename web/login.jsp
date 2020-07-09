<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Login form</title>
    <link rel="stylesheet" href="css/metro.css">
    <link rel="stylesheet" href="css/metro-icons.css">
    <link rel="stylesheet" href="css/metro-schemes.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/metro.js"></script>
    <style>
        .login-form {
            width: 25rem;
            height: 18.75rem;
            position: fixed;
            top: 50%;
            margin-top: -9.375rem;
            left: 50%;
            margin-left: -12.5rem;
            background-color: #ffffff;
            opacity: 0;
            -webkit-transform: scale(.8);
            transform: scale(.8);
        }
    </style>

    <script>

        $(function(){
            var form = $(".login-form");

            form.css({
                opacity: 1,
                "-webkit-transform": "scale(1)",
                "transform": "scale(1)",
                "-webkit-transition": ".5s",
                "transition": ".5s"
            });
        });
    </script>

</head>
<body class="bg-darkAmber">
<div class="login-form padding20 block-shadow">
    <form method="post" action="/login">
        <h1 class="text-light">Login to service</h1>
        <h4 style="color: red"><%=request.getParameter("error")!=null?"Login or Password incorrect!!!":""%></h4>
        <br/>
        <div>
            <label for="user_login">User name:</label>
            <input type="text" data-role="input" name="user_login" id="user_login" value="<%=request.getParameter("username")!=null?request.getParameter("username"):""%>">
        </div>
        <div>
            <label for="user_password">User password:</label>
            <input type="password" data-role="input" name="user_password" id="user_password">
            gitt
        </div>
        <br />
        <br />
        <div class="form-actions">
            <button type="submit" class="button primary">Login to...</button>
            <a href="/">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
