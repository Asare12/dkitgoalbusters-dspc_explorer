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
        RequestDispatcher dispatcher = null;

        String nextJSP = "";
        try {
            if (user != null) {
                if (user.getUserType() == 0) {
                    UserServices userservice = new UserServices();
                    List<Graveowner> list = (ArrayList<Graveowner>) userservice.getAllGraveOwner();
                    GeneralServices generalService = new GeneralServices();
                    generalService.printArrayList((ArrayList) list);

                    String jsonStringUserList = list.toString();
                    String jsonString = new Gson().toJson(jsonStringUserList);

                    System.out.println(jsonStringUserList);

                    if (list.size() > 0) {
                        session.setAttribute("list", list);
                        session.setAttribute("jsonStringUserList", jsonString);
                        session.setAttribute("status", 0);
                        session.setAttribute("statusMessage", "List GraveOwners success");
                        nextJSP = "ManageGraveOwner.jsp";
                        response.sendRedirect(nextJSP);
                    } else {
                        System.out.println("Empty List");
                        session.setAttribute("status", 1);
                        session.setAttribute("statusMessage", "List GraveOwners service failed or No GraveOwners in database");
                    }
                } else {
                    session.setAttribute("status", 2);
                    session.setAttribute("statusMessage", "No valid user logged in (Need Admin rights for this action)");
                }

            } else {
                session.setAttribute("status", 3);
                session.setAttribute("statusMessage", "Session expired.. ");
                dispatcher = getServletContext().getRequestDispatcher("/SessionExpired.jsp");
            }

        } catch (IOException ex) {
            Logger.getLogger(LoginUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
