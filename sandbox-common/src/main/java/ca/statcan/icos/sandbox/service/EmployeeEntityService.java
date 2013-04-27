package ca.statcan.icos.sandbox.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import ca.statcan.icos.sandbox.Employee;

public class EmployeeEntityService {

    private EntityManager entityManager;

    public void persistEmployee(final Employee employee) {
        entityManager.persist(employee);
    }

    @SuppressWarnings("unchecked")
    public List<Employee> getAllEmployee() {
        return entityManager.createNamedQuery("Employee.findAllEmployee").getResultList();
    }

    @PersistenceContext
    public void setEntityManager(final EntityManager entityManager) {
        this.entityManager = entityManager;
    }

}
