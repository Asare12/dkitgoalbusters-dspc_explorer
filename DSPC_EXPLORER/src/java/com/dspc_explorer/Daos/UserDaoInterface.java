/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Users;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.List;

/**
 *
 * @author Abdul
 */
public interface UserDaoInterface {

    public boolean insertUser(Users user) throws NoSuchAlgorithmException, InvalidKeySpecException;

    public Users getUserbyUserName(String userName) throws NoSuchAlgorithmException, InvalidKeySpecException;
    
    public boolean updateUser(Users user);
    public List<Users> getAllUsers();

}
