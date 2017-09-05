package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Admin;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class AdminRepositoryImpl extends AbstractRepositoryImpl implements AdminRepository {

    public AdminRepositoryImpl(Class entityClass, SessionFactory sessionFactory) {
        super(entityClass, sessionFactory);
    }

    @Transactional
    public Admin getAdminByEmail(Admin admin) {
        List result = this.sessionFactory.getCurrentSession()
                .createQuery("from Admin where email = :email and password = :password")
                .setParameter("email",admin.getEmail())
                .setParameter("password",admin.getPassword())
                .list();
        return result.size() > 0 ? (Admin)result.get(0) : null;
    }

}