package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ra.model.entity.Company;
import ra.model.entity.Employee;
import ra.model.serviceImp.CompanyServiceImp;
import ra.model.serviceImp.EmployeeServiceImp;

import java.util.List;

@Controller
@RequestMapping("employee")
public class EmployController {
    @Autowired
    private EmployeeServiceImp employeeServiceImp;
    @Autowired
    private CompanyServiceImp companyServiceImp;

    @RequestMapping(value = {"/","getAll",""})
    public String getAllEmployee(Model model) {
        List<Employee> listEmployee = employeeServiceImp.findAllEmployee();
        model.addAttribute("listEmployee", listEmployee);
        List<Company> listCompany = companyServiceImp.findAllCompany();
        model.addAttribute("listCompany",listCompany);
        return "employees";
    }

    @RequestMapping("create")
    public String saveEmployee(Employee employee,Company company) {
        employee.setCompany(company);
        employeeServiceImp.saveEmployee(employee);
        return "redirect:/employee";
    }

    @RequestMapping("update")
    public String updateEmployee(Model model, int employeeId) {
        Employee employee = employeeServiceImp.findByIdEmployee(employeeId);
        List<Company> listCompany = companyServiceImp.findAllCompany();
        model.addAttribute("listCompany",listCompany);
        model.addAttribute("employee", employee);
        return "updateEmployees";
    }

    @PostMapping("update")
    public String update(Employee employee,Company company) {
        employee.setCompany(company);
        employeeServiceImp.findByIdEmployee(employee.getEmployeeId());
        employeeServiceImp.updateEmployee(employee);
        String oldImg= employee.getEmployeeAvatar();
        if (employee.getEmployeeAvatar().isEmpty()){
            employee.setEmployeeAvatar(oldImg);
        }
        employeeServiceImp.updateEmployee(employee);
        return "redirect:/employee";
    }
    @RequestMapping("delete")
    public String deleteCompany(int employeeId){
        Employee employee = employeeServiceImp.findByIdEmployee(employeeId);
        employee.setEmployeeStatus(false);
        employeeServiceImp.saveEmployee(employee);
        return "redirect:/employee";
    }
    @PostMapping("search")
    public String searchCompany(Model model,String search){
        List<Employee> listEmployee=employeeServiceImp.searchEmployee(search);
        model.addAttribute("listEmployee",listEmployee);
        return "employees";
    }
}
