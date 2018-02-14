/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
    public boolean deleteRegistrar(Registrar registrar) {
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
    public boolean updateRegistrar(Registrar registrar) {
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
    public List<Registrar> getAllRegistar() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Registrar.class);
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

}
