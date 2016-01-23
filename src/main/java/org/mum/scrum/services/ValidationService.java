/**
 * 
 */
package org.mum.scrum.services;

import java.util.List;
import java.util.Set;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.entities.Role;
import org.mum.scrum.repositories.EmployeeRepository;
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
public class ValidationService
{
	//private UserDao userDao;
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	/*
	@Autowired
	public UserService(UserDao userDao) {
		this.userDao = userDao;
	}
	*/
	public boolean checkDuplicateUsername(String username){
		return employeeRepository.findOne(username)!=null?true:false;
	}
}

