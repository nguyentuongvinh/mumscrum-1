package org.mum.scrum.repositories;



import org.mum.scrum.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;



public interface EmployeeRepository extends JpaRepository<Employee,String> {

	Employee findEmployeeByEmail(String email);	
	
}
