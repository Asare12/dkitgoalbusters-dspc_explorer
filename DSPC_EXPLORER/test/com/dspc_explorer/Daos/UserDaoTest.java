/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Users;
import com.dspc_explorer.services.UserServices;
import java.util.List;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Asare
 */
public class UserDaoTest {
    
    public UserDaoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of insertUser method, of class UserDao.
     */
    @Test
    public void testInsertUser() throws Exception {
        System.out.println("insertUser");
        Users user = null;
        // this step declare user variables and assign values
        
        String username = "David";
        String userPassword = "Password";
        
        //this step look at the login method on the user services class and see how it works  need to call class to check returns
        
        UserServices services = new UserServices(); // instead of services class u can test the userDao class to
        
        //Make sure to test userdao and userservices classes in seperate tests etc 
        // this is the generall idea ---> Test must make sense 
        
        
        //this step use assertion to determine result with expected results 
        
        boolean results = services.register(username, userPassword, 0);
        
        
        
        boolean expResult = false;  
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserbyUserName method, of class UserDao.
     */
    @Test
    public void testGetUserbyUserName() {
        System.out.println("getUserbyUserName");
        String userName = "";
        UserDao instance = new UserDao();
        Users expResult = null;
        Users result = instance.getUserbyUserName(userName);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of updateUser method, of class UserDao.
     */
    @Test
    public void testUpdateUser() {
        System.out.println("updateUser");
        Users user = null;
        UserDao instance = new UserDao();
        boolean expResult = false;
        boolean result = instance.updateUser(user);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAllUsers method, of class UserDao.
     */
    @Test
    public void testGetAllUsers() {
        System.out.println("getAllUsers");
        UserDao instance = new UserDao();
        List<Users> expResult = null;
        List<Users> result = instance.getAllUsers();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of deleteUser method, of class UserDao.
     */
    @Test
    public void testDeleteUser() {
        System.out.println("deleteUser");
        int userId = 0;
        UserDao instance = new UserDao();
        boolean expResult = false;
        boolean result = instance.deleteUser(userId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUserbyUserId method, of class UserDao.
     */
    @Test
    public void testGetUserbyUserId() {
        System.out.println("getUserbyUserId");
        int UserId = 0;
        UserDao instance = new UserDao();
        Users expResult = null;
        Users result = instance.getUserbyUserId(UserId);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
