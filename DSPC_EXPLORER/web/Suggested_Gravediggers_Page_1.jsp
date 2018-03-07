<%-- 
    Document   : Suggested_Gravediggers_Page
    Created on : 14-Feb-2018, 15:37:35
    Author     : Asare
--%>




<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Users user = (Users) request.getSession().getAttribute("user");
%>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style> 
    #modalThread1  {
        background-color: #006DCC;
        color: white;
    }

    #modalThread2  {
        background-color: #00cc4e;
        color: white;
    }

</style>

<div class="container">
    <div class="box">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Suggested Updates</h3>
                    </div>
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
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                        <tr>
                            <th scope="row">2</th>
                            <td>Jacob</td>
                            <td>69</td>
                            <td>84 cool dances meadow</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                        <tr>
                            <th scope="row">3</th>
                            <td>Larry</td>
                            <td>15</td>
                            <td>43 random keys close</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                        <tr>
                            <th scope="row">4</th>
                            <td>Dennis</td>
                            <td>74</td>
                            <td>32B dennis apartment</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                        <tr>
                            <th scope="row">5</th>
                            <td>Frank</td>
                            <td>47</td>
                            <td>10 rice road </td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                        <tr>
                            <th scope="row">6</th>
                            <td>Anna</td>
                            <td>86</td>
                            <td>49 phantom house</td>
                            <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">View Details</button>
                                <button type="button" class="btn btn-success">Accept</button>
                                <button type="button" class="btn btn-danger">Decline</button></td>
                        </tr>
                    </tbody>
                    <!--Table body-->
                </table>
                <!--Table-->

                <div class="modal fade" id="myModal" role="dialog">
                    <div class="modal-dialog">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="modal-title">Record Details</h4>
                            </div>
                            <div class="modal-body">
                                <h3><strong>Changes made by: Jim</strong></h3>

                                <table class="table table-striped">
                                    <thead id="modalThread1">
                                        <tr>
                                            <th>#</th>
                                            <th>First Name</th>
                                            <th>Age</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Mark</td>
                                            <td>48</td>
                                            <td>11 king street</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <table class="table table-striped">
                                    <thead id="modalThread2">
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
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
