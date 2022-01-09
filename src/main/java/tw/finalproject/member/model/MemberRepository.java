package tw.finalproject.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MemberRepository extends JpaRepository<MemberBean, Integer> {
	
	public Optional<MemberBean> findByUserId(String userId);
		
	public Optional<MemberBean> findByMemberId(Integer id);
	
	public List<MemberBean> findByRank(Integer rank);
	
	public List<MemberBean> findByNameLike(String similarName);
	
	@Query(value = "SELECT * from Members where userId=?1 ",nativeQuery = true)
	public MemberBean findCheckId(String userId);
	
	@Query(value = "SELECT * from Members where email=?1 ",nativeQuery = true)
	public MemberBean findEmail(String Email);
	
	@Query(value = "SELECT  TOP 1 * from Members ORDER BY NEWID() ",nativeQuery = true)
	public MemberBean findLotteryMemberId();
}
