package tw.finalproject.shoppingcartdetail.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberRepository;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderRepository;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.orderdetail.model.OrderDetailRepository;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.product.model.ProductRepository;
import tw.finalproject.productsort.model.ProductSortBean;

@Service
@Transactional
public class ShoppingcartDetailService {

	@Autowired
	private ShoppingcartDetailRepository shopResp;
	@Autowired
	private MemberRepository memReps;
	@Autowired
	private ProductRepository pdReps;
	@Autowired
	private OrderRepository ordReps;
	@Autowired
	private OrderDetailRepository ordetReps;

//會員訂單		
	public List<ShoppingcartDetailBean> findByMemberId(Integer memberId) {
		return shopResp.finByMemberShopping(memberId);
	}

//刪除一筆訂單
	public void deleteProduct(Integer shoppingcartDetailId) {
		shopResp.deleteById(shoppingcartDetailId);
	}
	
//刪除一筆購物車資訊
	public void deleShoppingcartDetail(Integer memberId ,Integer productId) {
		shopResp.deleShoppingcartDetail(memberId , productId);
	}
	
//刪除購物車資訊
	public void deleShoppingProduct(Integer memberId ,Integer productId) {
		shopResp.deleShoppingProduct(memberId , productId);
	}
	
//找會員商品	
		public ShoppingcartDetailBean finByProduct(Integer productId,Integer memberId) {

			return shopResp.finByProduct(productId, memberId);
		}
	
//找會員商品	List 給checkbox用的
	public List<ShoppingcartDetailBean> findByProductId(List<String> productIds) {

		return shopResp.finByProductShopping(productIds);
	}	

//多方新增 進購物車
	public ShoppingcartDetailBean insertShoppingcartDetail(ShoppingcartDetailBean shop) {
	
		MemberBean member = memReps.findById(shop.getMemberBean().getMemberId()).get(); // 呼叫mem service找Fk_memberId
		ProductBean pd = pdReps.findById(shop.getProductBean().getProductId()).get(); // 呼叫pd service找Fk_productId

		member.getShoppingcartDetails().add(shop); // member取得getShoppingcartDetail方法 add 到 shop傳回ShoppingcartDetailBean 
		pd.getShoppingcartDetails().add(shop); // pd取得getShoppingcartDetail方法 add到 shop傳回ShoppingcartDetailBean

		shop.setProductBean(pd); // 把pd服務加到 ProductBean
		shop.setMemberBean(member); // 把mem服務加到 MemberBean

		return shopResp.save(shop);
	}

//多方新增 進order
	public OrderBean saveOrder(OrderBean order) {
		
//		MemberBean member = memReps.findById(order.getFk_memberId()).get(); // 呼叫mem service找Fk_memberId
//		order.setMemberBean(member); // 把mem服務加到 MemberBean
		return ordReps.save(order);
	}

//多方新增 進orderdetial
	public OrderDetailBean saveOrderDetial(OrderDetailBean orderdetail) {
		
		ProductBean pd = pdReps.findById(orderdetail.getProductBean().getProductId()).get(); // 呼叫pd service找Fk_productId
		orderdetail.setProductBean(pd); // 把pd服務加到 ProductBean
		
		OrderBean ob = ordReps.findByorderId(orderdetail.getOrderBean().getOrderId()); // 呼叫ord service找orderId
		ob.getOrderdetails().add(orderdetail); // ob取得getOrders方法 add 到 ob傳回OrderDetailBean
		orderdetail.setOrderBean(ob); // 把ob服務加到 OrderBean
		
		return ordetReps.save(orderdetail);
	}
	
	public void updateShoppingProduct(Integer quantity,Integer productId,Integer memberId) {
		
		shopResp.updateShoppingProduct(quantity, productId, memberId);
	}
	

	public Optional<ShoppingcartDetailBean> findById(Integer productId) {
		
		return shopResp.findById(productId);
	}
	
////多方更新
//	public ShoppingcartDetailBean updateProduct(ShoppingcartDetailBean shop) {
//			
//		ShoppingcartDetailBean updateproduct = shopResp.findById(shop.getFk_memberId()).get();
//		updateproduct.setFk_memberId(shop.getFk_memberId());
//		updateproduct.setFk_productId(shop.getFk_productId());
//		updateproduct.setQuantity(shop.getQuantity());
//
//		MemberBean member = memReps.findById(shop.getFk_memberId()).get();
//		member.getShoppingcartDetail().add(updateproduct);
//		updateproduct.setMemberBean(member);		
//		return shopResp.save(updateproduct);
//	}

//	public ShoppingcartDetailBean updateProduct(ShoppingcartDetailBean shop) {
//		return shopResp.save(shop);
//	}
//

}
