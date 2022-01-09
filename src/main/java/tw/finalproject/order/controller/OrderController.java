package tw.finalproject.order.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;
import tw.finalproject.orderdetail.model.OrderDetailBean;

@Controller
public class OrderController {

	@Autowired
	private OrderService odService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ManagerService mngService;

	@GetMapping("/findallorders.controller")
	public String processFindAll(Model m) {

		List<OrderBean> orders = odService.findAll();
		m.addAttribute("allorders", orders);

		return "backController_order";
	}
	

	// 全部訂單資訊
	@GetMapping("/memberOrder.controller")
	public String findByordermemberId(Model m) throws IOException {

		MemberBean mb = (MemberBean) session.getAttribute("memlogin");

		List<OrderBean> memOrder = odService.findByordermemberId(mb.getMemberId());

		m.addAttribute("memOrder", memOrder);

		return "memberOrder";
	}

	// 全部訂單明細
	@GetMapping("/memberOrderDetails.controller")
	public String findDetails(@RequestParam("orderId") String orderId, Model m) throws IOException {

		MemberBean mb = (MemberBean) session.getAttribute("memlogin");
		
		List<OrderBean> memOrderDetail = odService.findDetails(mb.getMemberId(), orderId);
		
		System.out.println(memOrderDetail);

		m.addAttribute("mem", memOrderDetail);

		return "memberOrderDetail";
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
	
	
	@GetMapping("/deleteorder.controller")
	public String deleteOrder(@RequestParam("orderId") Integer id, Model m) {
		odService.deleteById(id);
		return "forward:/findallorders.controller";
	}

//	@GetMapping("/updateorder.controller")
//	public String updateOrder(@RequestParam("orderId") Integer id, Model m) {
//		OrderBean odb = odService.findById(id);
//		m.addAttribute("order", odb);
//		
//		return "orderUpdate";
//	}
	
	@PostMapping("/updateorder2.controller")
	@ResponseBody
	public Integer updateOrder2(
			@RequestBody HashMap<String, String> params
			) {
		Integer orderId = Integer.parseInt(params.get("id"));
		Integer orderState = Integer.parseInt(params.get("state"));
		
		OrderBean odBean = odService.findById(orderId);
		odBean.setOrderState(orderState);
		
		odService.updateOrder(odBean);
		
//		Set<BillboardBean> billboards = mngBean.getBillboards();
//		billboards.add(bbBean);
//		mngService.updateManager(mngBean); // 做關聯
		
		return odBean.getOrderState();
		
	}
	

}
