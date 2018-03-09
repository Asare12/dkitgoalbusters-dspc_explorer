/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import java.sql.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author abdul
 */
public class RegistrarDao implements RegistrarDaoInterface {

    Session session = null;
    Transaction tx = null;

    @Override
    public boolean createRegistrar(Registrar registrar) {

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.save(registrar);
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

    @Override
    public boolean deleteRegistrar(int regId) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            Registrar registrar = new Registrar();
            registrar.setRegId(regId);
            if (session != null) {
                session.delete(registrar);
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

    @Override
    public boolean updateRegistrar(Registrar registrar) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.update(registrar);
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

    @Override
    public List<Registrar> getAllRegistar() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Registrar.class);
            criteria.setFetchMode("graveowner", FetchMode.JOIN);
            List<Registrar> registrarList = criteria.list();

            tx.commit();
            return registrarList;
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

    public Registrar getRegistrarbyRegId(int UserId) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            // here get object
            Criteria criteria = session.createCriteria(Registrar.class);
            criteria.setFetchMode("graveowner", FetchMode.JOIN);

            criteria.add(Restrictions.idEq(UserId));
            List<Registrar> list = criteria.list();// get the list of result obtained by given criteria
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

    @Override
    public Registrar multipleSearchRegistrar(String firstname, String lastName, Date ddate, Date bdate, String graveref, String graveowner) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            // here get object
            Registrar registrar = new Registrar();
            Graveowner graveowner1 = new Graveowner();
            registrar.setRegFirstName(firstname);
            registrar.setRegLastName(lastName);
            registrar.setRegdeathDate(ddate);
            registrar.setRegburialDate(bdate);
            graveowner1.setGraveOwnerName(graveowner);
            graveowner1.setGraveRefCode(graveref);
            registrar.setGraveowner(graveowner1);
            
            Criteria criteria = session.createCriteria(Registrar.class);
            criteria.setFetchMode("graveowner", FetchMode.JOIN);
            criteria.add(Example.create(registrar));

            List<Registrar> list = criteria.list();// get the list of result obtained by given criteria
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
