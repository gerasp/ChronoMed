/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.entities;

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
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Adrian
 */
@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Patient.findAll", query = "SELECT p FROM Patient p")
    , @NamedQuery(name = "Patient.findById", query = "SELECT p FROM Patient p WHERE p.id = :id")
    , @NamedQuery(name = "Patient.findByName", query = "SELECT p FROM Patient p WHERE p.name = :name")
    , @NamedQuery(name = "Patient.findBySurname", query = "SELECT p FROM Patient p WHERE p.surname = :surname")
    , @NamedQuery(name = "Patient.findByNif", query = "SELECT p FROM Patient p WHERE p.nif = :nif")
    , @NamedQuery(name = "Patient.findByBirthDate", query = "SELECT p FROM Patient p WHERE p.birthDate = :birthDate")
    , @NamedQuery(name = "Patient.findByGender", query = "SELECT p FROM Patient p WHERE p.gender = :gender")
    , @NamedQuery(name = "Patient.findByNationality", query = "SELECT p FROM Patient p WHERE p.nationality = :nationality")
    , @NamedQuery(name = "Patient.findByAddress", query = "SELECT p FROM Patient p WHERE p.address = :address")
    , @NamedQuery(name = "Patient.findByLocality", query = "SELECT p FROM Patient p WHERE p.locality = :locality")
    , @NamedQuery(name = "Patient.findByZipCode", query = "SELECT p FROM Patient p WHERE p.zipCode = :zipCode")
    , @NamedQuery(name = "Patient.findByProvince", query = "SELECT p FROM Patient p WHERE p.province = :province")
    , @NamedQuery(name = "Patient.findByCountry", query = "SELECT p FROM Patient p WHERE p.country = :country")
    , @NamedQuery(name = "Patient.findByPhoneNumber", query = "SELECT p FROM Patient p WHERE p.phoneNumber = :phoneNumber")
    , @NamedQuery(name = "Patient.findByAlternativePhoneNumber", query = "SELECT p FROM Patient p WHERE p.alternativePhoneNumber = :alternativePhoneNumber")})
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
    @Size(min = 1, max = 255)
    private String zipCode;
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
    @Size(min = 1, max = 255)
    private String phoneNumber;
    @Size(max = 255)
    private String alternativePhoneNumber;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Collection<Healthcard> healthcardCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Collection<DoctorPatient> doctorPatientCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Collection<Medicalconsultation> medicalconsultationCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "patientID", fetch = FetchType.EAGER)
    private Medicalhistory medicalhistory;
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Useraccount userAccountID;

    public Patient() {
    }

    public Patient(Integer id) {
        this.id = id;
    }

    public Patient(Integer id, String name, String surname, String nif, Date birthDate, String gender, String nationality, String address, String locality, String zipCode, String province, String country, String phoneNumber) {
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

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAlternativePhoneNumber() {
        return alternativePhoneNumber;
    }

    public void setAlternativePhoneNumber(String alternativePhoneNumber) {
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

    @XmlTransient
    public Collection<Medicalconsultation> getMedicalconsultationCollection() {
        return medicalconsultationCollection;
    }

    public void setMedicalconsultationCollection(Collection<Medicalconsultation> medicalconsultationCollection) {
        this.medicalconsultationCollection = medicalconsultationCollection;
    }

    public Medicalhistory getMedicalhistory() {
        return medicalhistory;
    }

    public void setMedicalhistory(Medicalhistory medicalhistory) {
        this.medicalhistory = medicalhistory;
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
