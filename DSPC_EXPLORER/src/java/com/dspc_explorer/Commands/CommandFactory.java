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
            command = new LoginUserCommand();
        } else if (actionString.equalsIgnoreCase("manageRegistrar")) {
            command = new ManageRegistrarCommand();
        } else if (actionString.equalsIgnoreCase("modifyReg")) {
            command = new ModifyRegistrarCommand();
        } else if (actionString.equalsIgnoreCase("logout")) {
            //command = new LogoutUserCommand();
        } else if (actionString.equalsIgnoreCase("something")) {
            //command = new ManageRegistrarCommand();
        } else if (actionString.equalsIgnoreCase("delete")) {
            command = new DeleteRegistrarCommand();
        } else if (actionString.equalsIgnoreCase("changePassword")) {
           // command = new ChangePasswordCommand();
        } else if (actionString.equalsIgnoreCase("verifyEmail")) {
            //command = new VerifyEmailCommand();
        } else if (actionString.equalsIgnoreCase("resendVerificationMail")) {
            //command = new ResendVerificationMailCommand();
        }else if(actionString.equalsIgnoreCase("modify")){
            //command = new ModifyUserCommand();
        }else if(actionString.equalsIgnoreCase("addRegistrar")){
            //command = new CreateUserCommand();
        }
        //Return the instantiated Command object to the calling code...
        return command;// may be null
    }
}
