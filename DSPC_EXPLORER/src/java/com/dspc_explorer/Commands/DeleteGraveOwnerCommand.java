/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import com.dspc_explorer.services.UserServices;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abdul
 */
public class DeleteGraveOwnerCommand implements Command{

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
         int graveId = Integer.parseInt(request.getParameter("graveId"));
        //System.out.println(userIdList.get(0));
        UserServices userservice = new UserServices();
        HttpSession session = request.getSession();
        String url="/ProcessResult.jsp";

        try {
            if (graveId > 0) {
                    Graveowner graveowner = userservice.getGraveOwnerById(graveId);
                    if (userservice.deleteRegistrar(graveowner.getGraveId())) {
                        session.setAttribute("status", 0);
                        session.setAttribute("statusMessage", "Delete Success");
                        response.sendRedirect("ProcessResult.jsp");
                    } else {
                        session.setAttribute("status", 1);
                        session.setAttribute("statusMessage", "Delete Failed");
                    }                
            } else {
                session.setAttribute("status", 6);
                session.setAttribute("statusMessage", "Ohoooo no.. Nothing to Delete.. ha ha ha");
            }
            
        } catch (IOException ex) {
            Logger.getLogger(DeleteUserCommand.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("status", 4);
            session.setAttribute("statusMessage", ex.getMessage());
         
        }
    }
    
}
