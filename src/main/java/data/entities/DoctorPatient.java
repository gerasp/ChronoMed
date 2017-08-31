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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Adrian
 */
@Entity
@Table(name = "DOCTOR_PATIENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "DoctorPatient.findAll", query = "SELECT d FROM DoctorPatient d")
    , @NamedQuery(name = "DoctorPatient.findById", query = "SELECT d FROM DoctorPatient d WHERE d.id = :id")})
public class DoctorPatient implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @JoinColumn(name = "doctorID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Doctor doctorID;
    @JoinColumn(name = "patientID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Patient patientID;

    public DoctorPatient() {
    }

    public DoctorPatient(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
        if (!(object instanceof DoctorPatient)) {
            return false;
        }
        DoctorPatient other = (DoctorPatient) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.DoctorPatient[ id=" + id + " ]";
    }
    
}
