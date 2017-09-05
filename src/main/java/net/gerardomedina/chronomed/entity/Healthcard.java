package net.gerardomedina.chronomed.entity;

import javax.persistence.*;

/**
 * Created by gerardo on 05.09.17.
 */
@Entity
public class Healthcard {
    private int id;
    private String number;
    private int patientId;
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
    @Column(name = "number")
    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
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

        Healthcard that = (Healthcard) o;

        if (id != that.id) return false;
        if (patientId != that.patientId) return false;
        if (number != null ? !number.equals(that.number) : that.number != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        result = 31 * result + patientId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "patientID", referencedColumnName = "ID", nullable = false)
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }
}
