/**
 * 
 */
package org.mum.scrum.services;

import java.util.List;
import java.util.Set;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.entities.EmployeeRole;
import org.mum.scrum.entities.Role;


/**
 * @author Sam
 *
 */
public interface IHRSubSystem 
{
	
	public List<Employee> findAll();

	public Employee createEmployee(Employee user);

	public Employee findEmployeeByUserName(String id);


	public Employee updateEmployee(Employee user) ;

//	public void deleteUser(int id) {
//		userRepository.delete(id);
//	}

	public Employee findUserByEmail(String email);
	
	public Set<Role> findRoleByStatus(Byte status);
	
	public Role findRoleByID(int id);
	
	public Set<Role> findRoleNotExistInEmployee(String username);
	
	public Set<EmployeeRole> findEmployeeRoleByEmployee(String username);
	
	public void saveEmployeeRole(EmployeeRole employeeRole);
	
	public EmployeeRole findEmployeeRoleByID(int id);
}

