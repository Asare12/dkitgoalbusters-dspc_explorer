/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.Dtos.Registrar;
import com.dspc_explorer.services.UserServices;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
 * @author abdul
 */
public class UpdateRegistrarCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        int regId = Integer.parseInt(request.getParameter("regId"));
        System.out.println(regId);
        UserServices userService = new UserServices();
        Registrar tmpRegistrar = (Registrar) session.getAttribute("modifyReg"); 
        RequestDispatcher dispatcher;

        if (regId != tmpRegistrar.getRegId()) {
            tmpRegistrar = userService.getRegById(regId);
        }
        if (tmpRegistrar != null) {
            try {
                tmpRegistrar.setRegFirstName(request.getParameter("firstname"));
                tmpRegistrar.setRegMiddleName(request.getParameter("middlename"));
                tmpRegistrar.setRegLastName(request.getParameter("lastname"));
                tmpRegistrar.setRegSex(request.getParameter("sex"));
                tmpRegistrar.setRegAge(request.getParameter("age"));
                tmpRegistrar.setRegReligion(request.getParameter("religion"));
                tmpRegistrar.setRegOccupation(request.getParameter("occupation"));
                tmpRegistrar.setRegDeathLocation(request.getParameter("dlocation"));
                tmpRegistrar.setRegMarriageStatus(request.getParameter("marStat"));
                String ddate = request.getParameter("ddate");
                String bdate = request.getParameter("bdate");

                if (ddate != null && !ddate.isEmpty()) {
                    tmpRegistrar.setRegdeathDate(new SimpleDateFormat("yyyy-MM-dd").parse(ddate));
                    tmpRegistrar.setRegburialDate(new SimpleDateFormat("yyyy-MM-dd").parse(bdate));
                } else {
                    System.out.println("No new Date Entry");
                }
                boolean status = userService.updateRegistrar(tmpRegistrar);
                if (status) {
                    session.setAttribute("status", 0);
                    session.setAttribute("statusMessage", "Record Updated Success");
                } else {
                    session.setAttribute("status", 1);
                    session.setAttribute("statusMessage", "userService.updateRehistrar Failed");
                }

                          
            } catch (ParseException ex) {
                Logger.getLogger(UpdateRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            session.setAttribute("status", 2);
            session.setAttribute("statusMessage", "Update Failed... Registrar null");
        }

    }

}
