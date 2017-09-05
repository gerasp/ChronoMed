package net.gerardomedina.chronomed.entity;

import javax.persistence.*;


@Entity
public class Medicalhistory {
    private int id;
    private String bloodType;
    private String familyHistory;
    private String allergies;
    private String pathologies;
    private String surgeries;
    private String others;
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
    @Column(name = "bloodType")
    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    @Basic
    @Column(name = "familyHistory")
    public String getFamilyHistory() {
        return familyHistory;
    }

    public void setFamilyHistory(String familyHistory) {
        this.familyHistory = familyHistory;
    }

    @Basic
    @Column(name = "allergies")
    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    @Basic
    @Column(name = "pathologies")
    public String getPathologies() {
        return pathologies;
    }

    public void setPathologies(String pathologies) {
        this.pathologies = pathologies;
    }

    @Basic
    @Column(name = "surgeries")
    public String getSurgeries() {
        return surgeries;
    }

    public void setSurgeries(String surgeries) {
        this.surgeries = surgeries;
    }

    @Basic
    @Column(name = "others")
    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
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

        Medicalhistory that = (Medicalhistory) o;

        if (id != that.id) return false;
        if (patientId != that.patientId) return false;
        if (bloodType != null ? !bloodType.equals(that.bloodType) : that.bloodType != null) return false;
        if (familyHistory != null ? !familyHistory.equals(that.familyHistory) : that.familyHistory != null)
            return false;
        if (allergies != null ? !allergies.equals(that.allergies) : that.allergies != null) return false;
        if (pathologies != null ? !pathologies.equals(that.pathologies) : that.pathologies != null) return false;
        if (surgeries != null ? !surgeries.equals(that.surgeries) : that.surgeries != null) return false;
        if (others != null ? !others.equals(that.others) : that.others != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (bloodType != null ? bloodType.hashCode() : 0);
        result = 31 * result + (familyHistory != null ? familyHistory.hashCode() : 0);
        result = 31 * result + (allergies != null ? allergies.hashCode() : 0);
        result = 31 * result + (pathologies != null ? pathologies.hashCode() : 0);
        result = 31 * result + (surgeries != null ? surgeries.hashCode() : 0);
        result = 31 * result + (others != null ? others.hashCode() : 0);
        result = 31 * result + patientId;
        return result;
    }

    @OneToOne
    @JoinColumn(name = "patientID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    public Patient getPatientByPatientId() {
        return patientByPatientId;
    }

    public void setPatientByPatientId(Patient patientByPatientId) {
        this.patientByPatientId = patientByPatientId;
    }
}
