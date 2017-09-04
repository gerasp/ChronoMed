package net.gerardomedina.chronomed.repository;

import org.hibernate.SessionFactory;

import javax.transaction.Transactional;
import java.util.List;

public interface AbstractRepository<T> {

    @Transactional
    void setSessionFactory(SessionFactory sf);

    @Transactional
    void create(T entity);

    @Transactional
    void update(T entity);

    @Transactional
    List<T> list();

    @Transactional
    T find(int id);

    @Transactional
    void delete(int id);

}