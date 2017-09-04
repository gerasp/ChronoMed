package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Doctor;
import net.gerardomedina.chronomed.entity.Search;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
public interface DoctorRepository extends AbstractRepository  {
    @Transactional
    Doctor getDoctorByBoardNumber(Search search);
}