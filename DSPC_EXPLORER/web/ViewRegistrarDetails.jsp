<%-- 
    Document   : ViewRegistrarDetails
    Created on : 21-Feb-2018, 19:23:15
    Author     : Abdul
--%>


<%@page import="com.dspc_explorer.Dtos.Registrar"%>
<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String data = (String) request.getSession().getAttribute("jsonStringUserList");
    Registrar registrar = (Registrar) request.getSession().getAttribute("registrar");
%>

<!DOCTYPE html>


<div class="container"style="margin-left: 350px;" >
    <div class="row">
        <div class="col-md-7 ">

            <div class="panel panel-primary">
                <div class="panel-heading">  <h4 >Record Details</h4></div>
                <div class="panel-body">

                    <div class="box box-info">

                        <div class="box-body">
                            <div class="col-sm-6">
                                <div  align="center"> <img src="images/r-i-p-grave-stone-halloween-decoration-34707618.jpg" style="height: 150px;" class="img-circle img-responsive" alt="profile image"/>  

                                    <!--    <input id="profile-image-upload" class="hidden" type="file">
                                        <div style="color:#999;" >click here to change profile image</div>
                                    <!--Upload Image Js And Css-->

                                </div>

                                <br>

                                <!-- /input-group -->
                            </div>
                            <div class="col-sm-6">
                                <h2 style="color:#00b1b1;"><%=registrar.getRegFirstName()%> <%=registrar.getRegMiddleName()%>  <%=registrar.getRegLastName()%>  </h2></span>
                                <!--     <span><p>Aspirant</p></span>  -->          
                            </div>
                            <div class="clearfix"></div>
                            <!--     <hr style="margin:5px 0 5px 0;">  -->

                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#home">Person Details</a></li>
                                <li><a data-toggle="tab" href="#menu1">Age Details</a></li>
                                <li><a data-toggle="tab" href="#menu2">Misc Details</a></li>

                            </ul>

                            <div class="tab-content">
                                <div id="home" class="tab-pane fade in active">
                                    <h4>Person Details</h4>
                                    <div class="col-sm-5 col-xs-6 tital " ><strong>First Name:</strong></div><div class="col-sm-5 col-xs-6 "><%=registrar.getRegFirstName()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Middle Name:</strong></div><div class="col-sm-7"> <%=registrar.getRegMiddleName()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Last Name:</strong></div><div class="col-sm-7"> <%=registrar.getRegLastName()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>
                                </div>

                                <div id="menu1" class="tab-pane fade">
                                    <h4>Age details</h4>
                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Age:</strong></div><div class="col-sm-7"><%=registrar.getRegAge()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Date Of Birth:</strong></div><div class="col-sm-7"> N/A </div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Date Of Death:</strong></div><div class="col-sm-7"><%=registrar.getRegdeathDate()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Place Of Birth:</strong></div><div class="col-sm-7">N/A</div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                </div>

                                <div id="menu2" class="tab-pane fade">
                                    <h4>Misc Details</h4>
                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Burial Date:</strong></div><div class="col-sm-7"><%=registrar.getRegburialDate()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Martial status:</strong></div><div class="col-sm-7"><%=registrar.getRegMarriageStatus()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Death Location:</strong></div><div class="col-sm-7"><%=registrar.getRegDeathLocation()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Occupation:</strong></div><div class="col-sm-7"><%=registrar.getRegOccupation()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Religion:</strong></div><div class="col-sm-7"><%=registrar.getRegReligion()%></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong></strong></div><div class="col-sm-7"></div>
                                    <h4>Grave Details</h4>
                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Grave Owner Name:</strong></div><div class="col-sm-7"><%=registrar.getGraveowner().getGraveOwnerName()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>

                                    <div class="col-sm-5 col-xs-6 tital " ><strong>Grave Reference Code:</strong></div><div class="col-sm-7"><%=registrar.getGraveowner().getGraveRefCode()%></div>
                                    <div class="clearfix"></div>
                                    <div class="bot-border"></div>
                                </div>

                                <!--   <h4>Personal details</h4>
                                   <div class="col-sm-5 col-xs-6 tital " >First Name:</div><div class="col-sm-5 col-xs-6 "> Mark</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>

                                   <div class="col-sm-5 col-xs-6 tital " >Middle Name:</div><div class="col-sm-7"> Jason</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>

                                   <div class="col-sm-5 col-xs-6 tital " >Last Name:</div><div class="col-sm-7"> Harvey</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>

                                   <div class="col-sm-5 col-xs-6 tital " >Date Of Birth:</div><div class="col-sm-7">11 April 1918</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Date Of Death:</div><div class="col-sm-7">19 January 2001</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>

                                   <div class="col-sm-5 col-xs-6 tital " >Place Of Birth:</div><div class="col-sm-7">Dundalk</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Age:</div><div class="col-sm-7">83</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Sex:</div><div class="col-sm-7">Male</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Burial Date:</div><div class="col-sm-7">26 January 2001</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Martial status:</div><div class="col-sm-7">Married</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Death Location:</div><div class="col-sm-7">Dundalk</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>
                                   
                                   <div class="col-sm-5 col-xs-6 tital " >Occupation:</div><div class="col-sm-7">Retired</div>
                                   <div class="clearfix"></div>
                                   <div class="bot-border"></div>

                                   <div class="col-sm-5 col-xs-6 tital " >Religion:</div><div class="col-sm-7">Catholic</div>


                                <!-- /.box-body -->
                            </div>
                            <!-- /.box -->

                        </div>


                    </div> 
                </div>
            </div>  

        </div>
    </div>
</div>


