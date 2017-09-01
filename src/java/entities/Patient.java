/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    @NamedQuery(name = "Patient.findAll", query = "SELECT p FROM Patient p")})
public class Patient implements Serializable {

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
    @Temporal(TemporalType.DATE)
    private Date birthDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String gender;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String nationality;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String address;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String locality;
    @Basic(optional = false)
    @NotNull
    private int zipCode;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String province;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String country;
    @Basic(optional = false)
    @NotNull
    private int phoneNumber;
    private Integer alternativePhoneNumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Collection<Healthcard> healthcardCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Collection<DoctorPatient> doctorPatientCollection;
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Useraccount userAccountID;

    public Patient() {
    }

    public Patient(Integer id) {
        this.id = id;
    }

    public Patient(Integer id, String name, String surname, String nif, Date birthDate, String gender, String nationality, String address, String locality, int zipCode, String province, String country, int phoneNumber) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.nif = nif;
        this.birthDate = birthDate;
        this.gender = gender;
        this.nationality = nationality;
        this.address = address;
        this.locality = locality;
        this.zipCode = zipCode;
        this.province = province;
        this.country = country;
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

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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
    public Collection<Healthcard> getHealthcardCollection() {
        return healthcardCollection;
    }

    public void setHealthcardCollection(Collection<Healthcard> healthcardCollection) {
        this.healthcardCollection = healthcardCollection;
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
        if (!(object instanceof Patient)) {
            return false;
        }
        Patient other = (Patient) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Patient[ id=" + id + " ]";
    }
    
}
