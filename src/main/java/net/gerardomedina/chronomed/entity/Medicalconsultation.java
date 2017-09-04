package net.gerardomedina.chronomed.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by gerardo on 04.09.17.
 */
@Entity
public class Medicalconsultation {
    private int id;
    private Date date;
    private String symptoms;
    private String treatment;
    private String recomendations;
    private String examinations;
    private int doctorId;
    private int patientId;
    private Doctor doctorByDoctorId;
    private Patient patientByPatientId;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "symptoms")
    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    @Basic
    @Column(name = "treatment")
    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    @Basic
    @Column(name = "recomendations")
    public String getRecomendations() {
        return recomendations;
    }

    public void setRecomendations(String recomendations) {
        this.recomendations = recomendations;
    }

    @Basic
    @Column(name = "examinations")
    public String getExaminations() {
        return examinations;
    }

    public void setExaminations(String examinations) {
        this.examinations = examinations;
    }

    @Basic
    @Column(name = "doctorID")
    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    @Basic
    @Column(name = "patientID")
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Medicalconsultation that = (Medicalconsultation) o;

        if (id != that.id) return false;
        if (doctorId != that.doctorId) return false;
        if (patientId != that.patientId) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (symptoms != null ? !symptoms.equals(that.symptoms) : that.symptoms != null) return false;
        if (treatment != null ? !treatment.equals(that.treatment) : that.treatment != null) return false;
        if (recomendations != null ? !recomendations.equals(that.recomendations) : that.recomendations != null)
            return false;
        if (examinations != null ? !examinations.equals(that.examinations) : that.examinations != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (symptoms != null ? symptoms.hashCode() : 0);
        result = 31 * result + (treatment != null ? treatment.hashCode() : 0);
        result = 31 * result + (recomendations != null ? recomendations.hashCode() : 0);
        result = 31 * result + (examinations != null ? examinations.hashCode() : 0);
        result = 31 * result + doctorId;
        result = 31 * result + patientId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "doctorID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    public Doctor getDoctorByDoctorId() {
        return doctorByDoctorId;
    }

    public void setDoctorByDoctorId(Doctor doctorByDoctorId) {
        this.doctorByDoctorId = doctorByDoctorId;
    }

    @ManyToOne
    @JoinColumn(name = "patientID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }
}
