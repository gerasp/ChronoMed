package net.gerardomedina.chronomed.entity;

import javax.persistence.*;
import java.util.Collection;


@Entity
public class Doctor {
    private int id;
    private String name;
    private String surname;
    private String idCard;
    private String gender;
    private String speciality;
    private String boardNumber;
    private String phoneNumber;
    private String alternativePhoneNumber;
    private int userAccountId;
    private User userByUserAccountId;
    private Collection<DoctorPatient> doctorPatientsById;
    private Collection<Medicalconsultation> medicalconsultationsById;

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
    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "speciality")
    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    @Basic
    @Column(name = "boardNumber")
    public String getBoardNumber() {
        return boardNumber;
    }

    public void setBoardNumber(String boardNumber) {
        this.boardNumber = boardNumber;
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

        Doctor doctor = (Doctor) o;

        if (id != doctor.id) return false;
        if (userAccountId != doctor.userAccountId) return false;
        if (name != null ? !name.equals(doctor.name) : doctor.name != null) return false;
        if (surname != null ? !surname.equals(doctor.surname) : doctor.surname != null) return false;
        if (idCard != null ? !idCard.equals(doctor.idCard) : doctor.idCard != null) return false;
        if (gender != null ? !gender.equals(doctor.gender) : doctor.gender != null) return false;
        if (speciality != null ? !speciality.equals(doctor.speciality) : doctor.speciality != null) return false;
        if (boardNumber != null ? !boardNumber.equals(doctor.boardNumber) : doctor.boardNumber != null) return false;
        if (phoneNumber != null ? !phoneNumber.equals(doctor.phoneNumber) : doctor.phoneNumber != null) return false;
        if (alternativePhoneNumber != null ? !alternativePhoneNumber.equals(doctor.alternativePhoneNumber) : doctor.alternativePhoneNumber != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (idCard != null ? idCard.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (speciality != null ? speciality.hashCode() : 0);
        result = 31 * result + (boardNumber != null ? boardNumber.hashCode() : 0);
        result = 31 * result + (phoneNumber != null ? phoneNumber.hashCode() : 0);
        result = 31 * result + (alternativePhoneNumber != null ? alternativePhoneNumber.hashCode() : 0);
        result = 31 * result + userAccountId;
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID", nullable = false, insertable = false, updatable = false)
    public User getUserByUserAccountId() {
        return userByUserAccountId;
    }

    public void setUserByUserAccountId(User userByUserAccountId) {
        this.userByUserAccountId = userByUserAccountId;
    }

    @OneToMany(mappedBy = "doctorByDoctorId")
    public Collection<DoctorPatient> getDoctorPatientsById() {
        return doctorPatientsById;
    }

    public void setDoctorPatientsById(Collection<DoctorPatient> doctorPatientsById) {
        this.doctorPatientsById = doctorPatientsById;
    }

    @OneToMany(mappedBy = "doctorByDoctorId")
    public Collection<Medicalconsultation> getMedicalconsultationsById() {
        return medicalconsultationsById;
    }

    public void setMedicalconsultationsById(Collection<Medicalconsultation> medicalconsultationsById) {
        this.medicalconsultationsById = medicalconsultationsById;
    }
}
