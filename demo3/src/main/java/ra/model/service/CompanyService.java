package ra.model.service;

import ra.model.entity.Company;

import java.util.List;

public interface CompanyService {
    List<Company> findAllCompany();
    Company findByIdCompany(int id);
    void saveCompany(Company company);
    void updateCompany(Company company);
    void deleteCompany(int id);
    void deleteStatus(Company company);
    List<Company> searchCompany(String name);

}
