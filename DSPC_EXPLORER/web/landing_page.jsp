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
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script>


function init() {
	var disableStatus = false;
	var disableStatus1 = false;


$('#anOtherButton').click(function(){


	if (disableStatus) {
		$('#byear').prop('disabled', false);
		$('#dyear').prop('disabled', false);

		if (disableStatus1) {
			$('#outerbutton2').trigger('click');
		}



		disableStatus = false;

	} else {
		$('#byear').prop('disabled', true);
		$('#byear').val('');
		$('#dyear').prop('disabled', true);
		$('#dyear').val('');
		disableStatus = true;

	}
});




$('#outerbutton2').click(function(){


	if (disableStatus1) {
		$('#advance_birth1').prop('disabled', false);
		$('#advance_birth2').prop('disabled', false);
		$('#advance_death1').prop('disabled', false);
		$('#advance_death2').prop('disabled', false);
		$('#advance_birth3').prop('disabled', true);
		$('#advance_birth3').val('');
		$('#advance_death3').prop('disabled', true);
		$('#advance_death3').val('');




		disableStatus1 = false;

	} else {
		$('#advance_birth1').prop('disabled', true);
		$('#advance_birth1').val('');
		$('#advance_birth2').prop('disabled', true);
		$('#advance_birth2').val('');
		$('#advance_death1').prop('disabled', true);
		$('#advance_death1').val('');
		$('#advance_death2').prop('disabled', true);
		$('#advance_death2').val('');
		$('#advance_birth3').prop('disabled', false);
		$('#advance_death3').prop('disabled', false);
		disableStatus1 = true;

	}



});




}





var count = 0;

function showAdminLogin() {

   count++;

	if (count >= 5) {
      count = 0;
	location.href = 'log_in.jsp';



    }
}




</script>

</head>

<body onload="init()">

  <div class="container">

  	<div class="row">
  		<div class="col-md-12">

<h2 ><strong>Welcome to Dowdallshill Saint Patrick Cemetery Dundalk Website </strong></h2>

        <header>
<h1></h1>

</header>
<!-- ................................................................................................................. -->
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


          <!-- ................................................................................................................. -->


          <div class="form-row"  method="post">


        <!-- start-->     <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>


            <div class= "col-xl-3  col-lg-3 col-md-4 col-sm-4">
            <div class="form-group">

              <label for="fname" > <span>First Name </span></label>
              <input type="text"  id="fname" class="form-control" placeholder="E.g. James" >

            </div>
          </div>

      <!-- space-->     <div class="col-xl-2  col-lg-2  col-md-2 col-sm-2"></div>


          <div class= "col-xl-3  col-lg-3  col-md-4 col-sm-4">

            <div class="form-group">

              <label for="sname" >Last Name</label>
              <input type="text"  id="sname" class="form-control" placeholder="E.g. Farell" >

              </div>
            </div>
      <!-- end-->      <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>

          </div>


          <!-- ................................................................................................................. -->

          <div class="form-row"  method="post">


        <!-- start-->    <div class="col-xl-2 col-lg-2  col-md-2"></div>


            <div class= "col-xl-2 col-lg-2  col-md-2">
            <div class="form-group ">

              <label for="byear" >Birth Year</label>
              <input  name="born" type="text"  id="byear" class="form-control" placeholder="E.g.1940" />

            </div>
          </div>

      <!-- space-->      <div class="col-xl-1 col-lg-1  col-md-1"></div>


          <div class= "col-xl-2 col-lg-2  col-md-2">

            <div class="form-group">

              <label for="dyear" >Death Year</label>
              <input name="die" type="text"  id="dyear" class="form-control" placeholder="E.g.2015" >

              </div>
            </div>
    <!-- middle-->        <div class="col-xl-1 col-lg-1  col-md-1"></div>


      <!-- space-->       <div class= "col-xl-2 col-lg-2  col-md-2">

              <div class="form-group">
                <label for="gender1" class="col-sm-2 col-lg-1  col-md-1 control-label">Gender:</label>
                  <select class="form-control" id="gender1">
                    <option value="">Gender</option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
          </select>

          </div>
        </div>



        <h5>Not sure about exact birth or death year ? click Advanced to search beetween birth years and death years or search to explore</h5>


        <!-- end-->    <div class="col-xl-2 col-lg-2  col-md-1 col-sm-2"></div>



        <div class="col-xl-4 col-lg-4 col-md-5 col-sm-4">
        <button id="anOtherButton" data-toggle="collapse" data-target="#demo" class="btn btn-md btn-outline-primary btn-block btn-space"  type="button">Advanced</button>
        </div>





    <div class="col-xl-4 col-lg-4 col-md-5 col-sm-4">
    <button class="btn btn-md btn-outline-primary btn-block btn-space"  type="submit">Search</button>
    </div>


    <!-- end-->    <div class="col-xl-2 col-lg-2  col-md-1 col-sm-2"></div>




              </div>




          <!-- .................................................................................................................




          <h5>Dont know exact birth and death year ? then click more to search beetween years entered!</h5>


          <div class="form-row"  method="post">


            <div class="col-xl-3"></div>


            <div class= "col-xl-6">
            <div class="form-group">


              <button type="button"   onclick="disable()"  class="btn btn-info " data-toggle="collapse" data-target="#demo">More</button>



            </div>
          </div>
          <div class="col-xl-3"></div>



          </div>





          ................................................................................................................. -->



