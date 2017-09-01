/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author alour
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Doctor.findAll", query = "SELECT d FROM Doctor d")})
public class Doctor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String surname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String nif;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String gender;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String speciality;
    @Basic(optional = false)
    @NotNull
    private int boardNumber;
    @Basic(optional = false)
    @NotNull
    private int phoneNumber;
    private Integer alternativePhoneNumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "doctorID", fetch = FetchType.EAGER)
    private Collection<DoctorPatient> doctorPatientCollection;
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Useraccount userAccountID;

    public Doctor() {
    }

    public Doctor(Integer id) {
        this.id = id;
    }

    public Doctor(Integer id, String name, String surname, String nif, String gender, String speciality, int boardNumber, int phoneNumber) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.nif = nif;
        this.gender = gender;
        this.speciality = speciality;
        this.boardNumber = boardNumber;
        this.phoneNumber = phoneNumber;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getNif() {
        return nif;
    }

    public void setNif(String nif) {
        this.nif = nif;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public int getBoardNumber() {
        return boardNumber;
    }

    public void setBoardNumber(int boardNumber) {
        this.boardNumber = boardNumber;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getAlternativePhoneNumber() {
        return alternativePhoneNumber;
    }

    public void setAlternativePhoneNumber(Integer alternativePhoneNumber) {
        this.alternativePhoneNumber = alternativePhoneNumber;
    }

    @XmlTransient
    public Collection<DoctorPatient> getDoctorPatientCollection() {
        return doctorPatientCollection;
    }

    public void setDoctorPatientCollection(Collection<DoctorPatient> doctorPatientCollection) {
        this.doctorPatientCollection = doctorPatientCollection;
    }

    public Useraccount getUserAccountID() {
        return userAccountID;
    }

    public void setUserAccountID(Useraccount userAccountID) {
        this.userAccountID = userAccountID;
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
        if (!(object instanceof Doctor)) {
            return false;
        }
        Doctor other = (Doctor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Doctor[ id=" + id + " ]";
    }
    
}
