/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.services;

import com.dspc_explorer.Dtos.Users;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author abdul
 */
public class UserServicesTest {
    
    public UserServicesTest() {
    }

    /**
     * Test of register method, of class UserServices.
     */
    @Test
    public void testRegister() throws Exception {
       System.out.println("register : Test to see if insert sucessfull");
       // Test to see if insert sucessfull
        
        String enteredUserName = "abdulofficial@icloud.com";
        String enteredPassword = "Password";
        int userType = 1;
        UserServices instance = new UserServices();
        boolean expResult = true;
        boolean result = instance.register(enteredUserName, enteredPassword, userType);
        assertEquals(expResult, result);
    }
    
       @Test
    public void testRegister2() throws Exception {
       System.out.println("register");
       // Test to see if insert sucessfull
        
        String enteredUserName = "abdulofficial@icloud.com";
        String enteredPassword = "Password";
        int userType = 1;
        UserServices instance = new UserServices();
        boolean expResult = true;
        boolean result = instance.register(enteredUserName, enteredPassword, userType);
        assertEquals(expResult, result);
    }

    /**
     * Test of login method, of class UserServices.
     */
    @Test
    public void testLogin() throws Exception {
        System.out.println("login");
        String enteredUserName = "";
        String enteredPassword = "";
        UserServices instance = new UserServices();
        Users expResult = null;
        Users result = instance.login(enteredUserName, enteredPassword);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllUsers method, of class UserServices.
     */
    @Test
    public void testGetAllUsers() {
        System.out.println("getAllUsers");
        UserServices instance = new UserServices();
        List<Users> expResult = null;
        List<Users> result = instance.getAllUsers();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of update method, of class UserServices.
     */
    @Test
    public void testUpdate() {
        System.out.println("update");
        Users user = null;
        UserServices instance = new UserServices();
        boolean expResult = false;
        boolean result = instance.update(user);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of changePassword method, of class UserServices.
     */
    @Test
    public void testChangePassword() throws Exception {
        System.out.println("changePassword");
        Users user = null;
        String password = "";
        String oldPassword = "";
        String newPassword = "";
        UserServices instance = new UserServices();
        boolean expResult = false;
        boolean result = instance.changePassword(user, password, oldPassword, newPassword);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of delete method, of class UserServices.
     */
    @Test
    public void testDelete() {
        System.out.println("delete");
        int userId = 0;
        UserServices instance = new UserServices();
        boolean expResult = false;
        boolean result = instance.delete(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of userExists method, of class UserServices.
     */
    @Test
    public void testUserExists() {
        System.out.println("userExists");
        String userName = "";
        UserServices instance = new UserServices();
        boolean expResult = false;
        boolean result = instance.userExists(userName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserByUserName method, of class UserServices.
     */
    @Test
    public void testGetUserByUserName() {
        System.out.println("getUserByUserName");
        String userName = "";
        UserServices instance = new UserServices();
        Users expResult = null;
        Users result = instance.getUserByUserName(userName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of generateSalt method, of class UserServices.
     */
    @Test
    public void testGenerateSalt() throws Exception {
        System.out.println("generateSalt");
        UserServices instance = new UserServices();
        byte[] expResult = null;
        byte[] result = instance.generateSalt();
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getEncryptedPassword method, of class UserServices.
     */
    @Test
    public void testGetEncryptedPassword() throws Exception {
        System.out.println("getEncryptedPassword");
        String passwordString = "";
        byte[] salt = null;
        UserServices instance = new UserServices();
        byte[] expResult = null;
        byte[] result = instance.getEncryptedPassword(passwordString, salt);
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserById method, of class UserServices.
     */
    @Test
    public void testGetUserById() {
        System.out.println("getUserById");
        int id = 0;
        UserServices instance = new UserServices();
        Users expResult = null;
        Users result = instance.getUserById(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
