/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

import com.dspc_explorer.services.UserServices;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abdul
 */
public class CreateRegistrarCommand implements Command {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        try {

            int graveId = Integer.parseInt(request.getParameter("graveid"));
            String regFirstName = request.getParameter("firstname");
            String regMiddleName = request.getParameter("middlename");
            String regLastName = request.getParameter("lastname");
            String regSex = request.getParameter("sex");
            String regAge = request.getParameter("age");
            String regReligion = request.getParameter("religion");
            String regOccupation = request.getParameter("occupation");
            String regDeathLocation = request.getParameter("dlocation");
            String regMarriageStatus = request.getParameter("marStat");
            String ddate = request.getParameter("ddate");
            String bdate = request.getParameter("bdate");
            Date regdeathDate = new SimpleDateFormat("yyyy-MM-dd").parse(ddate);
            Date regburialDate = new SimpleDateFormat("yyyy-MM-dd").parse(bdate);

            HttpSession session = request.getSession();

            UserServices services = new UserServices();
            if (services.createRegistrar(graveId, regFirstName, regMiddleName, regLastName, regSex, regAge, regReligion, regOccupation, regDeathLocation, regMarriageStatus, regdeathDate, regburialDate)) {
                session.setAttribute("status", 0);
                session.setAttribute("statusMessage", "Registrar Added Sucessfully to Records");
            } else {
                session.setAttribute("status", 1);
                session.setAttribute("statusMessage", "Registrar Added Not Sucessfully");
            }

        } catch (ParseException ex) {
            Logger.getLogger(CreateRegistrarCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
