<%-- 
    Document   : Admin_Default_Menu
    Created on : 19-Feb-2018, 14:58:38
    Author     : Asare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/admin_Default.css" rel="stylesheet" type="text/css"/>
        <script src="js/SuggestScript.js" type="text/javascript"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
        <div class="container" style="margin-left: 50px;">
            

            <div class="row">
                <div class="col-md-12" style="margin-left: 100px;">
                    <h2 style="color: white"><strong>Administrator Service</strong> </h2>

                    <button type="button" class="btn3d btn btn-primary btn-lg"><span class="glyphicon glyphicon-warning-sign "></span> Suggested Updates</button>
                    <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-glyphicon glyphicon-list"></span> Gravedigger Records</button>
                    <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-ok"></span> Load 5 Actions</button>                   
                    <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-glyphicon glyphicon-list"></span> Registrar Records</button>
                    <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-download-alt"></span> Suggest Updates</button>
              <!--  <button type="button" class="btn btn-primary btn-lg btn3d"><span class="glyphicon glyphicon-wrench"></span> Settings</button> -->

                </div>

                <div class="row">
                    
                    <div class="col-md-2" style="margin-top: 150px">
                        <div class="btn-toolbar">
                            <div class="btn-group">
                                <button type="button" class="btn btn-success1 btn-lg btn3d"><span class="glyphicon glyphicon-plus"></span> Add</button> 
                                <button type="button" class="btn btn-primary1 btn-lg btn3d"><span class="glyphicon glyphicon-edit"></span> Update</button>
                                <button type="button" class="btn btn-danger1 btn-lg btn3d"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-8"  style="margin-left: 100px; margin-top: 100px;">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Registrar Records</h3>
                            </div>
                            <div class="panel-body">
                                
                            </div>
                            <!--Table-->
                            <div class="table-responsive">
                            <table class="table table-striped">

                                <!--Table head-->
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Birth Date</th>
                                        <th>Death Date</th>
                                        <th>Sex</th>
                                        <th>Death Location</th>
                                    </tr>
                                </thead>
                                <!--Table head-->

                                <!--Table body-->
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Harvey</td>
                                        <td>11 April 1948 </td>
                                        <td>19 January 1999 </td>
                                        <td>Male</td>
                                        <td>Dundalk</td>
                                        
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>McGeady</td>
                                        <td>29 September 1891</td>
                                        <td>08 May 1950</td>
                                        <td>Male</td>
                                        <td>Dundalk</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>Johnson</td>
                                        <td>14 June 1769</td>
                                        <td>17 Octopber 1871</td>
                                        <td>Male</td>
                                        <td>Drogheda</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Helen</td>
                                        <td>Dorothy</td>
                                        <td>03 February 1961</td>
                                        <td>21 December 2005</td>
                                        <td>Female</td>
                                        <td>Dundalk</td>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Frank</td>
                                        <td>Griffin</td>
                                        <td>19 July 1919</td>
                                        <td>13 May 1986</td>
                                        <td>Male</td>
                                        <td>Newry</td>
                                    <tr>
                                        <th scope="row">6</th>
                                        <td>Anna</td>
                                        <td>Walsh</td>
                                        <td>30 September 1921</td>
                                        <td>29 September 1991</td>
                                        <td>Female</td>
                                        <td>Dundalk</td>
                                    </tr>
                                </tbody>
                                <!--Table body-->
                            </table>
                            <!--Table-->
                        </div>
                    </div>
                    </div>
                </div>

                </div>
            </div>
        </div>
    </body>
</html>
