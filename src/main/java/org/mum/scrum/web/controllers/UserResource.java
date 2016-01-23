/**
 * 
 */
package org.mum.scrum.web.controllers;

import java.util.List;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.services.IHRSubSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Sam
 *
 */
@Controller
@RequestMapping("/rest/users/")
public class UserResource {

	@Autowired
	private IHRSubSystem hrService;
	
	@RequestMapping(value="", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Employee> findAll()
	{
		return hrService.findAll();
	}
	
	@RequestMapping(value="{id}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Employee findUser(@PathVariable("id") String id) {
		return hrService.findEmployeeByUserName(id);
	}
	
	@RequestMapping(value="", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Employee> createUser(@RequestBody Employee user) {
		Employee savedUser = hrService.createEmployee(user);
		return new ResponseEntity<Employee>(savedUser, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="", method=RequestMethod.PUT, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<Employee> updateUser(@RequestBody Employee user) {
		Employee savedUser = hrService.updateEmployee(user);
		return new ResponseEntity<Employee>(savedUser, HttpStatus.OK);
	}
	
//	@RequestMapping(value="{id}", method=RequestMethod.DELETE, produces=MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public ResponseEntity<Void> deleteUser(@PathVariable("id") int id) {
//		userService.deleteUser(id);
//		return new ResponseEntity<>(HttpStatus.OK);
//	}
	
	
	
	
}
