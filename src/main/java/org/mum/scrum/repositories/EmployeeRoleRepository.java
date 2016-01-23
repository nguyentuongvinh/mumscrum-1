package org.mum.scrum.repositories;

import java.util.Set;

import javax.management.relation.Role;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.entities.EmployeeRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface EmployeeRoleRepository extends JpaRepository<EmployeeRole,Integer> {	
	public Set<EmployeeRole> findByEmployee(Employee user);
	public Set<EmployeeRole> findByRole(Role role);
	
	@Query("SELECT er FROM EmployeeRole er WHERE er.employee.username=:username "
			+ "And er.deleteDate is null")
	public Set<EmployeeRole> findByEmployeeNotDelete(@Param("username") String username);
}
