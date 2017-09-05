package net.gerardomedina.chronomed.entity;

import javax.persistence.*;


@Entity
public class Admin {
    private int id;
    private String name;
    private String surname;
    private String idCard;
    private int userAccountId;
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

        Admin admin = (Admin) o;

        if (id != admin.id) return false;
        if (userAccountId != admin.userAccountId) return false;
        if (name != null ? !name.equals(admin.name) : admin.name != null) return false;
        if (surname != null ? !surname.equals(admin.surname) : admin.surname != null) return false;
        if (idCard != null ? !idCard.equals(admin.idCard) : admin.idCard != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (idCard != null ? idCard.hashCode() : 0);
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
}
