/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.services.UserServices;
import com.dspc_explorer.Dtos.Users;
import com.google.gson.Gson;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.apache.logging.log4j.web.WebLoggerContextUtils.getServletContext;

/**
 *
 * @author Abdul
 */
public class LoginUserCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            //System.out.println("In Login UserCommand Execute");

            //Get User entered User name and Password from request..
            String enteredUsername = request.getParameter("userName");
            String enteredPassword = request.getParameter("userPassword");
            HttpSession session = request.getSession(true);

            //For Testing Only
            //System.out.println("User " + enteredUsername + "Pass " + enteredPassword);
            if (enteredUsername != null && !enteredUsername.isEmpty() && enteredPassword != null && !enteredPassword.isEmpty()) {
                //For Testing Only
                //System.out.println("Valid user name Etc");

                UserServices userService = new UserServices();
                Users userLoggingIn = userService.login(enteredUsername, enteredPassword);
                //session.setAttribute("user", userLoggingIn); // set Attribute with either a valid user or null (userService can return null also)
                if (userLoggingIn != null) {
                    //If login successful, set session attribute with logged in user
                    String jsonStringActiveUser = new Gson().toJson(userLoggingIn);
                    System.out.println(jsonStringActiveUser);
                    session.setAttribute("jsonStringActiveUser", jsonStringActiveUser);
                    session.setAttribute("user", userLoggingIn);
                    session.setAttribute("status", 0);
                    session.setAttribute("statusMessage", "Login Success" + userLoggingIn.getUserName());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                } else {
                    //if Login Fail set Sesssion attribte user with null
                    session.setAttribute("status", 1);
                    session.setAttribute("statusMessage", "Login Failed");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("loginFailed.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                //if Login Fail set Sesssion attribte user with null
                session.setAttribute("status", 2);
                session.setAttribute("statusMessage", "No Valid Username or Password Entered");
            }

        } catch (ServletException | IOException | Base64DecodingException ex) {
            Logger.getLogger(LoginUserCommand.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("check loginCommand Exception");
        }
    }
}
