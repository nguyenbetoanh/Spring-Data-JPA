package ra.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ra.model.entity.Company;

import java.util.List;

@Repository

public interface CompanyRepository extends JpaRepository<Company,Integer> {
    List<Company> findByCompanyNameContaining(String name);

}
