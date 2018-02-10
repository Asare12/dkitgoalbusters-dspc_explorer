<%-- 
    Document   : landing_page
    Created on : 10-Feb-2018, 22:16:07
    Author     : VIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!Doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

      <title>Home</title>
        <link rel="stylesheet" href="./css/landing_page.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>

<body>

  <div class="container">

  	<div class="row">
  		<div class="col-md-12">
        <header>
<h1></h1>

</header>
<nav>
<ul>
  <a href=""><li><i class="home"></i> Home</li></a>
  <a href=""><li><i class="contact-us"></i> Contact Us</li></a>
  <a href=""><li><i class="about-us"></i> About Us</li></a>
</ul>

</nav>

  		</div>
  	</div>

  	<div class="row">
      <div class="col-xl-12  d-flex justify-content-center align-items-center">



        <form align="align-items-center" id="form">

          <h5>Please enter any of the following options available ,enter what you know and press submit button to search</h5>

          <div class="form-row"  method="post">


            <div class="col-xl-1"></div>


            <div class= "col-xl-4">
            <div class="form-group">

              <label for="fname" >First Name</label>
              <input type="text"  id="fname" class="form-control" placeholder="E.g. James" >

            </div>
          </div>

          <div class="col-xl-2"></div>


          <div class= "col-xl-4">

            <div class="form-group">

              <label for="sname" >Last Name</label>
              <input type="text"  id="sname" class="form-control" placeholder="E.g. Farell" >

              </div>
            </div>
            <div class="col-xl-1"></div>

          </div>


          <div class="form-row"  method="post">


            <div class="col-xl-1"></div>


            <div class= "col-xl-4">
            <div class="form-group">

              <label for="fname" >Birth Year</label>
              <input type="month"  id="fname" class="form-control" placeholder="E.g. 1940" >

            </div>
          </div>

          <div class="col-xl-2"></div>


          <div class= "col-xl-4">

            <div class="form-group">

              <label for="sname" >Death Year</label>
              <input type="month"  id="sname" class="form-control" placeholder="E.g. 2015" >

              </div>
            </div>
            <div class="col-xl-1"></div>

          </div>


        </form>


      </div>

        </div>



  	<div class="row">
  		<div class="col-md-12">
  		</div>
      	</div>

  	<div class="row">
  		<div class="col-md-12">
  		</div>
  	</div>

  </div>




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
