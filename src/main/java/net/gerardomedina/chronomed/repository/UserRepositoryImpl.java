package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class UserRepositoryImpl extends AbstractRepositoryImpl implements UserRepository {

    public UserRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }

    @Transactional
    public User getUserByEmail(User user) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from User where email = :email and password = :password")
                .setParameter("email",user.getEmail())
                .setParameter("password",user.getPassword())
                .list();
        return result.size() > 0 ? (User)result.get(0) : null;
    }

}