/**
 * 
 */
package org.mum.scrum.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


/**
 * @author Sam
 *
 */
public class SecurityUser extends Employee implements UserDetails
{

	private static final long serialVersionUID = 1L;
	public SecurityUser(Employee user) {
		if(user != null)
		{
			this.setUserId(user.getUserId());
			this.setFullName(user.getFullName());
			this.setEmail(user.getEmail());
			this.setPassword(user.getPassword());
			this.setEmployeeRoles(user.getEmployeeRoles());
		}		
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Collection<GrantedAuthority> authorities = new ArrayList<>();
		Set<EmployeeRole> userRoles = this.getEmployeeRoles();
		
		if(userRoles != null)
		{
			for (EmployeeRole role : userRoles) {
				SimpleGrantedAuthority authority = new SimpleGrantedAuthority(role.getRole().getRoleName());
				authorities.add(authority);
			}
		}
		return authorities;
	}

	@Override
	public String getPassword() {
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		return super.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}

