/**
 * 
 */
package org.mum.scrum;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mum.scrum.config.AppConfig;
import org.mum.scrum.entities.Employee;
import org.mum.scrum.services.IHRSubSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author Sam
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=AppConfig.class)
public class UserServiceTest 
{
	@Autowired
	private IHRSubSystem userService;
	
	@Test
	public void findAllUsers()  {
		List<Employee> users = userService.findAll();
		assertNotNull(users);
		assertTrue(!users.isEmpty());
	}
	
	@Test
	public void findUserById()  {
		Employee user = userService.findEmployeeByUserName("sam");
		assertNotNull(user);
	}
	
	@Test
	public void createUser() {
		Employee user = new Employee( "Sam", "123", true,true,true);
		Employee savedUser = userService.createEmployee(user);
		Employee newUser = userService.findEmployeeByUserName(savedUser.getUserId());
		assertEquals("Sam", newUser.getUsername());
		assertEquals("Sam@gmail.com", newUser.getEmail());
	}
	
	
}
