package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ra.model.entity.Company;
import ra.model.serviceImp.CompanyServiceImp;
import java.util.List;

@Controller
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    private CompanyServiceImp companyService;
    @RequestMapping(value = {"/","getAll",""})
    public String getAllCompany(Model model){
        List<Company> listCompany = companyService.findAllCompany();
        model.addAttribute("listCompany",listCompany);
        return "companys";
    }
    @RequestMapping("create")
    public  String saveCompany(Company company){
        companyService.saveCompany(company);
        return "redirect:/company";
    }
    @RequestMapping("/update")
    public String updateCompanyDisplay(Model model,int companyId){
        Company company = companyService.findByIdCompany(companyId);
        model.addAttribute("company",company);
        return "updateCompany";
    }
    @PostMapping("update")
    public String updateCompany(Company company){
        companyService.updateCompany(company);
        return "redirect:/company";
    }
    @RequestMapping("delete")
    public String deleteCompany(int companyId){
        Company company = companyService.findByIdCompany(companyId);
        company.setCompanyStatus(false);
        companyService.saveCompany(company);
        return "redirect:/company";
    }
    @PostMapping("search")
    public String searchCompany(Model model,String search){
        List<Company> listCompany=companyService.searchCompany(search);
        model.addAttribute("listCompany",listCompany);
        return "companys";
    }
}