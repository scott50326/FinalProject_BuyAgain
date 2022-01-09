package tw.finalproject.ch05.ecpay.controller;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.ch05.ecpay.model.OrderBean;
import tw.finalproject.ch05.ecpay.model.OrderItemBean;
import tw.finalproject.ch05.ecpay.model.ShoppingCart;
import tw.finalproject.ch05.ecpay.service.PayementService;

@Controller
public class PayementProcessController {
	
	@Autowired
	PayementService payementService;
	
	@GetMapping("/goECPay")
	@ResponseBody
	public String connectToEcPayment(Model model, HttpServletResponse response) {

		ShoppingCart cart = new ShoppingCart(); 
		
		OrderItemBean oib1 = new  OrderItemBean(10, 101, 123, "Spring 框架詳解 張君雅 歐萊禮", 2, 
	    		500.0, 0.8, "Spring 框架詳解", "張君雅", "歐萊禮");
		
		OrderItemBean oib2 = new  OrderItemBean(11, 101, 135, "Spring Boot實戰 林曉珍 基峰", 1, 
	    		550.0, 1.0, "Spring Boot實戰", "林曉珍", "基峰");
		
		
		// 將OrderItemBean物件內加入ShoppingCart的物件內
		cart.addToCart(123, oib1);
		cart.addToCart(135, oib2);
		
		String memberId = "a1101";   						// 取出會員代號
		double totalAmount = Math.round(cart.getSubtotal() * 1.05);  	// 計算訂單總金額 
//		String shippingAddress = request.getParameter("ShippingAddress");  // 出貨地址
		String shippingAddress = "桃園市大溪區中正路100號";  // 出貨地址
//		String bNO = request.getParameter("BNO");					// 發票的統一編號  
		String bNO = "25741010";					// 發票的統一編號  
//		String invoiceTitle = request.getParameter("InvoiceTitle");	// 發票的抬頭
		String invoiceTitle = "";	// 發票的抬頭
		Date today = new Date();   									// 新增訂單的時間
		// 新建訂單物件。OrderBean:封裝一筆訂單資料的容器，包含訂單主檔與訂單明細檔的資料。目前只存放訂單主檔的資料。
		Integer odno = (int)System.currentTimeMillis();
		OrderBean orderBean = new OrderBean(odno, memberId, totalAmount, shippingAddress, 
				bNO, invoiceTitle, today, null, null);
		
		// 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		
		Map<Integer, OrderItemBean> content = cart.getContent();
		
		Set<OrderItemBean> items = new LinkedHashSet<>();
		Set<Integer> set = content.keySet();
		for(Integer i : set) {
			items.add(content.get(i));
		}
		
		// 執行到此，購物車內所有購買的商品已經全部轉換為為OrderItemBean物件，並放在Items內
		orderBean.setItems(items);	
		
		return payementService.prepareECPayData(orderBean, response);
		
	}
	
	
	@PostMapping("/checkEcPayment.controller")
	public void checkEcPayment(@RequestParam("RtnCode") int rtnCode) {
		
		System.out.println("test");
		
		if (rtnCode == 1) {
			System.out.println("EcPayment Success!!");
		} else {
			System.out.println("EcPayment Fail!!");
		}
	}
	
}
