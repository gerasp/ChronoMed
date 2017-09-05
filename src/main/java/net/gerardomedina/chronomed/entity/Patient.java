package net.gerardomedina.chronomed.entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;

/**
 * Created by gerardo on 05.09.17.
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
    private String bloodType;
    private String familyHistory;
    private String allergies;
    private String pathologies;
    private String surgeries;
    private String others;
    private String password;
    private byte active;
    private String email;
    private Collection<Consultation> consultationsById;
    private Collection<DoctorPatient> doctorPatientsById;
    private Collection<Healthcard> healthcardsById;

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
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "active")
    public byte getActive() {
        return active;
    }

    public void setActive(byte active) {
        this.active = active;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Patient patient = (Patient) o;

        if (id != patient.id) return false;
        if (active != patient.active) return false;
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
        if (bloodType != null ? !bloodType.equals(patient.bloodType) : patient.bloodType != null) return false;
        if (familyHistory != null ? !familyHistory.equals(patient.familyHistory) : patient.familyHistory != null)
            return false;
        if (allergies != null ? !allergies.equals(patient.allergies) : patient.allergies != null) return false;
        if (pathologies != null ? !pathologies.equals(patient.pathologies) : patient.pathologies != null) return false;
        if (surgeries != null ? !surgeries.equals(patient.surgeries) : patient.surgeries != null) return false;
        if (others != null ? !others.equals(patient.others) : patient.others != null) return false;
        if (password != null ? !password.equals(patient.password) : patient.password != null) return false;
        if (email != null ? !email.equals(patient.email) : patient.email != null) return false;

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
        result = 31 * result + (bloodType != null ? bloodType.hashCode() : 0);
        result = 31 * result + (familyHistory != null ? familyHistory.hashCode() : 0);
        result = 31 * result + (allergies != null ? allergies.hashCode() : 0);
        result = 31 * result + (pathologies != null ? pathologies.hashCode() : 0);
        result = 31 * result + (surgeries != null ? surgeries.hashCode() : 0);
        result = 31 * result + (others != null ? others.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (int) active;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "patientByPatientId")
    public Collection<Consultation> getConsultationsById() {
        return consultationsById;
    }

    public void setConsultationsById(Collection<Consultation> consultationsById) {
        this.consultationsById = consultationsById;
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
}
