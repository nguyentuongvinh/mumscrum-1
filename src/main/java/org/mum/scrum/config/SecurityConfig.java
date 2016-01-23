/**
 * 
 */
package org.mum.scrum.config;


import org.mum.scrum.util.MyAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

/**
 * @author Sam
 *
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true) 
//@ImportResource("classpath:applicationContext-security.xml")
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
	@Autowired
	private MyAuthenticationSuccessHandler myAuthenticationSuccessHandler;
	
	@Autowired
	@Qualifier("userDetailsService")
	private UserDetailsService customUserDetailsService;

	@Autowired	
	private SessionRegistryImpl sessionRegistry;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
	}



	  @Override
	  public void configure(WebSecurity web) throws Exception {
	    web
	      .ignoring()
	         .antMatchers("/resources/**","/webjars/**"); // #3
	  }

	  @Bean
	    public SessionRegistryImpl sessionRegistry() {
	        return new SessionRegistryImpl();
	    }
	  
	  @Override
	  protected void configure(HttpSecurity http) throws Exception {
		//add filter before csrf
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
        filter.setEncoding("UTF-8");
        filter.setForceEncoding(true);
        http.addFilterBefore(filter,CsrfFilter.class);
	    http		
		.authorizeRequests()		
//			.antMatchers("/resources/**")
//			.access("permitAll")
//			.antMatchers("/webjars/**")
//			.access("permitAll")
			.antMatchers("/login")
			.access("permitAll")
			.antMatchers("/**")			
			.access("isAuthenticated()")	
//			.anyRequest().authenticated()
			.and()				
		.formLogin()
			.loginPage("/login").failureUrl("/login?error")	
			.successHandler(myAuthenticationSuccessHandler)
			.usernameParameter("username")
			.passwordParameter("password")
			.and()			
		.logout()				
			.logoutSuccessUrl("/login?logout")	
//			.logoutSuccessHandler(customLogoutSuccessHandler)
			.deleteCookies("JSESSIONID")				
			.and()
		.headers()
			.xssProtection()
			.and()
		.csrf()
			.and()
		.exceptionHandling().accessDeniedPage("/403")
			.and()
		.sessionManagement()			
			.maximumSessions(1)						
			.sessionRegistry(sessionRegistry)
			.expiredUrl("/login?expired=1")
			.and();	
	  }
	  @Bean
		public PasswordEncoder passwordEncoder(){
			PasswordEncoder encoder = new BCryptPasswordEncoder();
			return encoder;
		}
}
