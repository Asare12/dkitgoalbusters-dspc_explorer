<%-- 
    Document   : Suggested_Registrar_Page
    Created on : 13-Feb-2018, 19:11:44
    Author     : Asare
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/SuggestCss.css" rel="stylesheet" type="text/css"/>
        <script src="js/SuggestScript.js" type="text/javascript"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Search</h3>
                            <div class="pull-right">
                                <span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
                                    <i class="glyphicon glyphicon-search"></i>
                                </span>
                            </div>
                        </div>
                        <div class="panel-body">
                            <input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters="#dev-table" placeholder="Filter Developers" />
                        </div>
                        <!--Table-->
                        <table class="table table-striped">

                            <!--Table head-->
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Age</th>
                                    <th>Address</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <!--Table head-->

                            <!--Table body-->
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>48</td>
                                    <td>11 king street</td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>69</td>
                                    <td>84 cool dances meadow</td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>Larry</td>
                                    <td>15</td>
                                    <td>43 random keys close</td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>Dennis</td>
                                    <td>74</td>
                                    <td>32B dennis apartment</td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>Frank</td>
                                    <td>47</td>
                                    <td>10 rice road </td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                                <tr>
                                    <th scope="row">6</th>
                                    <td>Anna</td>
                                    <td>86</td>
                                    <td>49 phantom house</td>
                                    <td><button type="button" class="btn btn-success">Suggest</button></td>
                                </tr>
                            </tbody>
                            <!--Table body-->
                        </table>
                        <!--Table-->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
