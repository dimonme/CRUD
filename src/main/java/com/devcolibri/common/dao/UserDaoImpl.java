package com.devcolibri.common.dao;

import com.devcolibri.common.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao
{
private static final Logger logger= LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory; //eto suschnost, sozdanie sessii for soedineniya s basoi dannix

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session=this.sessionFactory.getCurrentSession();//sozdaem sessiy kotoraya prosit nashu fabriku sessii poluchit tekuschuyu sessiu
        session.persist(user); //sessiya budet soxranyat obiekt kotorii mi peredali
        logger.info("User successfully saved. User details: "+user);
        
    }

    @Override
    public void updateUser(User user) {
        Session session=this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully update. User details: "+user);
    }

    @Override
    public void removeUser(int id) {
        Session session=this.sessionFactory.getCurrentSession();
        User user=(User) session.load(User.class, new Integer(id));

        if (user!=null)
        {
            session.delete(user);
        }
        logger.info("User successfully removed. User details: "+ user);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() //vivodim spisok users
    {
        Session session=this.sessionFactory.getCurrentSession();
        List<User> list=session.createQuery("from User").list(); //from User - eto nazvanie classa

        //zalogiruem informaciu po kazdomu Users
        for (User user: list)
        {
            logger.info("User list: " + user);
        }
        return list;
    }

    @Override
    public User getUserById(int id)  //POLUCHAEM Usera s pomoschiyu id
    {
        Session session=this.sessionFactory.getCurrentSession();
        User user=(User) session.load(User.class, new Integer(id));
        logger.info("User successfully loaded. User details: "+ user);
        return user;
    }


    @Override
    public List<User> getUsersByName(String requestName)  //POLUCHAEM Usera s pomoschiyu name
    {
        Session session=this.sessionFactory.openSession();
        List<User> users=new ArrayList<User>();
        users.addAll(session.createQuery("from User where name=:requestName").setString("requestName", requestName).list());
        logger.info("User successfully loaded. User details: "+ users);
        return users;
    }

    /*
    @Override
    public List<User> getUsersByName(String name)   //POLUCHAEM Usera s pomoschiyu name
    {
        List<User> users = new ArrayList<User>();
        //try (Session session = sessionFactory.openSession())
        try (Session session=sessionFactory.openSession())
        {
            users.addAll(session.createQuery("from User where name = :requestName").setString("name", name).list());
        }
        catch (RuntimeException e)
        {
            e.printStackTrace();
        }
        return users;
    }
    */
}
