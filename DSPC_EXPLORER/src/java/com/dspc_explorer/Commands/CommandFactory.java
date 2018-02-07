/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Commands;

/**
 *
 * @author Abdul
 */
public class CommandFactory {

    public Command createCommand(String actionString) {
        Command command = null;
        System.out.println(actionString);
        //Instantiate the required Command object...
        if (actionString.equalsIgnoreCase("login")) {
            command = null;
        }
        //Return the instantiated Command object to the calling code...
        return command;// may be null
    }
}
