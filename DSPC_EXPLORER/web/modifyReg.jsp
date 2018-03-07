<%-- 
    Document   : modifyReg
    Created on : 24-Feb-2018, 13:32:26
    Author     : Abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Registrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Registrar reg = (Registrar) request.getSession().getAttribute("modifyReg"); %>

<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Registrar Record </h4>
    </div>
    <div class="modal-body">
        <form id="signupform" role="form" method="POST" onsubmit="addGraveOwner(this); return false;"><!--method defined in ManageUsers.jsp-->
            <div class="form-group">
                <label for="firstname">First Name</label>
                <input type="firstname" class="form-control" name="firstname" placeholder="<%=reg.getRegFirstName()%>" required>
            </div>
            <div class="form-group">
                <label for="Middlename">Middle Name</label>
                <input type="middlename" class="form-control" name="middlename" placeholder="Enter Middle name(Optional)">
            </div>
            <div class="form-group">
                <label for="Lastname">Last Name</label>
                <input type="lastname" class="form-control" name="lastname" placeholder="Enter Last Name">
            </div>

            <div class="form-group">
                <label for="sex">Sex</label>
                <input type="sex" class="form-control" name="sex" placeholder=" 'Male' or 'Female' ">
            </div>

            <div class="form-group">
                <label for="row">Age</label>
                <input type="row" class="form-control" name="row" placeholder="Enter The row ">
            </div>

            <div class="form-group">
                <label for="depth">Religion</label>
                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
            </div>

            <div class="form-group">
                <label for="depth">Occupation</label>
                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
            </div>

            <div class="form-group">
                <label for="depth">Death Location</label>
                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
            </div>

            <div class="form-group">
                <label for="depth">Death Date</label>
                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
            </div>

            <div class="form-group">
                <label for="depth">Burial Date</label>
                <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
            </div>

            <input type="hidden" name="action" value="addGraveOwner">
            <div class="form-group">
                <!-- Button -->                                        
                <button type="submit" class="btn btn-default">Edit</button>
            </div>
        </form>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    </div>
</div>