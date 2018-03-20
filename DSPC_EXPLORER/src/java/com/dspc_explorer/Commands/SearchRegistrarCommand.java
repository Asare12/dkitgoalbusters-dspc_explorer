/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Registrar;
import com.dspc_explorer.services.GeneralServices;
import com.dspc_explorer.services.UserServices;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abdul
 */
public class SearchRegistrarCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(true);
            UserServices userService = new UserServices();
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            List<Registrar> list;
            
            if(firstname != null && !firstname.isEmpty() || lastname != null && !lastname.isEmpty()){
                list = (ArrayList<Registrar>) userService.searchRegistrar(firstname, lastname);
               
                if (list.size() > 0) {
                GeneralServices generalService = new GeneralServices();
                generalService.printArrayList((ArrayList) list);
                String jsonStringUserList = list.toString();
                String jsonString = new Gson().toJson(jsonStringUserList);
                
                    session.setAttribute("list", list);
                    session.setAttribute("jsonStringUserList", jsonString);
                    session.setAttribute("status", 0);
                    session.setAttribute("statusMessage", "List Users success");
                    response.sendRedirect("ViewRegistrarSearchResult.jsp");

                }

            }
           
        }catch (IOException ex) {
            Logger.getLogger(SearchRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

        

    }
    
}
