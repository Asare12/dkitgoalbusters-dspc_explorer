/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

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
public class LogoutUserCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Get the session object and invalidate it - this removes all data stored up to now
            // (resets it to blank)
            HttpSession session = request.getSession();
            session.invalidate();
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loggedOut.jsp");
            dispatcher.forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(LogoutUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(LogoutUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
