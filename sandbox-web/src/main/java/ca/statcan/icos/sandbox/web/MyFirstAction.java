package ca.statcan.icos.sandbox.web;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import ca.statcan.happyf.model.annotation.Breadcrumb;
import ca.statcan.happyf.struts2.HappyfActionSupport;
import ca.statcan.icos.sandbox.Employee;
import ca.statcan.icos.sandbox.service.EmployeeEntityService;

@Results({ @Result(name = "success", location = "myFirst.page", type = "tiles") })
@ParentPackage("default")
@Breadcrumb(labelKey = "ca.statcan.icos.sandbox.firstAction")
@SuppressWarnings("serial")
public class MyFirstAction extends HappyfActionSupport {

	private List<Employee> employees;

	private EmployeeEntityService employeeEntityService;

	@Override
	public String execute() {
		employees = employeeEntityService.getAllEmployee();
		if (employees.size() > 0) {

			// persist data in memory
			final Employee employee1 = new Employee(1, "First", "John", null,
					"613-222-2222");
			employeeEntityService.persistEmployee(employee1);

			final Employee employee2 = new Employee(2, "Second", "John", null,
					"613-222-2223");
			employeeEntityService.persistEmployee(employee2);

			employees = employeeEntityService.getAllEmployee();
		}
		return SUCCESS;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	@Autowired
	public void setEmployeeEntityService(
			EmployeeEntityService employeeEntityService) {
		this.employeeEntityService = employeeEntityService;
	}

}
