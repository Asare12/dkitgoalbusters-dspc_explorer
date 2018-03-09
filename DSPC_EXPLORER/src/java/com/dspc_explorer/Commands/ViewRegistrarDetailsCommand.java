/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

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
public class ViewRegistrarDetailsCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        UserServices userservice = new UserServices();
        HttpSession session = request.getSession();
        try {
            int userId = Integer.parseInt(request.getParameter("regId"));
            Registrar registrar = userservice.getRegById(userId);

            if (registrar != null) {
                session.setAttribute("registrar", registrar);
                session.setAttribute("status", 0);
                session.setAttribute("statusMessage", "Registrar exist");
                response.sendRedirect("ViewRegistrarDetails.jsp");
            } else {
                session.setAttribute("status", 1);
                session.setAttribute("statusMessage", "find user Failed.. ");
                response.sendRedirect("ProcessResult.jsp");
            }

        } catch (IOException ex) {
            try {
                Logger.getLogger(ModifyRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
                session.setAttribute("status", 4);
                session.setAttribute("statusMessage", ex.getMessage());
                response.sendRedirect("ProcessResult.jsp");
            } catch (IOException ex1) {
                Logger.getLogger(ModifyRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } catch (NullPointerException | NumberFormatException e) {
            try {
                session.setAttribute("status", 5);
                session.setAttribute("statusMessage", "Invalid Registrar ID" + "<br>" + e.getMessage());
                response.sendRedirect("ProcessResult.jsp");
            } catch (IOException ex) {
                Logger.getLogger(ModifyRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
