/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dspc_explorer.Daos;

import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author abdul
 */
public class HibernateUtil {
    

    private static final SessionFactory sessionFactory = buildSessionFactory();

   private static SessionFactory buildSessionFactory(){
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml)
            // config file.
            //Annotation
            Configuration cfg = new Configuration();
            SessionFactory sf = (SessionFactory) cfg.configure().buildSessionFactory();
            return sf;
            
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory()
    {
        return sessionFactory;
    }
}
