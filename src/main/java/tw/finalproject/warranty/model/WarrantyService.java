package tw.finalproject.warranty.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberRepository;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.product.model.ProductRepository;

@Service
@Transactional
public class WarrantyService {

	@Autowired
	private WarrantyRepository warrantyReps;

	@Autowired
	private MemberRepository memReps;
	@Autowired
	private ProductRepository pdReps;

	// findall
	public List<WarrantyBean> findall() {
		return warrantyReps.findAll();
	}

	public List<WarrantyBean> findMemberBuyInfoBeanName() {
		return warrantyReps.findMemberBuyInfoBeanName();
	}
	public void update(Integer id) {
		 warrantyReps.update(id);
	}
	// delete id 註銷保固
//	public void deletewarrantyid(Integer id) {
//		 warrantyReps.save(id);
//	}

//圖片比對帳號回傳
public WarrantyBean findByWarrantyInfoId(Integer id) {
		
		Optional<WarrantyBean> op1 = warrantyReps.findByWarrantyInfoId(id);
		
		if (op1.isPresent()) {
			WarrantyBean mem = op1.get();
			return mem;
		}		
	return null;
	};

	public List<WarrantyBean> findBywarrantyId(Integer id) {
		// TODO Auto-generated method stub
		return warrantyReps.findBywarrantyInfoId(id);
	}

	// update管理員修改 and 刪除
	public WarrantyBean updatewarranty(WarrantyBean warrantyBean) {
		// CONTROLLER 得到 JSP傳值 透過多一層方法帶JSP ID近來去新增各別資料ID SAVE
		// System.out.println("====="+shop.getFk_memberId()+shop.getFk_productId());
		MemberBean member = memReps.findById(warrantyBean.getMemberBean().getMemberId()).get(); // 查詢多方id與1方相同
		ProductBean pd = pdReps.findById(warrantyBean.getProductBean().getProductId()).get(); // 查詢多方id與1方相同
		warrantyBean.setProductBean(pd); // 把剛剛得到的加回的bean
		warrantyBean.setMemberBean(member); // 把剛剛得到的加回的bean
		System.out.println("member=" + member);
		System.out.println("pd=" + pd);
		return warrantyReps.save(warrantyBean);
	}

//	


//管理員 刪除
	public WarrantyBean deletewarranty(WarrantyBean warrantyBean) {
		// CONTROLLER 得到 JSP傳值 透過多一層方法帶JSP ID近來去新增各別資料ID SAVE
		// System.out.println("====="+shop.getFk_memberId()+shop.getFk_productId());
		MemberBean member = memReps.findById(warrantyBean.getMemberBean().getMemberId()).get(); // 查詢多方id與1方相同
		ProductBean pd = pdReps.findById(warrantyBean.getProductBean().getProductId()).get(); // 查詢多方id與1方相同
		warrantyBean.setProductBean(pd); // 把剛剛得到的加回的bean
		warrantyBean.setMemberBean(member); // 把剛剛得到的加回的bean
		return warrantyReps.save(warrantyBean);
	}

	// 會員註冊 info
	    public List<WarrantyBean> findmemberall(String userid){
	    	return warrantyReps.findMemberall(userid);
	    }

	   //會員新增 驗證序號不重複 x
//	    public List<WarrantyBean> findregister(String registerid){
//	    	System.out.println("serivce帶入值TEST="+registerid);
//	    	 List<WarrantyBean> tets =warrantyReps.findregisterId(registerid);
//	    	 System.out.println("serivce回傳值tets="+tets);
//	    	 return tets;
//	    }
	    
	    //會員新增 驗證序號不重複test 2
	    public Optional<WarrantyBean> findregisterid(WarrantyBean warrantyBean){
	    	String setregisteridBean = warrantyBean.getRegisterid(); //取得JSP  set進去的id 
		Optional<WarrantyBean> warran1 = warrantyReps.findByregisterid(setregisteridBean); //進值SQL尋找
		
		if (warran1.isPresent()) { //如果存在
//			ManagerBean mng = op1.get();
//			
//			if (mng.getPassword().equals(mngBean.getPassword())) {
				return warran1;
			} else {
				return null;
			}
			
//		}
//		return null;
	}
	    public WarrantyBean insertregisterid(WarrantyBean registerid) {
			return warrantyReps.save(registerid);
		}
}
