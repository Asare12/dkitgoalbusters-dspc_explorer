<%-- 
    Document   : contact_us
    Created on : 09-Feb-2018, 21:20:26
    Author     : VIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html lang="en">
 
<head>
    <meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

      <title>Contact Us</title>
        <link rel="stylesheet" href="./css/contact_us.css">
        <link rel="stylesheet" href="./css/less-space.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>


  <div class="container">

          <nav>
    <ul>
      <a href=""><li><i class="home"></i> Home</li></a>
      <a href=""><li><i class="contact-us"></i> Contact Us</li></a>
      <a href=""><li><i class="about-us"></i> About Us</li></a>
    </ul>

    </nav>
      
      <div class="row">

    <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1 col-1"></div>
    <div class="col-xl-8 col-lg-8 col-md-10 col-sm-10  col-10  xl-mt-200  lg-mt-200 md-mt-100  sm-mt-50 xs-mt-50">

    <form  align="align-items-center" id="form" class="contact_us " method="post">

      <div class="d-flex justify-content-center align-items-center" >
      <h2 id="heading" class="form-signin-heading"><strong>Contact Us<strong></h2>
     </div>

       <div class="form-group">
      <label for="name" class="sr-only">Name</label>
      <input type="text"  id="name" class="form-control" placeholder="Name" required autofocus>
      </div>

      <div class="form-group">
     <label for="email" class="sr-only">Email Address</label>
     <input type="email"  id="email" class="form-control" placeholder="Email address" required autofocus>
     </div>

     <div class="form-group">
    <label for="phonenumber" class="sr-only">Phone Number</label>
    <input type="tel"  id="phonenumber" class="form-control" placeholder="Phone Number" required autofocus>
    </div>


      <div class="form-group">
      <label for="comment"  class="sr-only"> Type is something </label>
          <textarea rows="7"  id="comment" name="user_comment">How can we help you ? ....</textarea>
        </div>



      <button class="btn btn-lg btn-primary btn-block" type="submit">Contact Us</button>
    </form>


    <div class="col-xl-2 col-lg-2 col-md-1 col-sm-1 col-1"></div>


  </div>


</div>



  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
