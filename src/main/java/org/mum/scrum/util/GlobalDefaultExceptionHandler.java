package org.mum.scrum.util;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.HttpSessionRequiredException;
import org.apache.log4j.Logger;
import org.mum.scrum.web.controllers.ResourceNotFoundException;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

@ControllerAdvice
class GlobalDefaultExceptionHandler {
    public static final String DEFAULT_ERROR_VIEW = "error";
    private static final Logger logger = Logger.getLogger(GlobalDefaultExceptionHandler.class);

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFoundException() {
        return "404";
    }
    
    @ExceptionHandler(HttpSessionRequiredException.class)
    @ResponseStatus(value = HttpStatus.UNAUTHORIZED, reason="The session has expired")    
    public String handleSessionExpired(){        
      return "redirect:/login?expired";
    }
    
//    @ExceptionHandler(NoHandlerFoundException.class)
//    public String handle(Exception ex) {
//       return "404";//this is view name
//   }        
//    @ExceptionHandler
//    @ResponseStatus(HttpStatus.NOT_FOUND)
//    public ModelAndView handleException (NoSuchRequestHandlingMethodException ex) {
//            ModelAndView mav = new ModelAndView("404");
//            return mav;
//    }
    
//    @ExceptionHandler
//    @ResponseStatus(HttpStatus.NOT_FOUND)
//    public ModelAndView handleExceptiond (NoHandlerFoundException ex) {
//            ModelAndView mav = new ModelAndView("404");
//            return mav;
//    }
    
    @ResponseStatus(value=HttpStatus.NOT_FOUND)
    @ExceptionHandler(value=NoHandlerFoundException.class)
    public ModelAndView handleConflict(NoHandlerFoundException e,HttpServletRequest req) {
    	ModelAndView mav = new ModelAndView("404");
      return mav;
    }

    @ResponseStatus(value=HttpStatus.NOT_FOUND)
    @ExceptionHandler(value=NoSuchRequestHandlingMethodException.class)
    public ModelAndView handlesdConflict(HttpServletRequest req, NoSuchRequestHandlingMethodException e) {
    	ModelAndView mav = new ModelAndView("404");
      return mav;
    }
    
    @ResponseStatus(value=HttpStatus.FORBIDDEN)
    @ExceptionHandler(value=AccessDeniedException.class)
    public ModelAndView accessDeniedHandle(HttpServletRequest req, AccessDeniedException e,Principal principal) {
    	ModelAndView mav = new ModelAndView("403");
    	mav.addObject("username", principal.getName());
      return mav;
    }
    
    @ExceptionHandler(value=HttpRequestMethodNotSupportedException.class)
    public String redirectExpiredCSRFToken(HttpServletRequest req, HttpRequestMethodNotSupportedException e,Principal principal) {
    	return "redirect:/login?expired";
    }

    @ExceptionHandler(value = Exception.class)
    public ModelAndView defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        // If the exception is annotated with @ResponseStatus rethrow it and let
        // the framework handle it - like the OrderNotFoundException example
        // at the start of this post.
        // AnnotationUtils is a Spring Framework utility class.
        if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) != null)
            throw e;
        
        //logs exception
        logger.error("Unhandle Error Occur!",e);
        // Otherwise setup and send the user to a default error-view.
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.addObject("url", req.getRequestURL());
        mav.setViewName(DEFAULT_ERROR_VIEW);
        return mav;
    }
}