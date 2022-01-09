package tw.finalproject.warrantyRMA.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.Optional;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.warranty.model.WarrantyBean;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface RmaRepository extends JpaRepository<RmaBean, Integer> {
//
//	public List<RmaBean> findBRmaMember(String userId);



	@Query(value = "select * from RmaInfo r inner join warrantyInfo w on r.fk_warrantyInfoid = w.warrantyInfoId inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId", nativeQuery = true)
	public List<RmaBean> findallrma();

	@Query(value = "select * from RmaInfo r inner join warrantyInfo w on r.fk_warrantyInfoid = w.warrantyInfoId inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId where  userId = ?1", nativeQuery = true)
	public List<RmaBean> memberfindall(String userId);
	// int 跳轉 RMA頁面
	@Query(value = "select * from RmaInfo r inner join warrantyInfo w on r.fk_warrantyInfoid = w.warrantyInfoId inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId where  rmaId = ?1", nativeQuery = true)
	public List<RmaBean> findByrmaid(Integer userId);
	//找序號比對 不重複RMA
	@Query(value = "select * from RmaInfo  where  productId = ?1", nativeQuery = true)
	public Optional<RmaBean> findByProductId(String id);
//	public List<RmaBean> find();
	@Query(value = "select * from RmaInfo  where  rmaId = ?1", nativeQuery = true)
	public RmaBean findrmaid(Integer id);
	
//	@Modifying
//	@Transactional
//	@Query(value = "UPDATE RmaInfo SET registerStatus = ?1 , set xxxx = ?2   , set xxx = ?3", nativeQuery = true)
//	public void updaterma(Integer id);
//	public RmaBean saveRma(RmaBean rmaBean);

//	@Query(value = "select * from warrantyInfo w inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId"
//			, nativeQuery = true)
//	public List<RmaBean> findMemberBuyInfoBeanName();
////	
//	@Query(value = "Select * From warrantyInfo where  warrantyInfoId =  ?", nativeQuery = true)  //?1 對應第一筆資料
//	public List<RmaBean> findBywarrantyInfoId(Integer id);
//	
//	@Modifying
//	@Transactional
//	@Query(value = "UPDATE warrantyInfo SET registerStatus=0 WHERE warrantyInfoId = ?", nativeQuery = true)
//	public void update(Integer id);
//
//	@Query(value = "select * from warrantyInfo w inner join Members m on w.fk_memberId = m.memberId inner join Products p on p.productId = w.fk_productId where userId = ?1 "
//			, nativeQuery = true)
//	public List<RmaBean> findMemberall(String userId);
//	
//	//SQL驗證序號 會員新增 驗證序號不重複
//	@Query(value = "select * from warrantyInfo where registerid =?1 ", nativeQuery = true)  //多筆不加?1 會報錯
//	List<RmaBean> findregisterId(@Param("registerid")String registerid);
//	//JPS  find registerid test 1+2
//	public Optional<RmaBean> findByregisterid(String registerid);
//	
//	public Optional<RmaBean> findByWarrantyInfoId(Integer id);
//
////	
////	
////	
//	public List<RmaBean> findByList(RmaBean mbBean);//update
////
////	
////
////	public Optional<MemberBuyInfoBean> findM_account(String account);
////	
////	public Optional<MemberBuyInfoBean> findAll(String accountg);
//
////	public List<WarrantyBean> findByNameId(Integer id);

}
