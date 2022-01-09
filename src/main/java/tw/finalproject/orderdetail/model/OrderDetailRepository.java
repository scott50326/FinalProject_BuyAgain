package tw.finalproject.orderdetail.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer> {

//	@Query(value ="SELECT * FROM OrderDetails od INNER JOIN Orders o ON o.orderId=od.fk_orderId WHERE fk_memberId=?1 and orderId=?2 ",nativeQuery=true)
//	List<OrderDetailBean> findDetails(@Param("fk_memberId") Integer fk_memberId,@Param("orderId") String orderId);
//	

}
