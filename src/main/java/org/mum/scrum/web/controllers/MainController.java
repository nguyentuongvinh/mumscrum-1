package org.mum.scrum.web.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
			
	
	
	@ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFoundException() {
        return "404";
    }
	@RequestMapping(value =  "/", method = RequestMethod.GET)
	public ModelAndView defaultPage() {				
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;

	}
	
	@RequestMapping(value =  "/404", method = RequestMethod.GET)
	public ModelAndView pageNotFound() {		
		ModelAndView model = new ModelAndView();
		model.setViewName("404");
		return model;
	}
	
	@RequestMapping(value =  "/keep-alive", method = RequestMethod.POST)
	@ResponseBody
	public String keepAlive() {		
		return "true";
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model,
			@RequestParam(value="expired",required=false) String expire, HttpServletRequest request) {
		
//		Authentication authentication=SecurityContextHolder.getContext().getAuthentication();
		if(!SecurityContextHolder.getContext().getAuthentication().getName().
				  equals("anonymousUser"))
			return "redirect:/";
		
		if (error != null) {
			model.addAttribute("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addAttribute("msg", "You've been logged out successfully.");
		}
		
		if (expire != null) {
			if(expire.equals("1"))
				model.addAttribute("expire", "Account has been log in at other place!, please login again!");
			else
				model.addAttribute("expire", "Session expired, please login again!");
		}		

		return "login";

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else if (exception instanceof AccountExpiredException) {
			error = exception.getMessage();
		} else if (exception instanceof DisabledException) {
			error = exception.getMessage();
		}
		else {
			error = exception.getMessage();
		
		}

		return error;
	}

	// for 403 access denied page	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}	
}