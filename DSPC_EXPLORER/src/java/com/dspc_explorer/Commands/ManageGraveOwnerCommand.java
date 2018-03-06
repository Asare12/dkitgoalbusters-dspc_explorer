/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Users;
import com.dspc_explorer.services.GeneralServices;
import com.dspc_explorer.services.UserServices;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.util.ArrayList;
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
public class ManageGraveOwnerCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        Users user = (Users) request.getSession().getAttribute("user");
        RequestDispatcher dispatcher;
        try {
            if (user != null) {
                if (user.getUserType() == 0) {
                    UserServices userservice = new UserServices();
                    List<Graveowner> list = (ArrayList<Graveowner>) userservice.getAllGraveOwner();
                    GeneralServices generalService = new GeneralServices();
                    generalService.printArrayList((ArrayList) list);
                   
                    String jsonStringUserList = new Gson().toJson(list,Graveowner.class);
                    
                    
                    System.out.println(jsonStringUserList);
                    if (list != null) {
                        session.setAttribute("list", list);
                        session.setAttribute("jsonStringUserList", jsonStringUserList);
                        session.setAttribute("status", 0);
                        session.setAttribute("statusMessage", "List Users success");
                        dispatcher = getServletContext().getRequestDispatcher("ManageGraveOwner.jsp");
                    } else {
                        System.out.println("Empty List");
                        session.setAttribute("status", 1);
                        session.setAttribute("statusMessage", "List Users service failed or No users in database");
                        dispatcher = getServletContext().getRequestDispatcher("ProcessResult.jsp");
                    }
                } else {
                    session.setAttribute("status", 2);
                    session.setAttribute("statusMessage", "No valid user logged in (Need Admin rights for this action)");
                    dispatcher = getServletContext().getRequestDispatcher("ProcessResult.jsp");

                }

            } else {
                session.setAttribute("status", 3);
                session.setAttribute("statusMessage", "Session expired.. ");
                dispatcher = getServletContext().getRequestDispatcher("/SessionExpired.jsp");
            }
            dispatcher.forward(request, response);

        } catch (ServletException | IOException ex) {
            Logger.getLogger(LoginUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
