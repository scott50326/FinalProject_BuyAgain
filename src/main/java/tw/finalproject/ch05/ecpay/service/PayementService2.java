package tw.finalproject.ch05.ecpay.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.ecpay.payment.integration.AllInOne;
import tw.finalproject.ecpay.payment.integration.domain.AioCheckOutDevide;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.orderdetail.model.OrderDetailBean;

@Service
public class PayementService2 {
	
	private final static Logger log = Logger.getLogger(PayementService2.class.getName());
	
	public String prepareECPayData(OrderBean ob, HttpServletResponse response) {
		
		System.out.println("ECPay Start!!!!!!!!!");
		
		AllInOne aio = new AllInOne("");
		
		System.out.println("test0.1---------------------------------------");
		// 使用信用卡
		AioCheckOutDevide aioCheck = new AioCheckOutDevide();
		System.out.println("test0.2---------------------------------------");
		
		/* 特店編號 測試時必須要填: 2000132 */ 
		aioCheck.setMerchantID("2000132");  
		System.out.println("test0.3---------------------------------------");
		
		/* 特店交易時間，格式為 yyyy/MM/dd HH:mm:ss，請複製下面四行 */
		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println("test0.4---------------------------------------");
		
		sdf.setLenient(false);
		System.out.println("test0.5---------------------------------------");
		
		System.out.println(ob.getOrderDate());
		
		String merchantTradeDate = sdf.format(ob.getOrderDate());
		System.out.println("test0.6---------------------------------------");
		
		aioCheck.setMerchantTradeDate(merchantTradeDate);
		
		System.out.println("test1---------------------------------------");
		
		/* 交易金額：必須為整數組成的字串，不能有小數點，否則當掉 */		
		int totalAmount = (int)ob.getFinalPrice().doubleValue();
		aioCheck.setTotalAmount(String.valueOf(totalAmount));
		
		System.out.println("test2---------------------------------------");
		
		/* 交易描述：說明性質的資料，自己填 */		
		aioCheck.setTradeDesc(ob.getMemberBean().getMemberId() + "-" +ob.getOrderNo() +  "-" + ob.getOrderDate());
		
		System.out.println("test3---------------------------------------");
		
		String itemName = "";
		
		for(OrderDetailBean odb : ob.getOrderdetails()) {
			itemName += odb.getProductBean().getName() + "#";
		}
		
		System.out.println("test4---------------------------------------");
		
		itemName = itemName.substring(0, itemName.length() - 1);
		/* 填入商品名稱，可用#隔開，可以抓你的商品名稱也可自填 */	
		aioCheck.setItemName(itemName);
		
		System.out.println("test5---------------------------------------");
		
		/* 特店交易編號，不能超過20個符號，也不能重複(一個編號只能用一次)，否則當掉，可自填 */
		aioCheck.setMerchantTradeNo("EEIT134" + ob.getOrderNo());
		
		System.out.println("test6---------------------------------------");
		
		/* 付款完成通知回傳網址：不瞭解此網址的作用 */
		aioCheck.setReturnURL("https://speakitup.nctu.me/order/showHistoryOrder");
		
		System.out.println("test7---------------------------------------");
		
		String htmlContent = "";
		
		// 輸出畫面
		/*
		 * try { PrintWriter out = response.getWriter();
		 * response.setContentType("text/html"); htmlContent = aio.aioCheckOut(aioCheck,
		 * null); log.info(htmlContent);
		 * 
		 * } catch (IOException e) { e.printStackTrace(); }
		 */
		htmlContent = aio.aioCheckOut(aioCheck, null);

		System.out.println("test8---------------------------------------");
		
		return htmlContent;
	}
	
}