<div id="demo" class="collapse in btn-space" >
          <div class="form-row"  method="post">


            <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>


            <div class= "col-xl-3  col-lg-3 col-md-4 col-sm-4">
            <div class="form-group">

              <label for="advance_birth1" >From Birth Year</label>
              <input type="text"  id="advance_birth1" class="form-control" placeholder="E.g. 1940" >

            </div>
          </div>


          <div class="col-xl-2  col-lg-2  col-md-2 col-sm-2"></div>


          <div class= "col-xl-3  col-lg-3  col-md-4 col-sm-4">

            <div class="form-group">

              <label for="advance_birth2" > To Birth Year</label>
              <input type="text"  id="advance_birth2" class="form-control" placeholder="E.g. 2015" >

              </div>
            </div>


          </div>

            <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>


            <div class="form-row"  method="post">


              <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>


              <div class= "col-xl-3  col-lg-3 col-md-4 col-sm-4">
              <div class="form-group">

                <label for="advance_death1" >From Death Year</label>
                <input type="text"  id="advance_death1" class="form-control" placeholder="E.g. 1940" >

              </div>
            </div>


            <div class="col-xl-2  col-lg-2  col-md-2 col-sm-2"></div>


            <div class= "col-xl-3  col-lg-3  col-md-4 col-sm-4">

              <div class="form-group">

                <label for="advance_death2" >To Death Year</label>
                <input type="text"  id="advance_death2" class="form-control" placeholder="E.g. 2015" >

                </div>
              </div>


            </div>

              <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>

              <h5>Maybe you want to search in all years beetween birth and death year ?</h5>

              <div class=" row justify-content-center">

              <div class="col-xl-5 col-lg-5 col-md-5 col-sm-5">
              <button id="outerbutton2" data-toggle="collapse" data-target="#demo1" class="btn btn-md btn-outline-primary btn-block btn-space"  type="button">More</button>
              </div>
            </div>

          </div>

          <!-- ................................................................................................................. -->


          <div id="demo1" class="collapse in btn-space" >
                    <div class="form-row"  method="post">


                      <div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>


                      <div class= "col-xl-3  col-lg-3 col-md-4  col-sm-4">
                      <div class="form-group">

                        <label for="advance_birth3" >From Birth Year</label>
                        <input type="text"  id="advance_birth3" class="form-control" placeholder="E.g. 1940" >

                      </div>
                    </div>


                    <div class="col-xl-2  col-lg-2  col-md-2 col-sm-2"></div>


                    <div class= "col-xl-3  col-lg-3  col-md-4 col-sm-4">

                      <div class="form-group">

                        <label for="advance_death3" > To Death Year</label>
                        <input type="text"  id="advance_death3" class="form-control" placeholder="E.g. 2015" >

                        </div>
                      </div>


<div class="col-xl-2  col-lg-2  col-md-1 col-sm-1"></div>

                    </div>

                    </div>

                    <!-- ................................................................................................................. -->

          <!-- .................................................................................................................

          <div class="form-row">
            <div class="col-md-12">


              <div class="form-group">

                <button id="demo" type="button"   onclick="enable()"  class="btn btn-info" data-toggle="collapse" data-target="#demo">More</button>


              </div>


            </div>

            ................................................................................................................. -->

        </form>
      </div>

      </div>



      <h4 ><strong>Location of the cemetery </strong></h4>



        <div class="row">

          <div class="col-xl-1"></div>

            <div class="col-xl-10 ">


                <!-- This map was takern from google website -->


              <div class="googlemap-responsive">

                <!--<iframe src='https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387144.0075834208!2d-73.97800349999999!3d40.7056308!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY!5e0!3m2!1sen!2sus!4v1394298866288' width='100%' height='450' frameborder='0' style='border:0'></iframe>-->

                <iframe src="https://www.google.com/maps/embed/v1/place?q=Newry%20Rd%2C%20Dowdallshill%2C%20Dundalk%2C%20Co.%20Louth&key=AIzaSyCvl7-Uvm5Fh91Iq_CEZ3In2c7sY0WqQw0" width='100%' height='450' frameborder='0' style='border:0'></iframe>
          </div>

          </div>

          <div class="col-xl-1"></div>

        </div>


        <span style="font-size :10px  ;color:white;"
        onClick="showAdminLogin();">
         <p >v1.1</p>
        </span>




      	</div>





<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
