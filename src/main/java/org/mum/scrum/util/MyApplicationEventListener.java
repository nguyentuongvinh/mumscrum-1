//package org.mum.scrum.util;
//
//import java.util.Date;
//
//import javax.servlet.annotation.WebListener;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationEvent;
//import org.springframework.context.ApplicationListener;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.session.SessionRegistryImpl;
//import org.springframework.security.web.authentication.WebAuthenticationDetails;
//import org.springframework.security.web.session.HttpSessionDestroyedEvent;
//
//import com.pru.pruquote.model.Log;
//import com.pru.pruquote.service.SecurityService;
//
//@SuppressWarnings("rawtypes")
//@WebListener
//@Configuration
//public class MyApplicationEventListener implements ApplicationListener{
//
//	@Autowired
//	private SecurityService securityService;
//	
//	@Autowired
//	private SessionRegistryImpl sessionRegistry;
//	
////	@Autowired
////	private SessionRegistryImpl sessionRegistry;
//					
//	@Override
//	public void onApplicationEvent(ApplicationEvent appEvent) {
//		
//		if (appEvent instanceof InteractiveAuthenticationSuccessEvent)
//	    {			
////			InteractiveAuthenticationSuccessEvent event = (InteractiveAuthenticationSuccessEvent) appEvent;
//			
//	       // UserDetails userDetails = (UserDetails) event.getAuthentication().getPrincipal();
//	        		
//	        //is client behind something?
////	        String ipAddress = request.getHeader("X-FORWARDED-FOR");  
////	        if (ipAddress == null) {  
////	     	   ipAddress = request.getRemoteAddr();  
////	        }
//	        
////	        Log log=new Log();
////	        log.setAction(userDetails.getUsername()+" is Log in!");
////	        log.setLogDate(new Date());
////	        log.setPublicIp(ipAddress);
////	        log.setLocalIp("...");
////	        securityService.saveLog(log);
//	    }
//		else if (appEvent instanceof HttpSessionDestroyedEvent)
//	    {						
//			HttpSessionDestroyedEvent event=(HttpSessionDestroyedEvent) appEvent;
//			HttpSession session=event.getSession();
//			
//			SecurityContext context = event.getSecurityContexts().get(0);
//			Authentication authentication = context.getAuthentication();	
//			
////			clear quote history 
//			securityService.clearQuoteHistory(authentication.getName());
//			
////			WebAuthenticationDetails details = (WebAuthenticationDetails)SecurityContextHolder.getContext().getAuthentication().getDetails();
//			WebAuthenticationDetails details = (WebAuthenticationDetails)authentication.getDetails();
//			String ip = details.getRemoteAddress();
//			
////			Check current session count 
//			int size=sessionRegistry.getAllSessions(authentication.getPrincipal(), true).size();
//			
////			if one session when destroy should be zero so if bigger than zero mean exceed maximum session count
//			if(size>0){
//				Log log=new Log();
//		        log.setAction("User account log in at other place");		        
//		        log.setLogDate(new Date());
//		        log.setPublicIp(ip);
//		        log.setLocalIp(ip);
//		        log.setUsername(authentication.getName());
//		        securityService.saveLog(log);				
//			}
//			else{					
//				long lastAction = session.getLastAccessedTime();
//				long now = System.currentTimeMillis();
//				long timeout= session.getMaxInactiveInterval()*1000;
//				if ((now-lastAction) > timeout){
//					//session expire 
//					Log log=new Log();
//			        log.setAction("Session expired");		        
//			        log.setLogDate(new Date());
//			        log.setPublicIp(ip);
//			        log.setLocalIp(ip);
//			        log.setUsername(authentication.getName());
//			        securityService.saveLog(log);
//				}else{
//					//session logout
//					Log log=new Log();
//			        log.setUsername(authentication.getName());
//			        log.setAction(authentication.getName()+" is Log Out!");
//			        log.setLogDate(new Date());
//			        log.setPublicIp(ip);
//			        log.setLocalIp(ip);
//			        securityService.saveLog(log);
//				}
//			}
//	    }
//			
//	}
//			
//}
