package tw.finalproject.lottery.model;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LotteryRepository extends JpaRepository<LotteryBean, Integer> {

	@Query(value = "SELECT fk_memberId FROM Lotterys WHERE fk_memberId  is not null ",nativeQuery = true)
	public ArrayList<Integer> LotteryBeanMemberId();
	
	public ArrayList<LotteryBean> findByState(Integer state);
}
