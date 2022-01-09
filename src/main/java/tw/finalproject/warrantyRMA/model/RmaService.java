package tw.finalproject.warrantyRMA.model;

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
import tw.finalproject.warranty.model.WarrantyBean;
import tw.finalproject.warranty.model.WarrantyRepository;

@Service
@Transactional
public class RmaService {

	@Autowired
	private RmaRepository rmaReps;
	@Autowired
	private WarrantyRepository warrantyReps;
	

	// findall 管理員
	public List<RmaBean> findallrma() {
		return rmaReps.findallrma();
	}
	
	
	// 會員RMA finall info
	public List<RmaBean> findBRmaMember(String userId) {
		// TODO Auto-generated method stub
		return rmaReps.memberfindall(userId);
	}
	//會員跳轉 RMA申請畫面
	public List<RmaBean> rmainsertcheck(Integer id) {
		// TODO Auto-generated method stub
		return rmaReps.findByrmaid(id);
	}
	//RMA驗證序號不重複
    public Optional<RmaBean> findproductid(RmaBean rmaBean){
    	String findproductid = rmaBean.getProductId(); //取得JSP  set進去的id 
	Optional<RmaBean> rmacheck = rmaReps.findByProductId(findproductid); //進值SQL尋找
	
	if (rmacheck.isPresent()) { //如果存在
//		ManagerBean mng = op1.get();
//		
//		if (mng.getPassword().equals(mngBean.getPassword())) {
			return rmacheck;
		} else {
			return null;
		}
		
}
    //insert rma申請
    public RmaBean updateRma(RmaBean rmaBean) {
		// CONTROLLER 得到 JSP傳值 透過多一層方法帶JSP ID近來去新增各別資料ID SAVE
		// System.out.println("====="+shop.getFk_memberId()+shop.getFk_productId());
//		MemberBean member = memReps.findById(warrantyBean.getFk_memberId()).get(); // 查詢多方id與1方相同
		WarrantyBean warr = warrantyReps.findById(rmaBean.getWarrantyBean().getWarrantyInfoId()).get(); // 查詢多方id與1方相同
//		warrantyBean.setProductBean(pd); // 把剛剛得到的加回的bean
//		warrantyBean.setMemberBean(member); // 把剛剛得到的加回的bean
		System.out.println("warr getFk_warrantyInfoid=" + warr);
		rmaBean.setWarrantyBean(warr);
		System.out.println("rmaBean=" +rmaBean);
		
//		System.out.println("pd=" + pd);
		return rmaReps.save(rmaBean);
//		return null;
	}
    //更新日期按鈕
	   public RmaBean findRmabean(Integer rmaid) {
		   	
		   return rmaReps.findrmaid(rmaid);
	   }
	   //
	   public void update(RmaBean rmaBean) {
		   rmaReps.save(rmaBean);
		}
}
