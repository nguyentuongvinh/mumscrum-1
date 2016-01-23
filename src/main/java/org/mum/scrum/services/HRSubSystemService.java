/**
 * 
 */
package org.mum.scrum.services;

import java.util.List;
import java.util.Set;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.entities.EmployeeRole;
import org.mum.scrum.entities.Role;
import org.mum.scrum.repositories.EmployeeRepository;
import org.mum.scrum.repositories.EmployeeRoleRepository;
import org.mum.scrum.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author Sam
 *
 */
@Service
@Transactional
public class HRSubSystemService implements IHRSubSystem
{
	//private UserDao userDao;
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private EmployeeRoleRepository employeeRoleRepository;
	/*
	@Autowired
	public UserService(UserDao userDao) {
		this.userDao = userDao;
	}
	*/
	@Override
	public List<Employee> findAll() {
		//return userDao.findAll();
		return employeeRepository.findAll();
	}

	@Override
	public Employee createEmployee(Employee user) {
		//return userDao.create(user);
		return employeeRepository.save(user);
	}


//	public User login(String email, String password) {
//		//return userDao.login(email,password);
//		//return userRepository.login(email,password);
//		return userRepository.findByEmailAndPassword(email,password);
//	}

	@Override
	public Employee updateEmployee(Employee user) {
		return employeeRepository.save(user);
	}

//	public void deleteUser(int id) {
//		userRepository.delete(id);
//	}

	@Override
	public Employee findUserByEmail(String email) {
		return employeeRepository.findEmployeeByEmail(email);
	}

	@Override
	public Employee findEmployeeByUserName(String id) {
		// TODO Auto-generated method stub
		return employeeRepository.findOne(id);
	}

	@Override
	public Set<Role> findRoleByStatus(Byte status) {
		// TODO Auto-generated method stub
		return roleRepository.findByStatus((byte) 1);
	}

	@Override
	public Role findRoleByID(int id) {
		return roleRepository.findOne(id);
	}

	@Override
	public Set<Role> findRoleNotExistInEmployee(String username) {
		return roleRepository.findNotExistInEmployee(username);
	}

	@Override
	public Set<EmployeeRole> findEmployeeRoleByEmployee(String username) {
		return employeeRoleRepository.findByEmployeeNotDelete(username);
	}

	@Override
	public void saveEmployeeRole(EmployeeRole employeeRole) {
		// TODO Auto-generated method stub
		employeeRoleRepository.save(employeeRole);
	}

	@Override
	public EmployeeRole findEmployeeRoleByID(int id) {
		return employeeRoleRepository.findOne(id);
	}
	
	
}

