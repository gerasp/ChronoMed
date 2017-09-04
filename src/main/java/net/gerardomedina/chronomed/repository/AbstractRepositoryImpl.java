package net.gerardomedina.chronomed.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.util.List;

@SuppressWarnings("unchecked")
public abstract class AbstractRepositoryImpl<T> {

    Class<T> entityClass;

    SessionFactory sessionFactory;

    public AbstractRepositoryImpl(Class<T> entityClass, SessionFactory sessionFactory) {
        this.entityClass = entityClass;
        this.sessionFactory = sessionFactory;
    }

    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }

    @Transactional
    public void create(T entity) {
        this.sessionFactory.getCurrentSession().persist(entity);
    }

    @Transactional
    public void update(T entity) {
        this.sessionFactory.getCurrentSession().update(entity);
    }

    @Transactional
    public List<T> list() {
        return (List<T>) this.sessionFactory.getCurrentSession().createQuery("from "+entityClass.getName()).list();
    }

    @Transactional
    public T find(int id) {
        return (T) this.sessionFactory.getCurrentSession().load(entityClass, id);
    }

    @Transactional
    public void delete(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        T entity = (T) session.load(entityClass, id);
        if(null != entity){session.delete(entity);}
    }

}