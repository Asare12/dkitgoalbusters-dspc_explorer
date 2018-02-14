/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.services.UserServices;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abdul
 */
public class CreateUserCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("userName");
        String password = request.getParameter("userPassword");
        HttpSession session = request.getSession();
        if (userName != null && !userName.isEmpty() && password != null && !password.isEmpty()) {
            try {
                UserServices userservices = new UserServices();
                if (userservices.register(userName, password, 1)) {
                    session.setAttribute("status", 0);
                    session.setAttribute("statusMessage", "User Created Sucessfully");
                }else {
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
    }
}
