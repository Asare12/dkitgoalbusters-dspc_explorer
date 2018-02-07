/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.logs;

import com.dspc_explorer.Dtos.Users;
import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import static org.apache.logging.log4j.web.WebLoggerContextUtils.getServletContext;

/**
 *
 * @author Abdul
 */
public class Logging {

    private Logger logger;
    private FileHandler fh;

    public void WriteLogOfLogin(Users o) throws IOException {
        logger = Logger.getLogger(Users.class.getName());
        logger.setUseParentHandlers(false);
        try {
            String logFile= getServletContext().getRealPath("/Log/MyLogFile.log");
            System.out.println(logFile);
            fh = new FileHandler(logFile);
            logger.addHandler(fh);
            SimpleFormatter formatter = new SimpleFormatter();
            fh.setFormatter(formatter);

            logger.log(Level.INFO, o.getUserName(), "{0}has Logged In");
        } catch (IOException | SecurityException e) {
            System.out.println(e.getMessage());
        }
    }
}
