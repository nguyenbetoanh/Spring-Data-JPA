package ra.model.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.entity.Company;
import ra.model.repository.CompanyRepository;
import ra.model.service.CompanyService;

import java.util.List;

@Service
public class CompanyServiceImp implements CompanyService {
    @Autowired
    private CompanyRepository companyRepository;
    @Override
    public List<Company> findAllCompany() {
        return companyRepository.findAll();
    }

    @Override
    public Company findByIdCompany(int id) {
        return companyRepository.findById(id).get();
    }

    @Override
    public void saveCompany(Company company) {
        companyRepository.save(company);

    }

    @Override
    public void updateCompany(Company company) {
        companyRepository.save(company);

    }

    @Override
    public void deleteCompany(int id) {
        companyRepository.deleteById(id);
    }

    @Override
    public void deleteStatus(Company company) {
        companyRepository.save(company);
    }

    @Override
    public List<Company> searchCompany(String name) {
        return companyRepository.findByCompanyNameContaining(name);
    }
}
