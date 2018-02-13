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
        <link href="css/adminCss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/less-space.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
        <h2>GraveDigger Suggest Page</h2>
        </div>
        <div class="card">
    <div class="card-body">

        <!--Think having a search within the table would be cool -->
        <!-- Grid row -->
        <div class="row">
        
            <!-- Grid column -->
            <div class="col-md-12 mt-4">
                 <h2 class="pt-3 pb-4 text-center font-bold font-up">Search within table</h2>
                <div class="input-group md-form form-sm form-2 pl-0">
                    <input class="form-control my-0 py-1 grey-border" type="text" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <span class="input-group-text waves-effect grey lighten-3" class="glyphicon glyphicon-search" id="basic-addon1">
                            <a><i class="fa fa-search text-grey" aria-hidden="true"></i></a>
                        </span>
                    </div>
                </div>
        
            </div>
            <!-- Grid column -->
        
        </div>
        <!-- Grid row -->
        <br>

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
    </body>
</html>
