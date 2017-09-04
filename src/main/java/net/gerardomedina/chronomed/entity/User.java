package net.gerardomedina.chronomed.entity;

import javax.persistence.*;
import java.util.Collection;

/**
 * Created by gerardo on 04.09.17.
 */
@Entity
public class User {
    private int id;
    private String email;
    private String password;
    private boolean active;
    private String type;
    private Collection<Admin> adminsById;
    private Collection<Doctor> doctorsById;
    private Collection<Patient> patientsById;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (active != user.active) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (type != null ? !type.equals(user.type) : user.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (!active ? String.valueOf(active).hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "userByUserAccountId")
    public Collection<Admin> getAdminsById() {
        return adminsById;
    }

    public void setAdminsById(Collection<Admin> adminsById) {
        this.adminsById = adminsById;
    }

    @OneToMany(mappedBy = "userByUserAccountId")
    public Collection<Doctor> getDoctorsById() {
        return doctorsById;
    }

    public void setDoctorsById(Collection<Doctor> doctorsById) {
        this.doctorsById = doctorsById;
    }

    @OneToMany(mappedBy = "userByUserAccountId")
    public Collection<Patient> getPatientsById() {
        return patientsById;
    }

    public void setPatientsById(Collection<Patient> patientsById) {
        this.patientsById = patientsById;
    }
}
