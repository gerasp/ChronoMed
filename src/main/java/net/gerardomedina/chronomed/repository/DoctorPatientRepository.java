package net.gerardomedina.chronomed.repository;

import net.gerardomedina.chronomed.entity.DoctorPatient;
import net.gerardomedina.chronomed.entity.Patient;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface DoctorPatientRepository extends AbstractRepository  {
    @Transactional
    List<DoctorPatient> getDoctorPatients(Patient savedPatient);
}