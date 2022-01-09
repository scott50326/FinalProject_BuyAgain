package tw.finalproject.product.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface ProductRepository extends JpaRepository<ProductBean, Integer> {

	public List<ProductBean> findAll();
	//查詢種類
	@Query(value ="SELECT * FROM Products WHERE fk_sortId =?1 ",nativeQuery=true)
	List<ProductBean> findBysort(@Param("sortId") Integer sortId);
	//查詢商品ID
	@Query(value ="SELECT * FROM Products WHERE productId =?1 ",nativeQuery=true)
	List<ProductBean> findByproductId(@Param("productId") String productId);
	//模糊查詢
	@Query(value ="SELECT * FROM Products WHERE name like %?% ",nativeQuery=true)
	List<ProductBean> findByname(@Param("inquire")String inquire);
	//查詢我的最愛
	@Query(value ="SELECT * FROM Products WHERE clickCount >=2 ",nativeQuery=true)
	List<ProductBean> findByclickCount(@Param("clickCount") Integer clickCount);
	//增加clickCount
	@Modifying
	@Transactional
	@Query(value ="UPDATE Products Set clickCount=?1 WHERE productId =?2 ",nativeQuery=true)
	void updateproductIdLook(@Param("clickCount")Integer clickCount,@Param("productId")String productId);
}
