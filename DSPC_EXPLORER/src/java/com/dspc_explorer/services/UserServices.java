/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.services;

import com.dspc_explorer.Daos.GraveOwnerDao;
import com.dspc_explorer.Daos.RegistrarDao;
import com.dspc_explorer.Daos.UserDao;
import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import com.dspc_explorer.Dtos.Users;
import com.dspc_explorer.logs.Logging;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.io.IOException;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author Abdul
 */
public class UserServices {

    Logging log = new Logging();

    /**
     *
     * @param enteredUserName
     * @param enteredPassword
     * @param userType
     * @return boolean
     * @throws NoSuchAlgorithmException
     * @throws InvalidKeySpecException
     */
    public boolean register(String enteredUserName, String enteredPassword, int userType) throws NoSuchAlgorithmException, InvalidKeySpecException {

        Users user = new Users();
        user.setUserId(null);
        user.setUserName(enteredUserName);
        user.setUserType(userType);
        try {
            byte[] salt = generateSalt();
            user.setUserPassword(Base64.encode(getEncryptedPassword(enteredPassword, salt)));
            user.setPasswordSalt(Base64.encode(salt));
            UserDao userDao = new UserDao();
            return userDao.insertUser(user);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
        }
        return false;
    }

    public boolean createRegistrar(int graveId, String regFirstName, String regMiddleName, String regLastName, String regSex, String regAge, String regReligion, String regOccupation, String regDeathLocation, String regMarriageStatus, Date regdeathDate, Date regburialDate) {
        Registrar registrar = new Registrar();
        Graveowner graveowner = new Graveowner();
        graveowner.setGraveId(graveId);
        registrar.setGraveowner(graveowner);
        registrar.setRegFirstName(regFirstName);
        registrar.setRegMiddleName(regMiddleName);
        registrar.setRegLastName(regLastName);
        registrar.setRegSex(regSex);
        registrar.setRegAge(regAge);
        registrar.setRegReligion(regReligion);
        registrar.setRegOccupation(regOccupation);
        registrar.setRegMarriageStatus(regMarriageStatus);
        registrar.setRegDeathLocation(regDeathLocation);
        registrar.setRegdeathDate(regdeathDate);
        registrar.setRegburialDate(regburialDate);

        RegistrarDao registrarDao = new RegistrarDao();
        return registrarDao.createRegistrar(registrar);
    }

