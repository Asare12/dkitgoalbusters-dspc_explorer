<%-- 
    Document   : AddGraveowner
    Created on : 20-Feb-2018, 2:11:06
    Author     : Abdul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<div class="modal-content container">
    <div class="col-md-12">
        <!-- Modal content-->
        <div >
            <div class="modal-header">
                <button type="button" class="close" onclick="closeAddUserModal()">&times;</button>
                <!--// method defined in ManageUsers.jsp-->
                <center> <h4 class="modal-title" ><B>Create/Add Existing/New Records of Grave Owner</b></h4></center>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div id="signupbox" class="col-lg-12">
                        <form id="signupform" role="form" method="POST" onsubmit="addUser(this); return false;"><!--method defined in ManageUsers.jsp-->
                            <div class="form-group">
                                <label for="graverefcode">Grave Ref Code</label>
                                <input type="graverefcode" class="form-control" name="graverefcode" placeholder="Enter Reference Code" required>
                            </div>
                            <div class="form-group">
                                <label for="graveowner">Owner Name</label>
                                <input type="name" class="form-control" name="name" placeholder="Grave Owner Name..">
                            </div>
                            <div class="form-group">
                                <label for="address">Owner Address</label>
                                <input type="address" class="form-control" name="address" placeholder="Grave Owner Address">
                            </div>

                            <div class="form-group">
                                <label for="dateopened">Date Opened</label>
                                <input type="dateopened" class="form-control" name="dateopened" placeholder="Date Opened">
                            </div>

                            <div class="form-group">
                                <label for="row">Grave Row</label>
                                <input type="row" class="form-control" name="row" placeholder="Enter The row ">
                            </div>

                            <div class="form-group">
                                <label for="depth">Grave Depth</label>
                                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                            </div>

                            <input type="hidden" name="action" value="addGraveOwner">
                            <div class="form-group">
                                <!-- Button -->                                        
                                <button type="submit" class="btn btn-default">Add Grave Owner</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer ">

            </div>
        </div>
    </div>
</div>