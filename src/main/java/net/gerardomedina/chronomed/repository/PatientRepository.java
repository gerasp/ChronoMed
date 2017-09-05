package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.Patient;
import net.gerardomedina.chronomed.entity.Search;
import net.gerardomedina.chronomed.entity.User;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface PatientRepository extends AbstractRepository  {
    @Transactional
    Patient getPatientByEmail(User user);
    @Transactional
    Patient getPatientByIdCard(Search search);
    @Transactional
    Patient getPatientByHealthCard(Search search);
    @Transactional
    List getConsultations(Patient patient);
    @Transactional
    List getDoctors(Patient patient);
}