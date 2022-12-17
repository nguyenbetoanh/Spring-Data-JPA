package ra.model.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.entity.Employee;
import ra.model.repository.EmployeeRepository;
import ra.model.service.EmployeeService;

import java.util.List;
@Service
public class EmployeeServiceImp implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;
    @Override
    public List<Employee> findAllEmployee() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee findByIdEmployee(int id) {
        return employeeRepository.findById(id).get();
    }

    @Override
    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);

    }
    @Override
    public void updateEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    @Override
    public List<Employee> searchEmployee(String name) {
        return employeeRepository.findByEmployeeNameContaining(name);
    }
}