    /**
     * Author Abdul
     *
     * @param enteredUserName
     * @param enteredPassword
     * @return User compare user details entered with the useres in database and
     * allow login
     */
    public Users login(String enteredUserName, String enteredPassword) throws IOException, Base64DecodingException {
        /*  For Testing Only
        System.out.println("In Login UserCommand Execute");
        System.out.println("User " + enteredUserName + "Pass " + enteredPassword);
            System.out.println("Valid user name Etc");*/
        try {
            //Use the UserAssist class to login...
            UserDao userDao = new UserDao();
            Users logingUser = userDao.getUserbyUserName(enteredUserName);
            if (logingUser != null) {
                byte[] storedPasswordSalt = Base64.decode(logingUser.getPasswordSalt());
                if (storedPasswordSalt != null) {
                    byte[] encryptedEnteredPassword = getEncryptedPassword(enteredPassword, storedPasswordSalt);
                    //Encrypt the user entered password with the salt stored in database
                    byte[] storedPassword = Base64.decode(logingUser.getUserPassword());
                    if (Arrays.equals(storedPassword, encryptedEnteredPassword)) {
                        //Log the current user logged in into a file and the time logged in
                        return logingUser;
                    } else {
                        return null;
                    }
                } else {
                    return null;
                }
            }
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {

            Logger.getLogger(UserServices.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Exception: FROM login() UserServices class");
        }

        return null;
    }

    public List<Users> getAllUsers() {
        UserDao userdao = new UserDao();
        return (ArrayList<Users>) userdao.getAllUsers();
    }

    public List<Registrar> getAllRegistrar() {
        RegistrarDao registrarDao = new RegistrarDao();
        return (ArrayList<Registrar>) registrarDao.getAllRegistar();
    }

    public List<Graveowner> getAllGraveOwner() {
        GraveOwnerDao graveOwnerDao = new GraveOwnerDao();
        return (ArrayList<Graveowner>) graveOwnerDao.getAllgraveOwners();
    }

    public Registrar getRegById(int id) {
        RegistrarDao registrarDao = new RegistrarDao();
        Registrar registrar = registrarDao.getRegistrarbyRegId(id);

        if (registrar != null) {
            return registrar;
        } else {
            return null;
        }

    }

    public Graveowner getGraveOwnerById(int id) {
        GraveOwnerDao graveOwnerDao = new GraveOwnerDao();
        Graveowner graveowner = graveOwnerDao.getGraveOnwerById(id);

        if (graveowner != null) {
            return graveowner;
        } else {
            return null;
        }

    }

    public boolean updateRegistrar(Registrar registrar) {
        RegistrarDao registrarDao = new RegistrarDao();

        return registrarDao.updateRegistrar(registrar);
    }

    public boolean update(Users user) {
        UserDao userdao = new UserDao();

        return userdao.updateUser(user);
    }

    
    public List<Registrar> searchRegistrar(String firstname, String lastName){
        RegistrarDao registrarDao = new RegistrarDao();
        return registrarDao.multipleSearchRegistrar(firstname, lastName);
    }
    
    public boolean changePassword(Users user, String password, String oldPassword, String newPassword) throws NoSuchAlgorithmException, InvalidKeySpecException, Base64DecodingException {
        UserDao userdao = new UserDao();
        byte[] salt = generateSalt();
        byte[] tmpSalt = Base64.decode(user.getPasswordSalt());
        byte[] tmpOldPass = getEncryptedPassword(oldPassword, tmpSalt);
        if (Base64.encode(tmpOldPass).equalsIgnoreCase(user.getUserPassword())) {
            if (password.equalsIgnoreCase(newPassword)) {
                user.setUserPassword(Base64.encode(getEncryptedPassword(password, salt)));
                user.setPasswordSalt(Base64.encode(salt));
                return userdao.updateUser(user);
            }
        } else {
            return false;
        }
        return false;
    }

    public boolean delete(int userId) {
        UserDao userdao = new UserDao();
        return userdao.deleteUser(userId);
    }

    public boolean deleteRegistrar(int regId) {
        RegistrarDao registrarDao = new RegistrarDao();
        return registrarDao.deleteRegistrar(regId);
    }

    public boolean deleteGraveOwner(int graveId) {
        GraveOwnerDao graveOwnerDao = new GraveOwnerDao();
        return graveOwnerDao.deleteGraveOwner(graveId);
    }

    /**
     * Author check if given username already present in User table.
     *
     * @param userName
     * @return
     */
    public boolean userExists(String userName) {
        UserDao userDao = new UserDao();
        if (userDao.getUserbyUserName(userName) != null) {
            System.out.println("Exists");
            return true;

        }
        return false;
    }

    public Users getUserByUserName(String userName) {
        return new UserDao().getUserbyUserName(userName);
    }

    /**
     * Author Abdul
     *
     * @return byte[] of salt generated using the SecureRandom function with
     * SHA-1 instance
     * @throws NoSuchAlgorithmException Requested crypto algorithm not
     * available, the exception is thrown
     */
    public byte[] generateSalt() throws NoSuchAlgorithmException {
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
        // Generate a 16 byte (128 bit) salt
        byte[] salt = new byte[16];
        random.nextBytes(salt);
        return salt;

    }

    /**
     * Author Abdul
     *
     * @param passwordString user entered String
     * @param salt salt generated using SecureRandom Function - call
     * generateSalt() to get salt
     * @return return the byte array of secret key generated - Returns the key
     * in its primary encoding format
     * @throws NoSuchAlgorithmException Requested crypto algorithm not
     * available, the exception is thrown
     * @throws InvalidKeySpecException Invalid Key Specification
     */
    public byte[] getEncryptedPassword(String passwordString, byte[] salt) throws NoSuchAlgorithmException, InvalidKeySpecException {
        String algorithm = "PBKDF2WithHmacSHA512";
        // SHA-512 generates 256 bit hashes, so that's what makes sense here
        int derivedKeyLength = 256;
        // Pick an iteration. Usually iteration over 1000
        int iterations = 20000;
        KeySpec spec = new PBEKeySpec(passwordString.toCharArray(), salt, iterations, derivedKeyLength);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(algorithm); //create a key factory of PBKDF2
        return keyFactory.generateSecret(spec).getEncoded();
    }

    public Users getUserById(int id) {
        UserDao userdao = new UserDao();
        Users user = userdao.getUserbyUserId(id);

        if (user != null) {
            return user;
        } else {
            return null;
        }

    }

}
