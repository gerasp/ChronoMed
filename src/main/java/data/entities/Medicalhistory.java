/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
    @NamedQuery(name = "Medicalhistory.findAll", query = "SELECT m FROM Medicalhistory m")
    , @NamedQuery(name = "Medicalhistory.findById", query = "SELECT m FROM Medicalhistory m WHERE m.id = :id")
    , @NamedQuery(name = "Medicalhistory.findByBloodType", query = "SELECT m FROM Medicalhistory m WHERE m.bloodType = :bloodType")})
public class Medicalhistory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String bloodType;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String familyHistory;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String allergies;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String pathologies;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String surgeries;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    private String others;
    @JoinColumn(name = "patientID", referencedColumnName = "ID")
    @OneToOne(optional = false, fetch = FetchType.EAGER)
    private Patient patientID;

    public Medicalhistory() {
    }

    public Medicalhistory(Integer id) {
        this.id = id;
    }

    public Medicalhistory(Integer id, String bloodType, String familyHistory, String allergies, String pathologies, String surgeries, String others) {
        this.id = id;
        this.bloodType = bloodType;
        this.familyHistory = familyHistory;
        this.allergies = allergies;
        this.pathologies = pathologies;
        this.surgeries = surgeries;
        this.others = others;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getFamilyHistory() {
        return familyHistory;
    }

    public void setFamilyHistory(String familyHistory) {
        this.familyHistory = familyHistory;
    }

    public String getAllergies() {
        return allergies;
    }

    public void setAllergies(String allergies) {
        this.allergies = allergies;
    }

    public String getPathologies() {
        return pathologies;
    }

    public void setPathologies(String pathologies) {
        this.pathologies = pathologies;
    }

    public String getSurgeries() {
        return surgeries;
    }

    public void setSurgeries(String surgeries) {
        this.surgeries = surgeries;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
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
        if (!(object instanceof Medicalhistory)) {
            return false;
        }
        Medicalhistory other = (Medicalhistory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Medicalhistory[ id=" + id + " ]";
    }
    
}
