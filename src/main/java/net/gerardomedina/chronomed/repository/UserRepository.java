package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.User;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface UserRepository extends AbstractRepository  {
    @Transactional
    User getUserByEmail(User user);
}