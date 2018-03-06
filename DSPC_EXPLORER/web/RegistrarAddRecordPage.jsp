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
            <div class="col-lg-12 well">
                <div class="row">
                    <form>
                        <div class="col-sm-12">
                            <div class="form-group col-md-4">
                                <label>First Name</label>
                                <input type="text" class="form-control" name="fname" placeholder="First name">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Middle Name</label>
                                <input type="text" class="form-control" placeholder="Middle name">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Last Name</label>
                                <input type="text" class="form-control" placeholder="Last name">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Birth Date</label>
                                <input type="text" class="form-control" placeholder="Birth Date">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Death Date</label>
                                <input type="text" class="form-control" placeholder="Death Date">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Age</label>
                                <input type="text" class="form-control" placeholder="Age">
                            </div>

                            <div class="form-group col-md-3">
                                <label>Burial Date</label>
                                <input type="text" class="form-control" placeholder="Burial Date">
                            </div>

                            <div class="form-group col-md-4">
                                <label>Sex</label>
                                <input type="text" class="form-control" placeholder="Sex">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Religion</label>
                                <input type="text" class="form-control" placeholder="Religion">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Martial status</label>
                                <input type="text" class="form-control" placeholder="Marital status">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Occupation</label>
                                <input type="text" class="form-control" placeholder="Occupation">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Death Location</label>
                                <input type="text" class="form-control" placeholder="Death Location">
                            </div>
                            
                            <div class="btn-toolbar">
                            <div class="btn-group">
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