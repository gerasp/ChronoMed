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
    @NamedQuery(name = "Administrative.findAll", query = "SELECT a FROM Administrative a")
    , @NamedQuery(name = "Administrative.findById", query = "SELECT a FROM Administrative a WHERE a.id = :id")
    , @NamedQuery(name = "Administrative.findByName", query = "SELECT a FROM Administrative a WHERE a.name = :name")
    , @NamedQuery(name = "Administrative.findBySurname", query = "SELECT a FROM Administrative a WHERE a.surname = :surname")
    , @NamedQuery(name = "Administrative.findByNif", query = "SELECT a FROM Administrative a WHERE a.nif = :nif")})
public class Administrative implements Serializable {

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
    @JoinColumn(name = "userAccountID", referencedColumnName = "ID")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Useraccount userAccountID;

    public Administrative() {
    }

    public Administrative(Integer id) {
        this.id = id;
    }

    public Administrative(Integer id, String name, String surname, String nif) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.nif = nif;
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
        if (!(object instanceof Administrative)) {
            return false;
        }
        Administrative other = (Administrative) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Administrative[ id=" + id + " ]";
    }
    
}
