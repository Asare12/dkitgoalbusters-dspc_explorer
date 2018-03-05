/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.services.UserServices;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abdul
 */
public class CreateRegistrarCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            String userName = request.getParameter("userName");
            String password = request.getParameter("userPassword");
            
            
            int graveId = Integer.parseInt(request.getParameter("graveid"));
            String regFirstName = request.getParameter("firstname");
            String regMiddleName = request.getParameter("middlename");
            String regLastName = request.getParameter("lastname");
            String regSex = request.getParameter("sex");
            String regAge = request.getParameter("age");
            String regReligion = request.getParameter("religion");
            String regOccupation = request.getParameter("occupation");
            String regDeathLocation = request.getParameter("deathlocation");
            String regMarriageStatus = request.getParameter("marriagestat");
            String ddate = request.getParameter("ddate");
            String bdate = request.getParameter("burdate");
            Date regdeathDate = new SimpleDateFormat("yyyy-MM-dd").parse(ddate);
            Date regburialDate = new SimpleDateFormat("yyyy-MM-dd").parse(bdate);

            HttpSession session = request.getSession();
            
            if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty()) {
                try {
                    UserServices userservices = new UserServices();
                    if (userservices.register(userName, password, 1)) {
                        session.setAttribute("status", 0);
                        session.setAttribute("statusMessage", "User Created Sucessfully");
                    } else {
                        session.setAttribute("status", 1);
                        session.setAttribute("statusMessage", "User Creation unSucessfull");
                    }
                } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                    Logger.getLogger(CreateUserCommand.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                session.setAttribute("status", 2);
                session.setAttribute("statusMessage", "Cannot Create Null Users");
            }
        } catch (ParseException ex) {
            Logger.getLogger(CreateRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
