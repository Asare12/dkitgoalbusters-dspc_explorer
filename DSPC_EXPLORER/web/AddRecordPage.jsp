<%--
    Document   : Add_Record_Page
    Created on : 19-Feb-2018, 18:32:25
    Author     : Asare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/SuggestCss.css" rel="stylesheet" type="text/css"/>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
        <div class="container">
            <h1 class="well">New Record</h1>
            <div class="col-lg-10 well">
                <div class="row">
                    <form>
                        <div class="col-sm-12">
                            <div class="form-group col-md-4  col-sm-4">
                                <label>First Name</label>
                                <input type="text" class="form-control" name="fname" placeholder="First name">
                            </div>
                            
                            <div class="form-group col-md-4 col-sm-4">
                                <label>Last Name</label>
                                <input type="text" class="form-control" name="sname" placeholder="Last name">
                            </div>
                            
                            
                            
                            
                              <div class="form-group col-md-4 col-sm-4">
                <label >Gender:</label>
                  <select class="form-control" name="gender" id="gender1">
                    <option value="">Gender</option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
          </select>

          </div>
                            
                            
                            
                             <div class="form-group col-md-2 col-sm-2">
                                <label>Age</label>
                                <input type="text" class="form-control" name="age" placeholder="Age">
                            </div>

                             <div class="form-group col-md-4 col-sm-4">
                                <label>Religion</label>
                                <input type="text" class="form-control"  name="religion" placeholder="Religion">
                            </div>
                         
                             <div class="form-group col-md-6 col-sm-6">
                                <label>Occupation</label>
                                <input type="text" class="form-control" name="fname" placeholder="Occupation">
                            </div>
                            
                            <div class="form-group col-md-6 col-sm-6">
                                <label>Last Place of Residence</label>
                                <input type="text" class="form-control" name="residence" placeholder="Last Place of Residence">
                            </div>
                            
                             <div class="form-group col-md-6 col-sm-6">
                                <label>Martial Status</label>
                                <input type="text" class="form-control" name="martial_status" placeholder="Marital status">
                            </div>
                                                   
                            
                            <div class="form-group col-md-3 col-sm-3">
                                <label>Death Date</label>
                                <input type="text" class="form-control"  name="ddate" placeholder="Death Date">
                            </div>
                           
                            <div class="form-group col-md-3 col-sm-3">
                                <label>Burial Date</label>
                                <input type="text" class="form-control" name="bdate" placeholder="Burial Date">
                            </div>

                            <div class="form-group col-md-3 col-sm-3">
                                <label>Section</label>
                                <input type="text" class="form-control" name="section" placeholder="Section">
                            </div>    
                            <div class="form-group col-md-3 col-sm-3">
                                <label>No</label>
                                <input type="text" class="form-control" name="no" placeholder="No">
                            </div>    
                           
                          
                            
                            

                            <button type="button" class="btn btn-md btn-primary">Submit</button>
                            <button type="button" class="btn btn-md btn-danger">Cancel</button>
                        </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
