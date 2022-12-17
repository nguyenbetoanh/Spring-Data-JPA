package ra.model.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "company")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int companyId;

    private String companyName;

    private String companyAddress;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date companyDateFounded;
    private boolean companyStatus;
    @OneToMany(mappedBy = "company")
    private List<Employee> listEmployee = new ArrayList<>();

    public Company() {
    }

    public Company(int companyId, String companyName, String companyAddress, Date companyDateFounded, boolean companyStatus, List<Employee> listEmployee) {
        this.companyId = companyId;
        this.companyName = companyName;
        this.companyAddress = companyAddress;
        this.companyDateFounded = companyDateFounded;
        this.companyStatus = companyStatus;
        this.listEmployee = listEmployee;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public Date getCompanyDateFounded() {
        return companyDateFounded;
    }

    public void setCompanyDateFounded(Date companyDateFounded) {
        this.companyDateFounded = companyDateFounded;
    }

    public boolean isCompanyStatus() {
        return companyStatus;
    }

    public void setCompanyStatus(boolean companyStatus) {
        this.companyStatus = companyStatus;
    }

    public List<Employee> getListEmployee() {
        return listEmployee;
    }

    public void setListEmployee(List<Employee> listEmployee) {
        this.listEmployee = listEmployee;
    }
}