/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.entities;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
    @NamedQuery(name = "Useraccount.findAll", query = "SELECT u FROM Useraccount u")
    , @NamedQuery(name = "Useraccount.findById", query = "SELECT u FROM Useraccount u WHERE u.id = :id")
    , @NamedQuery(name = "Useraccount.findByEmail", query = "SELECT u FROM Useraccount u WHERE u.email = :email")
    , @NamedQuery(name = "Useraccount.findByPassword", query = "SELECT u FROM Useraccount u WHERE u.password = :password")
    , @NamedQuery(name = "Useraccount.findByActive", query = "SELECT u FROM Useraccount u WHERE u.active = :active")})
public class Useraccount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String password;
    @Basic(optional = false)
    @NotNull
    private boolean active;
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userAccountID")
    private Collection<Administrative> administrativeCollection;
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userAccountID")
    private Collection<Patient> patientCollection;
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userAccountID")
    private Collection<Doctor> doctorCollection;

    public Useraccount() {
    }

    public Useraccount(Integer id) {
        this.id = id;
    }

    public Useraccount(Integer id, String email, String password, boolean active) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.active = active;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @XmlTransient
    public Collection<Administrative> getAdministrativeCollection() {
        return administrativeCollection;
    }

    public void setAdministrativeCollection(Collection<Administrative> administrativeCollection) {
        this.administrativeCollection = administrativeCollection;
    }

    @XmlTransient
    public Collection<Patient> getPatientCollection() {
        return patientCollection;
    }

    public void setPatientCollection(Collection<Patient> patientCollection) {
        this.patientCollection = patientCollection;
    }

    @XmlTransient
    public Collection<Doctor> getDoctorCollection() {
        return doctorCollection;
    }

    public void setDoctorCollection(Collection<Doctor> doctorCollection) {
        this.doctorCollection = doctorCollection;
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
        if (!(object instanceof Useraccount)) {
            return false;
        }
        Useraccount other = (Useraccount) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Useraccount[ id=" + id + " ]";
    }
    
}
