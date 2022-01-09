package tw.finalproject.shoppingcartdetail.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ShoppingcartDetailRepository extends JpaRepository<ShoppingcartDetailBean, Integer> {

	//取購物車訂單 + 商品 條件是fk_memberId  取得前端的fk_memberId
	@Query(value ="SELECT * FROM ShoppingcartDetails sd "
			+ "INNER JOIN Products pd ON sd.fk_productId = pd.productId WHERE sd.fk_memberId = ?1",nativeQuery=true)
	List<ShoppingcartDetailBean> finByMemberShopping(@Param("fk_memberId") Integer fk_memberId);
	
	//取購物車訂單 + 商品 條件是fk_productId  取得前端的fk_productId 裝進List
	@Query(value ="SELECT * FROM ShoppingcartDetails sd "
			+ "INNER JOIN Products pd ON sd.fk_productId = pd.productId WHERE sd.fk_productId IN :fk_productId",nativeQuery=true)
	List<ShoppingcartDetailBean> finByProductShopping(@Param("fk_productId") List<String> fk_productId);

	//取購物車訂單 條件是fk_productId fk_memberId 取得前端的fk_productId fk_memberId 對應
	@Query(value ="SELECT * FROM ShoppingcartDetails  WHERE fk_productId =:fk_productId and fk_memberId =:fk_memberId",nativeQuery=true)
	ShoppingcartDetailBean finByProduct(@Param("fk_productId") Integer fk_productId,@Param("fk_memberId") Integer fk_memberId);
	
	//更新購物車數量 條件是fk_memberId fk_productId
	@Modifying
	@Transactional
	@Query(value ="UPDATE ShoppingcartDetails Set quantity=?1 WHERE fk_productId =?2 and fk_memberId =?3",nativeQuery=true)
	void updateShoppingProduct(@Param("quantity") Integer quantity,@Param("fk_productId") Integer fk_productId,@Param("fk_memberId") Integer fk_memberId);
	
	//刪除購物車訂單 條件是fk_memberId fk_productId
	@Modifying
	@Transactional
	@Query(value ="DELETE FROM ShoppingcartDetails WHERE fk_memberId =?1 and fk_productId =?2",nativeQuery=true)
	void deleShoppingProduct(@Param("fk_memberId") Integer fk_memberId ,@Param("fk_productId") Integer fk_productId);
	//刪除購物車訂單 條件是fk_memberId fk_productId
	@Modifying
	@Transactional
	@Query(value ="DELETE FROM ShoppingcartDetails WHERE fk_memberId =?1 and fk_productId =?2",nativeQuery=true)
	void deleShoppingcartDetail(@Param("fk_memberId") Integer fk_memberId ,@Param("fk_productId") Integer fk_productId);
	
	

}
