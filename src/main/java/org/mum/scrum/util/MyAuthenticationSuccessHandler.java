package org.mum.scrum.util;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class MyAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler  {

//	@Autowired
//	private SecurityService securityService;
			
	
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, 
            HttpServletResponse response, Authentication authentication) 
            throws ServletException, IOException {
        
		UserDetails userDetails=(UserDetails) authentication.getPrincipal();		
//		is client behind something?
//		User user=securityService.userFindOne(userDetails.getUsername());
//        String ipAddress = request.getHeader("X-FORWARDED-FOR");  
//        if (ipAddress == null) {  
//     	   ipAddress = request.getRemoteAddr();  
//        }
//        
//        Log log=new Log();
//        log.setUsername(userDetails.getUsername());
//        log.setAction(userDetails.getUsername()+" is Log in!");
//        log.setLogDate(new Date());
//        log.setPublicIp(ipAddress);
//        log.setLocalIp(ipAddress);
//        securityService.saveLog(log);
//        
//        Date date1=user.getPwdExpiredDate();
//		
//		if(date1!=null){
//			int days = Days.daysBetween(new LocalDate().toDateTimeAtStartOfDay(), new DateTime(date1)).getDays();
//			if(days>0 && days<=15){			
//				request.getSession().setAttribute("isExpiredSoon", "Your password is going to expired in " + (days>1?days +" days!":"today!"));
//			}
//		}
        
        SimpleGrantedAuthority roleChangePwd= new SimpleGrantedAuthority("ROLE_CHANGEPWD");
        if(userDetails.getAuthorities().contains(roleChangePwd)){ 
        	getRedirectStrategy().sendRedirect(request, response, "/changepwd");
        }              
        else{
        	super.onAuthenticationSuccess(request, response, authentication);
        }
        
    }
	
	
	        
	
	
	
}
