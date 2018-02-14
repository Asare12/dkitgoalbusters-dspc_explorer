/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Users;
import com.dspc_explorer.services.UserServices;
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
class UpdateUserProfileCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        int userId = Integer.parseInt(request.getParameter("userToBeUpdated"));
        System.out.println(userId);
        UserServices userService = new UserServices();
        Users tmpUser = (Users) session.getAttribute("user");
        if (userId != tmpUser.getUserId()) {
            tmpUser = userService.getUserById(userId);
        }

        if (tmpUser != null) {
            tmpUser.setFirstName(request.getParameter("firstname"));
            tmpUser.setLastName(request.getParameter("lastname"));
            boolean status = userService.update(tmpUser);
            if (status) {
                session.setAttribute("status", 0);
                session.setAttribute("statusMessage", "User Update Success");
            } else {
                session.setAttribute("status", 1);
                session.setAttribute("statusMessage", "userService.update Failed");
            }

        } else {
            session.setAttribute("status", 2);
            session.setAttribute("statusMessage", "Update Failed... User null");
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProcessResult.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex1) {
            Logger.getLogger(UpdateUserProfileCommand.class.getName()).log(Level.SEVERE, null, ex1);
        }
    }
}
