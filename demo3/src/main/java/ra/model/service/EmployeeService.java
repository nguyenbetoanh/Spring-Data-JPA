package ra.model.service;
import ra.model.entity.Company;
import ra.model.entity.Employee;

import java.util.List;

public interface EmployeeService {
    List<Employee> findAllEmployee();
    Employee findByIdEmployee(int id);
    void saveEmployee(Employee employee);
    void updateEmployee(Employee employee);
    List<Employee> searchEmployee(String name);
}
