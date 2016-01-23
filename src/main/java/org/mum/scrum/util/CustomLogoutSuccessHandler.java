package org.mum.scrum.util;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;


@Component
public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler 
implements LogoutSuccessHandler {

//	@Autowired
//	private SecurityService securityService;
			

	@Override
	public void onLogoutSuccess
    	(HttpServletRequest request, HttpServletResponse response, Authentication authentication) 
    			throws IOException, ServletException {
		UserDetails userDetails=(UserDetails) authentication.getPrincipal();
//		is client behind something?
        String ipAddress = request.getHeader("X-FORWARDED-FOR");  
        if (ipAddress == null) {  
     	   ipAddress = request.getRemoteAddr();  
        }
        
//        Log log=new Log();
//        log.setUsername(userDetails.getUsername());
//        log.setAction(userDetails.getUsername()+" is Log Out!");
//        log.setLogDate(new Date());
//        log.setPublicIp(ipAddress);
//        log.setLocalIp(ipAddress);
//        securityService.saveLog(log);
//        response.sendRedirect(request.getContextPath()+"/login?logout");
//		super.onLogoutSuccess(request, response, authentication);
	}
}