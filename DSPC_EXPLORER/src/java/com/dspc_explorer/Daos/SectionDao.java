/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import com.dspc_explorer.Dtos.Section;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author abdul
 */
public class SectionDao implements SectionDaoInterface {

    Session session = null;
    Transaction tx = null;

    @Override
    public boolean createSection(Section section) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.save(section);
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
    public boolean deleteSection(Section section){
      try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.delete(section);
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
    public boolean updateSection(Section section) {
         try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            if (session != null) {
                session.update(section);
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
    public List<Section> getAllSection() {
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            tx = session.beginTransaction();
            Criteria criteria = session.createCriteria(Section.class);
            List<Section> sectionList = criteria.list();

            tx.commit();
            return sectionList;
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
