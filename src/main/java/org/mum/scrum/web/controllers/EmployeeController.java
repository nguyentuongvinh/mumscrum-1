/**
 * 
 */
package org.mum.scrum.web.controllers;

import org.mum.scrum.entities.SecurityUser;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

import javax.validation.Valid;

import org.mum.scrum.entities.Employee;
import org.mum.scrum.entities.EmployeeRole;
import org.mum.scrum.entities.Role;
import org.mum.scrum.services.IHRSubSystem;
import org.mum.scrum.services.ValidationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dummiesmind.breadcrumb.springmvc.annotations.Link;

/**
 * @author Sam
 *
 */
@Controller
@PreAuthorize("hasRole('HRAdmin')")
public class EmployeeController 
{
	
	@ModelAttribute("employeeRole")
    public EmployeeRole Constructor(){
    	return new EmployeeRole();
    }
	private static IHRSubSystem hrService;
	
	@Autowired
	public void setUserService(IHRSubSystem userService) {
		EmployeeController.hrService = userService;
	}
	
	@Autowired
	private ValidationService validationService;
	
	@ModelAttribute("roles")
    public Set<Role> rolesConstructor(){
		return hrService.findRoleByStatus((byte) 1);
    }
	
	@ModelAttribute("employee")
    public Employee EmployeeConstructor(){
		return new Employee();
    }
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
        binder.registerCustomEditor(Date.class,"employee.pwdExpiredDate",new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class,"employee.accountExpiredDate",new CustomDateEditor(dateFormat, true));        
        binder.registerCustomEditor(Date.class,"pwdExpiredDate",new CustomDateEditor(dateFormat, true));
        binder.registerCustomEditor(Date.class,"accountExpiredDate",new CustomDateEditor(dateFormat, true));
    }
	
	public static Employee getCurrentUser()
	{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (principal instanceof UserDetails) 
	    {
	    	String email = ((UserDetails) principal).getUsername();
	    	Employee loginUser = hrService.findUserByEmail(email);
	    	return new SecurityUser(loginUser);
	    }

	    return null;
	}
	@Link(label="Employee", family="EmployeeController", parent = "" )
	@RequestMapping(value =  "/employee", method = RequestMethod.GET)
	public ModelAndView employeeMgt() {

		ModelAndView model = new ModelAndView();		
    		model.addObject("users", hrService.findAll());
		model.setViewName("usermgt");
		return model;

	}
	@Link(label="New Employee", family="EmployeeController", parent = "Employee" )
	@RequestMapping(value =  "/newemployee", method = RequestMethod.GET)
	public ModelAndView newemployee() {

		ModelAndView model = new ModelAndView();				
		model.setViewName("newuser");
		return model;

	}
	
	@Link(label="New Employee", family="EmployeeController", parent = "Employee" )
	@RequestMapping(value="/newemployee",method=RequestMethod.POST)
	public String addRecordEmployee(@Valid @ModelAttribute("employeeRole") EmployeeRole employeeRole
			,BindingResult result,@Valid @RequestParam(value="selectRoles",required=false) String[] selectRoles
			,Principal principal,Model model){
		if(result.hasErrors()){
			model.addAttribute("errors", result.getAllErrors());
			return "newuser";			
		}
		if(validationService.checkDuplicateUsername(employeeRole.getEmployee().getUsername()))
		{
			ObjectError error = new ObjectError("username","Username already exist!");
			result.addError(error);
			model.addAttribute("errors", result.getAllErrors());
			return "newuser";	
		}
		if(selectRoles==null){
			ObjectError error = new ObjectError("roles","select at least one role");
			result.addError(error);
			model.addAttribute("errors", result.getAllErrors());
			return "newuser";
		}
		
		Employee employee=employeeRole.getEmployee();
		//*** Par Authentication Expired
//		Calendar cal = Calendar.getInstance(); 
//		cal.add(Calendar.MONTH, 3);
//		Date pwdEx=new Date();
//	    pwdEx=cal.getTime();
//	    user.setPwdExpiredDate(pwdEx);
	    //*** Attempt Log
		employee.setAttempNo((byte)(0));
		employee.setUsername(employee.getUsername().trim());
	    //*** Operator	   	    	    
		employee.setOperator(principal.getName());
		employee.setSynDate(new Date());
//	    Encoder Authentication
	    PasswordEncoder encoder=new BCryptPasswordEncoder();
	    employee.setPassword(encoder.encode(employee.getPassword()));
	    employee.setEnabled(true);
	    
	    for (String string : selectRoles) {
	    	EmployeeRole empRole=new EmployeeRole();
	    	empRole.setCreateDate(new Date());
	    	empRole.setOperator(principal.getName());
	    	empRole.setRole(hrService.findRoleByID(Integer.parseInt(string)));
	    	empRole.setEmployee(employee);
		    employee.getEmployeeRoles().add(empRole);
		    
		}
	    hrService.updateEmployee(employee);	    
	    
		return "redirect:/employee";
	}
	
	@Transactional(readOnly=true)
	@Link(label="Edit Employee", family="EmployeeController", parent = "Employee" )
	@RequestMapping(value =  "/employee/{username}/edit", method = RequestMethod.GET)
	public String editEmployee(@PathVariable("username") String username,Model model) {
		Employee employee=hrService.findEmployeeByUserName(username);	
		if(employee==null) throw new ResourceNotFoundException();
		
		model.addAttribute(employee);	
		model.addAttribute("employeeRoles", hrService.findEmployeeRoleByEmployee(username));
		model.addAttribute("roles", hrService.findRoleNotExistInEmployee(username));		
		return "edituser";

	}
	
	@Link(label="Edit Employee", family="EmployeeController", parent = "Employee" )
	@RequestMapping(value =  "/employee/{username}/edit", method = RequestMethod.POST)
	public String processEditEmployee(@PathVariable("username") String username
			,@Valid @ModelAttribute("employee") Employee employee
			,BindingResult result,Model model,Principal principal) {
		if(result.hasErrors()){
			model.addAttribute("errors", result.getAllErrors());
			return "edituser";			
		}
//		if(role.getStatus()==0){
//			Role tempRole=securityService.findRoleById(roleId);
//			if(securityService.userRoleFindByRole(tempRole).size()>0){
//				ObjectError error = new ObjectError("role","Unable to disable, this role is in used!");
//				result.addError(error);
//				model.addAttribute("errors", result.getAllErrors());
//				return editRole(roleId,model);	
//			}
//		}
		Employee orgEmployee=hrService.findEmployeeByUserName(username);
		if(employee==null) throw new ResourceNotFoundException();
		orgEmployee.setFullName(employee.getFullName());
		if(!principal.getName().equals(orgEmployee.getUsername()))
			orgEmployee.setEnabled(employee.isEnabled());
		orgEmployee.setEmail(employee.getEmail());
		orgEmployee.setFirstLogin(employee.isFirstLogin());
		orgEmployee.setLocked(employee.isLocked());
		orgEmployee.setUserId(employee.getUserId());
		orgEmployee.setSynDate(new Date());
		orgEmployee.setOperator(principal.getName());
		hrService.updateEmployee(orgEmployee);
		return "redirect:/employee";
	}
	
	@RequestMapping(value =  "/employee/{username}/edit/employeerole", method = RequestMethod.POST)
	public String processEditEmployeeRole(@PathVariable("username") String username
			,@Valid @ModelAttribute("employeeRole") EmployeeRole employeeRole
			,BindingResult result,Model model,Principal principal) {
		if(result.hasErrors()){
			model.addAttribute("errors", result.getAllErrors());
			return "redirect:/employee/"+username+"/edit#tabemployeeRole";			
		}
		employeeRole.setRole(hrService.findRoleByID(employeeRole.getRole().getRoleId()));
		employeeRole.setEmployee(hrService.findEmployeeByUserName(username));
		employeeRole.setCreateDate(new Date());
		employeeRole.setOperator(principal.getName());
		hrService.saveEmployeeRole(employeeRole);
		
		return "redirect:/employee/"+username+"/edit#tabemployeeRole";
	}
	
	@RequestMapping(value =  "/employee/${username}/remove/employeerole/{employeeRoleId}", method = RequestMethod.POST)
	public String processRemoveEmployeeRole(@PathVariable("username") String username
			,@PathVariable("employeeRoleId") Integer employeeRoleId,Model model,Principal principal) {
		
		EmployeeRole employeeRole=hrService.findEmployeeRoleByID(employeeRoleId);		
		if(employeeRole==null) throw new ResourceNotFoundException();
		System.out.print("HERERE");
		employeeRole.setDeleteDate(new Date());
		employeeRole.setOperator(principal.getName());
		System.out.print("HERERE");
		hrService.saveEmployeeRole(employeeRole);
		
		return "redirect:/employee/"+username+"/edit#tabemployeeRole";
	
	}
}

