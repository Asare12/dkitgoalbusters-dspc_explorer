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
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Abdul
 */
public class UserDao implements UserDaoInterface {

    Session session = null;
    Transaction tx = null;

    /**
     * This is the user command class Create HibernateUtil session to gain
     * access to database
     */
    /**
     * User
     *
     * @param user User object to be inserted into user table in DB
     * @return true if insert statement is successful
     * @throws java.security.NoSuchAlgorithmException Requested crypto algorithm
     * not available, the exception is thrown
     * @throws java.security.spec.InvalidKeySpecException Invalid Key
     * Specification
     */
    @Override
    public boolean insertUser(Users user) throws NoSuchAlgorithmException, InvalidKeySpecException {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.save(user);
                tx.commit();
                return true;
            }
            session.close();
        } catch (HibernateException e) {
            try {
                tx.rollback();
            } catch (RuntimeException r) {
                System.out.println("Can't rollback transaction" + r);

            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return false;
    }

    /**
     *
     * @param userName
     * @return
     */
    @Override
    public Users getUserbyUserName(String userName) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            // here get object
            Criteria criteria = session.createCriteria(Users.class);
            criteria.add(Restrictions.eq("userName", userName));
            List<Users> list = criteria.list();// get the list of result obtained by given criteria
            System.out.println(list.size());
            if (list != null && list.size() > 0) {
                return list.get(0);
            }
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            Logger.getLogger("con").log(Level.SEVERE, "Exception: {0}", ex.getMessage());
            ex.printStackTrace(System.err);
            System.out.println("Login Exception" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }

    /**
     *
     * @param user
     * @return
     */
    @Override
    public boolean updateUser(Users user) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.update(user);
                tx.commit();
                return true;
            }

        } catch (HibernateException e) {
            try {
                tx.rollback();
            } catch (RuntimeException r) {
                System.out.println("Can't rollback transaction");

            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return false;
    }

    /**
     *
     * @return A list of users from the database.
     */
    @Override
    public List<Users> getAllUsers() {

        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Users.class);
            List<Users> userList = criteria.list();

            //SQLQuery query = session.createSQLQuery("call GetListUser()").addEntity(Users.class);
            //List<Users> userList = (ArrayList<Users>) query.list();
            tx.commit();
            return userList;
        } catch (HibernateException e) {
            try {
                tx.rollback();
            } catch (RuntimeException r) {
                System.out.println("Can't rollback transaction");

            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    /**
     *
     * @param userId
     * @param user
     * @return
     */
    public boolean deleteUser(int userId) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            Users user = new Users();
            user.setUserId(userId);

            if (session != null) {
                session.delete(user);
                tx.commit();
                return true;
            }

        } catch (HibernateException e) {
            try {
                tx.rollback();
            } catch (RuntimeException r) {
                System.out.println("RunTime Exception at deleteUser() Method in UserDao(class):  Can't rollback transaction");

            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return false;
    }

    public Users getUserbyUserId(int UserId) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            // here get object
            Criteria criteria = session.createCriteria(Users.class);
            criteria.add(Restrictions.idEq(UserId));
            List<Users> list = criteria.list();// get the list of result obtained by given criteria
            if (list != null && list.size() > 0) {
                return list.get(0);
            }
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            Logger.getLogger("con").log(Level.SEVERE, "Exception: {0}", ex.getMessage());
            ex.printStackTrace(System.err);
            System.out.println("Login Exception" + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }

}
