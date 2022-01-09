package tw.finalproject.orderdetail.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.orderdetail.model.OrderDetailService;

@Controller
public class OrderDetailController {

	@Autowired
	private OrderService odService;
	
	@Autowired
	private OrderDetailService oddService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ManagerService mngService;

	@GetMapping("/findorderdetails.controller")
	public String processFindAll(@RequestParam("orderId") Integer orderId, Model m) {
		
		OrderBean odBean = odService.findById(orderId);
		
		List<OrderDetailBean> orderdetails = odBean.getOrderdetails();
		m.addAttribute("allorderdetails", orderdetails);

		System.out.println("test3----------------------------------");
		
		return "backController_orderDetail";
	}
	
	
//	@GetMapping("/insertorder.controller")
//	public String insertOrder() {
//		return "orderInsert";
//	}
//
//	@PostMapping("/insertorder2.controller")
//	public String insertOrder2(
//			@RequestParam("publisher") String publisher,
//			@RequestParam("content") String content, Model m
//			) {
//		
//		OrderBean bbBean = new OrderBean();
//		bbBean.setPublisher(publisher);
//		bbBean.setContent(content);
//		
//		ManagerBean mngBean = mngService.findByName(publisher);
//		bbBean.setManagerBean(mngBean); // 做關聯
//		
//		odService.insertOrder(bbBean);
//		
//		if (session.getAttribute("mngLogin") != null) {
//			return "redirect:/findallorders.controller";
//		}
//		return "homepage";
//	}
	
	
	@GetMapping("/deleteorderdetail.controller")
	public String deleteOrderDetail(@RequestParam("orderDetailId") Integer id, Model m) {
		oddService.deleteById(id);
		return "forward:/findallorders.controller";
	}

//	@GetMapping("/updateorder.controller")
//	public String updateOrder(@RequestParam("orderId") Integer id, Model m) {
//		OrderBean odb = odService.findById(id);
//		m.addAttribute("order", odb);
//		
//		return "orderUpdate";
//	}
	
//	@PostMapping("/updateorder2.controller")
//	@ResponseBody
//	public Integer updateOrder2(
//			@RequestBody HashMap<String, String> params
//			) {
//		Integer orderId = Integer.parseInt(params.get("id"));
//		Integer orderState = Integer.parseInt(params.get("state"));
//		
//		OrderBean odBean = oddService.findById(orderId);
//		odBean.setOrderState(orderState);
//		
//		oddService.updateOrder(odBean);
//		
//		Set<BillboardBean> billboards = mngBean.getBillboards();
//		billboards.add(bbBean);
//		mngService.updateManager(mngBean); // 做關聯
//		
//		return odBean.getOrderState();
//		
//	}
	

}
