package ra.model.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int employeeId;
    private String employeeName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date employeeBirdDay;
    private String employeeDescriptions;

    private String employeeAvatar;
    private boolean employeeStatus;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "companyId")
    private Company company;

    public Employee() {
    }

    public Employee(int employeeId, String employeeName, Date employeeBirdDay, String employeeDescriptions, String employeeAvatar, boolean employeeStatus, Company company) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeeBirdDay = employeeBirdDay;
        this.employeeDescriptions = employeeDescriptions;
        this.employeeAvatar = employeeAvatar;
        this.employeeStatus = employeeStatus;
        this.company = company;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Date getEmployeeBirdDay() {
        return employeeBirdDay;
    }

    public void setEmployeeBirdDay(Date employeeBirdDay) {
        this.employeeBirdDay = employeeBirdDay;
    }

    public String getEmployeeDescriptions() {
        return employeeDescriptions;
    }

    public void setEmployeeDescriptions(String employeeDescriptions) {
        this.employeeDescriptions = employeeDescriptions;
    }

    public String getEmployeeAvatar() {
        return employeeAvatar;
    }

    public void setEmployeeAvatar(String employeeAvatar) {
        this.employeeAvatar = employeeAvatar;
    }

    public boolean isEmployeeStatus() {
        return employeeStatus;
    }

    public void setEmployeeStatus(boolean employeeStatus) {
        this.employeeStatus = employeeStatus;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }
}