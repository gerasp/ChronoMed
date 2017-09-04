package net.gerardomedina.chronomed.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by gerardo on 04.09.17.
 */
@Entity
public class Patient {
    private int id;
    private String name;
    private String surname;
    private String idCard;
    private Date birthDate;
    private String gender;
    private String nationality;
    private String address;
    private String locality;
    private String zipCode;
    private String province;
    private String country;
    private String phoneNumber;
    private String alternativePhoneNumber;
    private int userAccountId;
    private Collection<DoctorPatient> doctorPatientsById;
    private Collection<Healthcard> healthcardsById;
    private Collection<Medicalconsultation> medicalconsultationsById;
    private Collection<Medicalhistory> medicalhistoriesById;
    private User userByUserAccountId;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "surname")
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Basic
    @Column(name = "idCard")
    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    @Basic
    @Column(name = "birthDate")
    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    @Basic
    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "nationality")
    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "locality")
    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    @Basic
    @Column(name = "zipCode")
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    @Basic
    @Column(name = "province")
    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    @Basic
    @Column(name = "country")
    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Basic
    @Column(name = "phoneNumber")
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Basic
    @Column(name = "alternativePhoneNumber")
    public String getAlternativePhoneNumber() {
        return alternativePhoneNumber;
    }

    public void setAlternativePhoneNumber(String alternativePhoneNumber) {
        this.alternativePhoneNumber = alternativePhoneNumber;
    }

    @Basic
    @Column(name = "userAccountID")
    public int getUserAccountId() {
        return userAccountId;
    }

    public void setUserAccountId(int userAccountId) {
        this.userAccountId = userAccountId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Patient patient = (Patient) o;

        if (id != patient.id) return false;
        if (userAccountId != patient.userAccountId) return false;
        if (name != null ? !name.equals(patient.name) : patient.name != null) return false;
        if (surname != null ? !surname.equals(patient.surname) : patient.surname != null) return false;
        if (idCard != null ? !idCard.equals(patient.idCard) : patient.idCard != null) return false;
        if (birthDate != null ? !birthDate.equals(patient.birthDate) : patient.birthDate != null) return false;
        if (gender != null ? !gender.equals(patient.gender) : patient.gender != null) return false;
        if (nationality != null ? !nationality.equals(patient.nationality) : patient.nationality != null) return false;
        if (address != null ? !address.equals(patient.address) : patient.address != null) return false;
        if (locality != null ? !locality.equals(patient.locality) : patient.locality != null) return false;
        if (zipCode != null ? !zipCode.equals(patient.zipCode) : patient.zipCode != null) return false;
        if (province != null ? !province.equals(patient.province) : patient.province != null) return false;
        if (country != null ? !country.equals(patient.country) : patient.country != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(patient.phoneNumber) : patient.phoneNumber != null) return false;
        if (alternativePhoneNumber != null ? !alternativePhoneNumber.equals(patient.alternativePhoneNumber) : patient.alternativePhoneNumber != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (idCard != null ? idCard.hashCode() : 0);
        result = 31 * result + (birthDate != null ? birthDate.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (nationality != null ? nationality.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (locality != null ? locality.hashCode() : 0);
        result = 31 * result + (zipCode != null ? zipCode.hashCode() : 0);
        result = 31 * result + (province != null ? province.hashCode() : 0);
        result = 31 * result + (country != null ? country.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (alternativePhoneNumber != null ? alternativePhoneNumber.hashCode() : 0);
        result = 31 * result + userAccountId;
        return result;
    }

    @OneToMany(mappedBy = "patientByPatientId")
    public Collection<DoctorPatient> getDoctorPatientsById() {
        return doctorPatientsById;
    }

    public void setDoctorPatientsById(Collection<DoctorPatient> doctorPatientsById) {
        this.doctorPatientsById = doctorPatientsById;
    }

    @OneToMany(mappedBy = "patientByPatientId")
    public Collection<Healthcard> getHealthcardsById() {
        return healthcardsById;
    }

    public void setHealthcardsById(Collection<Healthcard> healthcardsById) {
        this.healthcardsById = healthcardsById;
    }

    @OneToMany(mappedBy = "patientByPatientId")
    public Collection<Medicalconsultation> getMedicalconsultationsById() {
        return medicalconsultationsById;
    }

    public void setMedicalconsultationsById(Collection<Medicalconsultation> medicalconsultationsById) {
        this.medicalconsultationsById = medicalconsultationsById;
    }

    @OneToMany(mappedBy = "patientByPatientId")
    public Collection<Medicalhistory> getMedicalhistoriesById() {
        return medicalhistoriesById;
    }

    public void setMedicalhistoriesById(Collection<Medicalhistory> medicalhistoriesById) {
        this.medicalhistoriesById = medicalhistoriesById;
    }

    @ManyToOne
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    public User getUserByUserAccountId() {
        return userByUserAccountId;
    }

    public void setUserByUserAccountId(User userByUserAccountId) {
        this.userByUserAccountId = userByUserAccountId;
    }
}
