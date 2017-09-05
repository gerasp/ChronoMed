package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Admin;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface AdminRepository extends AbstractRepository  {
    @Transactional
    Admin getAdminByEmail(Admin Admin);
}