<%-- 
    Document   : newjsp
    Created on : 09-Feb-2018, 21:15:51
    Author     : VIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Login</title>
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="./css/less-space.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>

  <div class="container">

    <div class="row">

              <div class="col-xl-3  col-lg-3  col-md-2 col-sm-2 col-1"></div>
              <div class="col-xl-6 col-lg-6 col-md-8 col-sm-8  col-10  xl-mt-200  lg-mt-200 md-mt-200  sm-mt-50 xs-mt-50">

       <form  align="align-items-center" id="form-signin" class="form-signin " method="post">

         <div class="d-flex justify-content-center align-items-center" >
         <h2 id="heading" class="form-signin-heading"><strong>Please Sign In<strong></h2>
        </div>

          <div class="form-group">
         <label for="email" class="sr-only">Email address</label>
         <input type="email"  id="email" class="form-control" placeholder="Email address" required autofocus>
         </div>

         <div class="form-group">
         <label for="password" class="sr-only">Password</label>
         <input type="password" id="password" class="form-control" placeholder="Password" required>
         </div>

         <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
       </form>

   </div>

  <div class="col-xl-3 col-lg-3 col-md-2 col-sm-2 col-1"></div>

</div>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>

</html>
