package tw.finalproject.order.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.finalproject.orderdetail.model.OrderDetailBean;

public interface OrderRepository extends JpaRepository<OrderBean, Integer> {

	@Query(value ="SELECT * FROM Orders WHERE orderId =?1 ",nativeQuery=true)
	public OrderBean findByorderId(Integer orderId);

	@Query(value ="SELECT * FROM Orders WHERE fk_memberId =?1 ",nativeQuery=true)
	List<OrderBean> findByordermemberId(@Param("fk_memberId") Integer fk_memberId);
	
//	@Query(value ="SELECT o.*,od.*,p.* FROM Orders o INNER JOIN OrderDetails od ON o.orderId = od.fk_orderId  INNER JOIN Products p ON od.fk_productId = p.productId WHERE fk_memberId =?1 and orderId = ?2",nativeQuery=true)
//	List<Map<String,Object>> findDetails(@Param("fk_memberId") Integer fk_memberId,@Param("orderId") String orderId);
	
	@Query(value ="SELECT * FROM OrderDetails  ",nativeQuery=true)
	List<OrderDetailBean> findDetails(@Param("fk_memberId") Integer fk_memberId,@Param("orderId") Integer orderId);
	
	@Query(value ="SELECT * FROM Orders o INNER JOIN OrderDetails od ON o.orderId = od.fk_orderId INNER JOIN Products p ON od.fk_productId=p.productId WHERE fk_memberId=?1 and orderId=?2 ",nativeQuery=true)
	List<OrderBean> findDetails(@Param("fk_memberId") Integer fk_memberId,@Param("orderId") String orderId);
}
