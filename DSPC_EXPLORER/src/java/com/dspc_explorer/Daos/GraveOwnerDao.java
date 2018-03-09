/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Graveowner;
import com.dspc_explorer.Dtos.Registrar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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
    public boolean deleteGraveOwner(int graveId) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            Graveowner graveowner = new Graveowner();
            graveowner.setGraveId(graveId);
            if (session != null) {
                session.delete(graveowner);
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
            criteria.setFetchMode("section", FetchMode.JOIN)
                    .setFetchMode("registrars", FetchMode.JOIN);
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

    @Override
    public Graveowner getGraveOnwerById(int id) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            // here get object

            Criteria criteria = session.createCriteria(Graveowner.class);
            criteria.setFetchMode("section", FetchMode.JOIN)
                    .setFetchMode("registrars", FetchMode.JOIN);

            criteria.add(Restrictions.idEq(id));
            List<Graveowner> list = criteria.list();
            if (list != null && list.size() > 0) {
                return list.get(0);
            }
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            Logger.getLogger("con").log(Level.SEVERE, "Exception: {0}", ex.getMessage());
            ex.printStackTrace(System.err);
            System.out.println("getGraveOwnerById Exception: " + ex.getMessage());
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return null;
    }

}
