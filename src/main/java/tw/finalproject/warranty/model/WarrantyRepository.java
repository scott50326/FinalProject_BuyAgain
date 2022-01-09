package tw.finalproject.warranty.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.member.model.MemberBean;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface WarrantyRepository extends JpaRepository<WarrantyBean, Integer> {

	

	@Query(value = "select * from warrantyInfo w inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId inner join ProductSorts ps on p.fk_sortId = ps.sortId"
			, nativeQuery = true)
	public List<WarrantyBean> findMemberBuyInfoBeanName();
//	
	@Query(value = "Select * From warrantyInfo where  warrantyInfoId =  ?", nativeQuery = true)  //?1 對應第一筆資料
	public List<WarrantyBean> findBywarrantyInfoId(Integer id);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE warrantyInfo SET registerStatus=0 WHERE warrantyInfoId = ?", nativeQuery = true)
	public void update(Integer id);

	@Query(value = "select * from warrantyInfo w inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId where userId = ?1 "
			, nativeQuery = true)
	public List<WarrantyBean> findMemberall(String userId);
	
	//SQL驗證序號 會員新增 驗證序號不重複
	@Query(value = "select * from warrantyInfo where registerid =?1 ", nativeQuery = true)  //多筆不加?1 會報錯
	List<WarrantyBean> findregisterId(@Param("registerid")String registerid);
	//JPS  find registerid test 1+2
	public Optional<WarrantyBean> findByregisterid(String registerid);
	
	public Optional<WarrantyBean> findByWarrantyInfoId(Integer id);
	
	
//	
//	
//	
//	public void save(MemberBean mbBean);//update
//
//	
//
//	public Optional<MemberBuyInfoBean> findM_account(String account);
//	
//	public Optional<MemberBuyInfoBean> findAll(String accountg);

//	public List<WarrantyBean> findByNameId(Integer id);

}
