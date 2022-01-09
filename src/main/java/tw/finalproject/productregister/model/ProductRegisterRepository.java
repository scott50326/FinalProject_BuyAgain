package tw.finalproject.productregister.model;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.warranty.model.WarrantyBean;



public interface ProductRegisterRepository extends JpaRepository<ProductRegisterBean, Integer> {
	
//	public OrderBean findBean(OrderBean id);
	
	@Query(value = "select Productserialnumber from ProductRegister  where licenseKey = ?1 " , nativeQuery = true)
	public List<ProductRegisterBean> findproductserial( String serial);
	
	@Query(value = "select Productserialnumber from ProductRegister  where licenseKey = ?1  " , nativeQuery = true)
	public List<ProductRegisterBean> findByserial(String serial);  //整合改
	
	@Query(value = "select * from ProductRegister  where licenseKey = ?1 " , nativeQuery = true)
	public List<ProductRegisterBean> findByProductserialnumber(String OrderBean);
	//串聯找
	@Query(value = "select * from ProductRegister o inner join OrderDetails s on o.orderId = s.fk_orderId inner join Products p on p.productId = s.fk_productId  where licenseKey = ?1", nativeQuery = true)  //?1 對應第一筆資料
	public List<ProductRegisterBean> findBySerial(String serial);
	
	public Optional<ProductRegisterBean> findByLicenseKey(String LicenseKey);
	
	//查詢序號區 
	@Query(value = "select * from ProductRegister pr inner join Orders o on o.orderId = pr.fk_orderId inner join Products p on p.productId = pr.fk_productId inner join Members m on m.memberId = o.fk_memberId ", nativeQuery = true)
	public List<ProductRegisterBean> findwarrantyregisterId();
}
