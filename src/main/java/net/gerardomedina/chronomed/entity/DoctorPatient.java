package net.gerardomedina.chronomed.entity;

import javax.persistence.*;


@Entity
@Table(name = "doctor_patient", schema = "heroku_5d5cf2395135b4a", catalog = "")
public class DoctorPatient {
    private int id;
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

        DoctorPatient that = (DoctorPatient) o;

        if (id != that.id) return false;
        if (doctorId != that.doctorId) return false;
        if (patientId != that.patientId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
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
