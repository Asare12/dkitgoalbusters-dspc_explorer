<%-- 
    Document   : userupdate
    Created on : 16-Feb-2018, 20:45:43
    Author     : abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Users user = (Users) request.getSession().getAttribute("user");
%>


<div class="container">
    <div class="col-lg-12">
        <div class="box">
            <hr class="tagline-divider">
            <h2 class="intro-text text-center"><strong>User Update</strong></h2>
            <hr class="tagline-divider">

            <div class="row">
                <div class="col-md-3" onClick="$('#address').hide();
                        $('#proupdate').hide();
                        $('#addressproof').hide();
                        $('#image').show();">     
                    <div class="form-group">
                        <button class="btn btn-primary fulllength" id="">Profile Image</button>
                    </div>
                </div>
                <div class="col-md-3" onClick="$('#address').hide();
                        $('#image').hide();
                        $('#addressproof').hide()
                        $('#proupdate').show();">     
                    <div class="form-group">
                        <button class="btn btn-primary fulllength" id="">Personal Information</button>
                    </div>
                </div>
                <div class="col-md-3" onClick="$('#proupdate').hide();
                        $('#image').hide();
                        $('#addressproof').hide();
                        $('#address').show();">     
                    <div class="form-group">
                        <button class="btn btn-primary fulllength" id="">Address</button>
                    </div>
                </div>
                <div class="col-md-3" onclick="$('#proupdate').hide();
                        $('#image').hide();
                        $('#address').hide();
                        $('#addressproof').show();">     
                    <div class="form-group">
                        <button class="btn btn-primary fulllength" id="">Address Proof</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="col-lg-12">
        <div class="box">
            <div id="image">
                <!--this a image panel-->
                <form role="form" id="FileUploadForm" method="POST" enctype="multipart/form-data" onsubmit="profileImgUpdate(this); return false;">
                    <div class="panel-heading"><h4>Profile Image</h4></div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <div id="imgContainer">
                                    <img src="./img/profilePictures/" id="img" width="300px" class="img-thumbnail" alt="Profile Picture" ><br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input  type="file" multiple class="text-info " name="image" id="uploadimage" accept="image/*" onchange="$('#imgSubmit').removeAttr('disabled')"><br>
                                <input type="hidden" name="action" value="fileUpload"/>
                                <input id="imgSubmit" type="submit" disabled class="btn btn-default" value="Upload"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-6 col-xs-6">
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <a onClick="$('#image').hide();
                                        $('#addressproof').hide();
                                        $('#address').hide();
                                        $('#proupdate').show()" class="btn btn-default fulllength">Next</a>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- end of image div and start a new div for user profile -->
            <form role="form" id="updateuser" onsubmit="updateUserProfile(this); return false;">
                <div id="proupdate" style="display:none;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-heading text-center"><h4><strong>Personal Information</strong></h4></div>
                            <div class="form-group">
                                <label  for="fname" class="col-md-4 control-label">First Name</label>
                                <input type="text" class="form-control" name="firstname" id="fname" value="<%=user.getFirstName()%>"/>
                            </div>
                            <div class="form-group">
                                <label  for="mname" class="col-md-4 control-label">Middle Name</label>
                                <input type="text" class="form-control" name="middlename" id="mname"  value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="lname" class="col-md-4 control-label">Last Name</label>
                                <input type="text" class="form-control" name="lastname" id="lname" value="<%=user.getLastName()%>"/>
                            </div>
                            <div class="form-group">
                                <label  for="username" class="col-md-4 control-label">User Name</label>
                                <input type="text" class="form-control" name="email" id="uname" disabled value="<%=user.getUserName()%>"/>
                            </div>
                            <div class="form-group text-center">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <div class="col-md-6 col-xs-6">
                                <a  onClick="$('#proupdate').hide();
                                        $('#addressproof').hide();
                                        $('#address').hide();
                                        $('#image').show()" class="btn btn-default fulllength">Prev</a>
                            </div>
                            <div class="col-md-6 col-xs-6">

                                <a onClick="$('#proupdate').hide();
                                        $('#addressproof').hide();
                                        $('#image').hide();
                                        $('#address').show()" class="btn btn-default fulllength">Next</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of detail update and start a address update panel -->
                <div id="address" style="display:none;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-heading text-center"><h4><strong>Address</strong></h4></div>
                            <div class="form-group">
                                <label  for="address" class=" control-label">Address</label>
                                <input type="text" class="form-control" name="address" id="Address" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="Town" class=" control-label">Town</label>
                                <input type="text" class="form-control" name="town" id="Town" value="" />
                            </div>

                            <div class="form-group">
                                <label  for="State" class="control-label">State</label>
                                <input type="text" class="form-control" name="state" id="State" value=""/>
                            </div>

                            <div class="form-group">
                                <label  for="country" class=" control-label">Country</label>
                                <input type="text" class="form-control" name="country" id="Country" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="Postcode" class=" control-label">Postcode</label>
                                <input type="text" class="form-control" name="postcode" id="Postcode" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="Hnumber" class="control-label">Home Number</label>
                                <input type="text" class="form-control" name="phone1" id="Hnumber" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="Mnumber" class=" control-label">Mobile Number</label>
                                <input type="text" class="form-control" name="phone2" id="Mnumber" value=""/>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-6 col-xs-6">
                                        <a  onClick="$('#image').hide();
                                                $('#addressproof').hide();
                                                $('#address').hide();
                                                $('#proupdate').show()" class="btn btn-default fulllength">Prev</a>
                                    </div>
                                    <div class="col-md-6 col-xs-6">

                                        <a onClick="$('#proupdate').hide();
                                                $('#address').hide();
                                                $('#addressproof').show()" class="btn btn-default fulllength">Next</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of address panel and start a address proof panel -->
                <div id="addressproof" style="display:none;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel-heading text-center"><h4><strong>Address Proof</strong></h4></div>
                            <div class="form-group">
                                <label  for="idproof" class=" control-label">ID Proof</label>
                                <input type="text" class="form-control" name="idproof" id="idproof" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="addprooftype" class=" control-label">Address Proof Type</label>
                                <input type="text" class="form-control" name="addressprooftype" id="addprooftype" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="idref" class=" control-label">Id Reference</label>
                                <input type="text" class="form-control" name="idref" id="idref" value=""/>
                            </div>
                            <div class="form-group">
                                <label  for="addref" class=" control-label">Address Reference</label>
                                <input type="text" class="form-control" name="addressref" id="addref" value=""/>
                            </div>
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="userToBeUpdated" value="<%=user.getUserId()%>"/>
                            <div class="row">
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-6 col-xs-6">
                                        <a  onClick="$('#proupdate').hide();
                                                $('#image').hide();
                                                $('#addressproof').hide();
                                                $('#address').show()" class="btn btn-default fulllength">Prev</a>
                                    </div>
                                    <div class="col-md-6 col-xs-6">

                                        <input type="submit" class="btn btn-default fulllength" value="Update"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

