<!Doctype html>

<html lang="en">

    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Login</title>
        <link rel="stylesheet" href="./css/search_result_selected.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>







        <script type="text/javascript"
        src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>


        <script type="text/javascript">
            function loadMap() {
                var latlng = new google.maps.LatLng(54.021318, -6.392779);
                var myOptions = {
                    zoom: 18,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.SATELLITE
                };
                var map = new google.maps.Map(document.getElementById("map_container"), myOptions);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    title: "my hometown, Malim Nawar!"
                });

            }
        </script>


        <script>
            function copy_coordinates(element) {
                var $temp = $("<input>");
                $("body").append($temp);
                $temp.val($(element).text()).select();
                document.execCommand("copy");
                $temp.remove();
            }

        </script>


        <script>
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;
                document.body.innerHTML = printContents;
                window.print();
                document.body.innerHTML = originalContents;
            }
        </script>


    </head>

    <body onload="loadMap()">

        <div class="container">


            <nav class="pb-3">
                <ul>
                    <a href=""><li><i class="home"></i> Home</li></a>
                    <a href=""><li><i class="contact-us"></i> Contact Us</li></a>
                    <a href=""><li><i class="about-us"></i> About Us</li></a>
                    <a href=""><li><i class="about-us"></i> Go Back</li></a>

                </ul>

            </nav>




            <div class="limiter">
                <div class="container-table100">
                    <div class="wrap-table100">
                        <div class="table">

                            <div class="row header">
                                <div class="cell">
                                    First Name
                                </div>
                                <div class="cell">
                                    Surname
                                </div>
                                <div class="cell">
                                    Sex
                                </div>
                                <div class="cell">
                                    Age
                                </div>
                                <div class="cell">
                                    Religion
                                </div>
                                <div class="cell">
                                    Occupation
                                </div>
                                <div class="cell">
                                    Residence
                                </div>
                                <div class="cell">
                                    Condition
                                </div>
                                <div class="cell">
                                    D.O.D
                                </div>
                                <div class="cell">
                                    D.O.B
                                </div>
                            </div>

                            <div class="row">
                                <div class="cell" data-title="First Name">
                                    Vincent
                                </div>
                                <div class="cell" data-title="Surname">
                                    Williamson
                                </div>
                                <div class="cell" data-title="Sex">
                                    Male
                                </div>
                                <div class="cell" data-title="Age">
                                    80
                                </div>
                                <div class="cell" data-title="Religion">
                                    Catholic
                                </div>
                                <div class="cell" data-title="Occupation">
                                    Mechanic
                                </div>
                                <div class="cell" data-title="Adress">
                                    18 Hill Street
                                </div>
                                <div class="cell" data-title="Condition">
                                    Married
                                </div>
                                <div class="cell" data-title="Date of Death">
                                    22/11/2017
                                </div>
                                <div class="cell" data-title="Date of Burial">
                                    25/11/2017
                                </div>
                            </div>

                            <div class="row">
                                <div class="cell" data-title="First Name">
                                    Vincent
                                </div>
                                <div class="cell" data-title="Surname">
                                    Williamson
                                </div>
                                <div class="cell" data-title="Sex">
                                    Male
                                </div>
                                <div class="cell" data-title="Age">
                                    80
                                </div>
                                <div class="cell" data-title="Religion">
                                    Catholic
                                </div>
                                <div class="cell" data-title="Occupation">
                                    Mechanic
                                </div>
                                <div class="cell" data-title="Adress">
                                    18 Hill Street
                                </div>
                                <div class="cell" data-title="Condition">
                                    Married
                                </div>
                                <div class="cell" data-title="Date of Death">
                                    22/11/2017
                                </div>
                                <div class="cell" data-title="Date of Burial">
                                    25/11/2017
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>

            <div class="extra_details mt-3">
                <div class="pt-3 " align="center">
                    <p class="font-weight-bold">Seaction : A</p>
                    <p class="font-weight-bold">Row Number : 12</p>
                    <p class="font-weight-bold">Depth : 15 graves In</p>
                    <p id="coordinates" class="font-weight-bold">Coordinates :Latitude: 30.23186, Longitude: -94.47214, Distortion: 1.34 </p>
                </div>
            </div>


            <div id="fullmap">
                <div id="map_container" class="mt-5"  align="center"></div>
            </div>
            <div class="d-flex justify-content-center">
                <div class="btn-group btn-group-justified mt-5">
                    <div class="col">
                        <button id="outerbutton1" onclick="copy_coordinates('#coordinates')"  class="btn btn-md btn-outline-primary btn-block btn-space"  type="button">Copy Coordinates</button>
                    </div>    <div class="col">
                        <button id="outerbutton2" onclick="copy_coordinates('#coordinates')"  class="btn btn-md btn-outline-primary btn-block btn-space"  type="button">Send to Device</button>
                    </div>    <div class="col">
                        <button id="outerbutton3" onclick="printDiv('fullmap')" class="btn btn-md btn-outline-primary btn-block btn-space"  type="button">Print Full Screen</button>
                    </div>
                </div>
            </div>

        </div>


    </body>

</html>
