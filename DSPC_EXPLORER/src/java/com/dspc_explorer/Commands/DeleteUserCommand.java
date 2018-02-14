/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Users;
import com.dspc_explorer.services.UserServices;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.List;
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
public class DeleteUserCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        List<String> userIdList = new Gson().fromJson(request.getParameter("userIdList"), List.class);
        //System.out.println(userIdList.get(0));
        UserServices userservice = new UserServices();
        HttpSession session = request.getSession();
        try {
            if (userIdList != null && userIdList.size()>0) {
                for (String userId : userIdList) {
                    Users user = userservice.getUserById(Integer.parseInt(userId));

                    if (user.getUserType() != 0) {

                        if (userservice.delete(user.getUserId())) {
                            session.setAttribute("status", 0);
                            session.setAttribute("statusMessage", "Delete Success");
                        } else {
                            session.setAttribute("status", 1);
                            session.setAttribute("statusMessage", "Delete Failed");
                        }
                    } else {
                        session.setAttribute("status", 5);
                        session.setAttribute("statusMessage", "Ohoooo no.. Don't Delete the Master");
                    }
                }
            } else {
                session.setAttribute("status", 6);
                session.setAttribute("statusMessage", "Ohoooo no.. Nothing to Delete.. ha ha ha");
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProcessResult.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(DeleteUserCommand.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("status", 4);
            session.setAttribute("statusMessage", ex.getMessage());
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProcessResult.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException ex1) {
                Logger.getLogger(DeleteUserCommand.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }

    }

}
