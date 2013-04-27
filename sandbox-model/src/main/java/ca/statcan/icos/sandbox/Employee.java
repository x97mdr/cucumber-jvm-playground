package ca.statcan.icos.sandbox;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "EMPLOYEES")
@NamedQueries({ @NamedQuery(name = "Employee.findAllEmployee", query = "select e from Employee e") })
public class Employee {

    @Id
    private int id;

    @Column(name = "firstname")
    private String firstName;

    @Column(name = "lastame")
    private String lastName;

    @Column(name = "birth_date")
    private Date birthDate;

    @Column(name = "cell_phone")
    private String cellPhone;

    public Employee() {

    }

    public Employee(final int id, final String firstName, final String lastName, final Date birthDate,
            final String cellPhone) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthDate = birthDate;
        this.cellPhone = cellPhone;

    }

    public String getFirstName() {
        return firstName;
    }

    public int getId() {
        return id;
    }

    public void setId(final int id) {
        this.id = id;
    }

    public void setFirstName(final String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(final String lastName) {
        this.lastName = lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(final Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellphone(final String cellPhone) {
        this.cellPhone = cellPhone;
    }

}