package org.mum.scrum.repositories;

import java.util.Set;

import org.mum.scrum.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface RoleRepository extends JpaRepository<Role,Integer> {
	public Set<Role> findByStatus(Byte status);
	public Set<Role> findByRoleLVLessThanAndStatus(Byte roleLV,Byte status);
	
	@Query("SELECT r FROM Role r WHERE r.roleId "
			+ "Not In(Select er.role.roleId FROM EmployeeRole er WHERE er.employee.username=:username AND er.deleteDate is null) "
			+ "AND r.status=1")
    public Set<Role> findNotExistInEmployee(@Param("username") String username);
}
