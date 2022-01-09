package tw.finalproject.manager.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ManagerRepository extends JpaRepository<ManagerBean, Integer> {

	public Optional<ManagerBean> findByUserId(String userId);
	
	public Optional<ManagerBean> findByManagerId(Integer managerId);
	
	public Optional<ManagerBean> findByName(String name);
	
	@Query(value = "SELECT * from Managers where userId=?1 ",nativeQuery = true)
	public ManagerBean findManagerBeanByUserId(String userId);
}
