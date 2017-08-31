/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Adrian
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Medicalconsultation.findAll", query = "SELECT m FROM Medicalconsultation m")
    , @NamedQuery(name = "Medicalconsultation.findById", query = "SELECT m FROM Medicalconsultation m WHERE m.id = :id")
    , @NamedQuery(name = "Medicalconsultation.findByDate", query = "SELECT m FROM Medicalconsultation m WHERE m.date = :date")})
public class Medicalconsultation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.DATE)
    private Date date;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String symptoms;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String treatment;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String recomendations;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String examinations;
    @JoinColumn(name = "doctorID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Doctor doctorID;
    @JoinColumn(name = "patientID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Patient patientID;

    public Medicalconsultation() {
    }

    public Medicalconsultation(Integer id) {
        this.id = id;
    }

    public Medicalconsultation(Integer id, Date date, String symptoms, String treatment, String recomendations, String examinations) {
        this.id = id;
        this.date = date;
        this.symptoms = symptoms;
        this.treatment = treatment;
        this.recomendations = recomendations;
        this.examinations = examinations;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }

    public String getRecomendations() {
        return recomendations;
    }

    public void setRecomendations(String recomendations) {
        this.recomendations = recomendations;
    }

    public String getExaminations() {
        return examinations;
    }

    public void setExaminations(String examinations) {
        this.examinations = examinations;
    }

    public Doctor getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(Doctor doctorID) {
        this.doctorID = doctorID;
    }

    public Patient getPatientID() {
        return patientID;
    }

    public void setPatientID(Patient patientID) {
        this.patientID = patientID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Medicalconsultation)) {
            return false;
        }
        Medicalconsultation other = (Medicalconsultation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Medicalconsultation[ id=" + id + " ]";
    }
    
}
