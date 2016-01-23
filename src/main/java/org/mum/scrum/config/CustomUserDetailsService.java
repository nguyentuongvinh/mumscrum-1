/**
 * 
 */
package org.mum.scrum.config;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.mum.scrum.entities.EmployeeRole;
import org.mum.scrum.services.IHRSubSystem;

/**
 * @author Sam
 *
 */
@Service("userDetailsService")
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private IHRSubSystem hrService;
	

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		
		org.mum.scrum.entities.Employee user = hrService.findEmployeeByUserName(username);
		List<GrantedAuthority> authorities = buildUserAuthority(user.getEmployeeRoles());

		return buildUserForAuthentication(user, authorities);
		
	}

	// Converts com.pru.pruquote.model.User user to
	// org.springframework.security.core.u0000-00-00serdetails.User
	private User buildUserForAuthentication(org.mum.scrum.entities.Employee user, List<GrantedAuthority> authorities) {
//		
		return new User(user.getUsername(), user.getPassword(), user.isEnabled(), true, true, !user.isLocked(), authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<EmployeeRole> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (EmployeeRole userRole : userRoles) {	
//			Set<RolePermission> rolePermissions=securityService.rolePermissionFindByRoleNotDelete(userRole.getRole().getRoleId());
//			for(RolePermission rolePermission : rolePermissions){
				setAuths.add(new SimpleGrantedAuthority(userRole.getRole().getRoleName()));
//			}
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}

}
