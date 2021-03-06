package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.entity.User;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface DoctorRepository extends AbstractRepository  {
    @Transactional
    Doctor getDoctorByEmail(User user);
    @Transactional
    Doctor getDoctorByBoardNumber(Search search);
    @Transactional
    List getPatients(Doctor doctor);
}