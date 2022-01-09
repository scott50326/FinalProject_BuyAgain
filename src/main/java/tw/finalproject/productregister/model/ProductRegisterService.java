package tw.finalproject.productregister.model;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderRepository;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.product.model.ProductRepository;
import tw.finalproject.warranty.model.WarrantyBean;

@Service
@Transactional
public class ProductRegisterService {

	@Autowired
	private ProductRegisterRepository pdrgReps;

	@Autowired
	private ProductRepository pdReps;
	
	@Autowired
	private OrderRepository ordReps;
	
	public List<ProductRegisterBean> findAll() {
		return pdrgReps.findAll();
	}

	public ProductRegisterBean findById(Integer id) {
		Optional<ProductRegisterBean> op1 = pdrgReps.findById(id);
		if (op1.isPresent()) {
			ProductRegisterBean pdrgb = op1.get();
			return pdrgb;
		}
		return null;
	}

	public ProductRegisterBean insertOrder(ProductRegisterBean odBean) {
		return pdrgReps.save(odBean);
	}

	public ProductRegisterBean updateOrder(ProductRegisterBean odBean) {
		return pdrgReps.save(odBean);
	}

	public void deleteById(Integer id) {
		pdrgReps.deleteById(id);
	}
	
	public ProductRegisterBean insertproductregister(ProductRegisterBean pdr) {

		ProductBean pd = pdReps.findById(pdr.getProductBean().getProductId()).get();
		pd.getRegisterProducts().add(pdr); 
		pdr.setProductBean(pd); 
		
		OrderBean ob = ordReps.findByorderId(pdr.getOrderBean().getOrderId()); // 呼叫ord service找orderId
		ob.getProductregisters().add(pdr); // ob取得getOrders方法 add 到 ob傳回OrderDetailBean
		pdr.setOrderBean(ob); // 把ob服務加到 OrderBean

		return pdrgReps.save(pdr);
	}

	////////// warranty
//	public List<OrderBean> findProductserialnumber(String registerid) {
//		System.out.println("OrderService帶入值====" + registerid);

//		String serial = registerid.getProductserialnumber();
//		System.out.println("serial========="+serial);

//		Optional<ManagerBean> op1 = mngReps.findByUserId(userId);
//		
//		if (od.isPresent()) {
//			OrderBean odd = od.get();
//			System.out.println("odd get========="+odd);
//			if (odd.getProductserialnumber().equals(registerid)) {
//		return odReps.findByProductserialnumber(registerid);
//			} else {
//				return null;
//			}
//			
//		}
//		return null;
//	}

	// 整合改 帶序號找串聯
	public ProductRegisterBean findByLicenseKey(String LicenseKey) {
		Optional<ProductRegisterBean> op1 = pdrgReps.findByLicenseKey(LicenseKey);
		if (op1.isPresent()) {
			ProductRegisterBean pdrgb = op1.get();
			return pdrgb;
		}
		return null;
	}
	
	//查詢區
	public List<ProductRegisterBean> findwarrantyregisterId() {
		return pdrgReps.findwarrantyregisterId();
	}
}
