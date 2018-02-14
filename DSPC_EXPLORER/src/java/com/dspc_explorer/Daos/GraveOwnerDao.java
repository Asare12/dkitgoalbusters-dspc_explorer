/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Graveowner;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author abdul
 */
public class GraveOwnerDao implements GraveOwnerDaoInterface {

    Session session = null;
    Transaction tx = null;

    @Override
    public boolean createGraveOwner(Graveowner graveonwer) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.save(graveonwer);
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
    public boolean deleteGraveOwner(Graveowner graveonwer) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.delete(graveonwer);
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
    public boolean updateGraveOwner(Graveowner graveonwer) {

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.update(graveonwer);
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
    public List<Graveowner> getAllgraveOwners() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Graveowner.class);
            List<Graveowner> graveOwnersList = criteria.list();

            tx.commit();
            return graveOwnersList;
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
