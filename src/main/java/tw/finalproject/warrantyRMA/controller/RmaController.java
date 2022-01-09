package tw.finalproject.warrantyRMA.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
//import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Date;
//import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.orderdetail.model.OrderDetailService;
import tw.finalproject.warranty.model.WarrantyBean;
import tw.finalproject.warranty.model.WarrantyService;
import tw.finalproject.warrantyRMA.model.RmaBean;
import tw.finalproject.warrantyRMA.model.RmaService;

@Controller
//@ResponseBody
@SessionAttributes(names = { "memlogin", "mngLogin" })
public class RmaController {
	private String from = "scott50321@gmail.com";
	private String to = "scott50321@gmail.com";
	@Autowired
	private RmaService rmaService;
	@Autowired
	private WarrantyService warrService;

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private HttpSession session;

	// findALL RMA管理員入口
			@GetMapping(path = "/RMAFINDALL.controller")
			public String RMAfindall2(Model m) {
				List<RmaBean> rmabean = rmaService.findallrma();
				System.out.println("RMA管理員入口FINDALL===="+rmabean);
				m.addAttribute("rmabean", rmabean); 
	
				return "RmaInfofindall";
			};
	
	// 管理員修改 RMA按鈕
	@PostMapping(path = "/updateRMa.controller")
//	@RequestMapping(path = "/updatewarranty.controller1", method = RequestMethod.POST)
	public String updateRma(@RequestParam("RmaInfoId") String id, Model m){
		List<RmaBean> maService = rmaService.findBRmaMember(id);

		m.addAttribute("rmaService", maService);//傳直回去的識別字串 update
		System.out.println(maService);
		
		return "warrantyupdate";

	}

		//管理員 確認修改
//		@GetMapping(path = "/updatewarranty.controller2")
////		@RequestMapping(value = "/updatewarranty.controller2" , method = RequestMethod.POST )
//		public String updatewarranty2(@RequestParam("warrantyInfoId")Integer warrantyInfoId,
//				@RequestParam("registerStart") Date registerStart,
//				@RequestParam("registerFinish") Date registerFinish,
//				@RequestParam("registerStatus") Integer registerStatus ,
//				@RequestParam("fk_productId") Integer fk_productId, 
//				@RequestParam("fk_memberid") Integer fk_memberid,
//				@RequestParam("pekoinvoice") String img,
//				@RequestParam("pekoid") String registerid,
//				Model m){
////			System.out.println("pekoimgpekoimg=" + img);
//			WarrantyBean warranty = new WarrantyBean() ;
//			warranty.setWarrantyInfoId(warrantyInfoId);
//			warranty.setRegisterStatus(registerStatus);
//			warranty.setFk_productId(fk_productId); //多跳轉一層去做改動
//			warranty.setFk_memberId(fk_memberid);//多跳轉一層去做改動
//			warranty.setRegisterStart(registerStart);
//			warranty.setRegisterFinish(registerFinish);
//			warranty.setInvoice(img);
//			warranty.setregisterid(registerid);
//			warrantyService.updatewarranty(warranty);
//			System.out.println(warranty);
//			return "forward:/Warrantyfindall2.controller";
//			
//		}
//
//
//	
//
//				
//			//////////////////會員
//				
//				// findALL 會員RMA入口
				@GetMapping(path = "/RMAfindMember.controller")
				public String WarrantyfindMember2(Model m) {
				
					MemberBean userid = (MemberBean)session.getAttribute("memlogin"); 
					
					
					
					if (session.getAttribute("memlogin") != null) {
						String memLogin = userid.getUserId();
						System.out.println(memLogin +"=TEST");
						List<RmaBean> rma = rmaService.findBRmaMember(memLogin);
						System.out.println("rma test ====="+rma);
						m.addAttribute("rma", rma);
						return "RMAInfoMEMBER"; // redirect: 提出新的請求給 server
					}
					
					return "memberLogin";
				};
//		
//
//		// findALL RMA會員跳轉
			@GetMapping("/RMA.controller")
				public String invoicelink(Model m , @RequestParam("rmaId") Integer id) {
					
					List<WarrantyBean> rmainsertcheck = warrService.findBywarrantyId(id);
//					List<RmaBean> rmainsertcheck = rmaService.rmainsertcheck(id);
				
					System.out.println("rmainsertcheck===="+rmainsertcheck);
					m.addAttribute("rmainsertcheck", rmainsertcheck); 
					return "RMAInsert";
				}
//			
//			
//			// findALL 會員註冊跳轉
//						@GetMapping(path = "/rmainsert1.controller")
//						public String WarrantyInsert1(Model m) {
//
//							
//							if (session.getAttribute("memlogin") != null) {
//								return "RMAInsert"; // redirect: 提出新的請求給 server
//							}			
//							return "memberLogin";
//						};
//						
//				
////						};
//						
//						// 會員申請RMA   比對RMA序號不重複
						@PostMapping(path = "/Rmainsert.controller")
						public String RmaInsert(
//								@RequestParam("userId") Integer userId,  /// id
								@RequestParam("productId")  String productId , // 序號比對
								@RequestParam("sendoutaddress") String sendoutaddress, //寄送地址
								@RequestParam("RMAreason") String RMAreason, // RMA原因
								@RequestParam("RmaDate")Date RmaDate, 
								@RequestParam("Fk_warrantyInfoid")Integer Fk_warrantyInfoid, 
								Model m) throws MessagingException {
							RmaBean Rma = new RmaBean(); //set物件
							Rma.setProductId(productId);
							System.out.println("productId"+ productId);
							System.out.println("RMAreason()"+ RMAreason);
							Optional<RmaBean> Rma1 = rmaService.findproductid(Rma); //帶入值比對資料庫  不存在回傳null
							System.out.println("Rma1顯示==="+Rma1); //回傳結果
							if(Rma1==null) {		
								Rma.setProcessingStatus(0);//處理狀態
								Rma.setReceiveproduct(null); //處理日期
								Rma.setProductId(productId);	
//								Rma.setRmaId(3);//編號
								Rma.setRmadate(RmaDate); //RMA申請日期
								int r = 0;
								r = (int)(Math.random()*1000000000);
								System.out.println("r===="+r);
								Rma.setRmanumber(r); //RMA 單號   2021 + 亂數產生6碼
								Rma.setRMAreason(RMAreason);  //保固結束日 NEW DATE
								Rma.setSendoutaddress(sendoutaddress);//會員打的寄送地
								Rma.setSendoutdate(null);//回 寄出日期  按鈕更新產生
								Rma.setShipmentnumber(null);//物流單號  按鈕處理完畢產生 SET
								
								Rma.setWarrantyBean(warrService.findByWarrantyInfoId(Fk_warrantyInfoid));
								System.out.println("Rma1()========="+Rma);
								
								rmaService.updateRma(Rma);
								
								//mail
								MimeMessage mimeMessage = mailSender.createMimeMessage();
								MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
								mimeMessageHelper.setTo(to);
								mimeMessageHelper.setFrom(from);
								mimeMessageHelper.setSubject("Bag RMA申請核可通知信");
								StringBuilder sb = new StringBuilder();
								sb.append("<html><head></head>");
								sb.append("<body><h1>Bag RMA申請核可通知信</h1><p>尊貴的顧客，您好" +"<br> 收到此郵件表示您所申請的RMA已經被BAG 核可了。" 
										+" RMA摘要︰<br>" + "RMA單號：" + r  +"<br> 您的產品序列號： "+productId
										+ "<br>產品簽收與入系統的過程，可能需要花點時間，系統狀態才會呈現 收到，尚請耐心等待。"+ "<br> <br>裝運注意事項：<br>" 
										+ "請務必包裝完整及標明下列資訊：<br> 106台北市大安區信義路三段153號 3樓 <br> BAG - RMA部門 收。<br> <br>當我們收到您的產品時，我們會馬上進行處理並且在7個工作日內歸還。"
										+ "<br>如果您有任何問題或者需要幫助，請聯繫我們的客服中心：Email : buyagain134@gmail.com"
										+ "<br>或者透過免付費電話： 02 6631 8168</p>");
								sb.append("<img src=\"cid:imageId\"/></body>");
								sb.append("</html>");
								mimeMessageHelper.setText(sb.toString(), true);
								
								FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
								mimeMessageHelper.addInline("imageId",img);
							
								mailSender.send(mimeMessage);
								
								return "RmaSuccess";		
							}
								return "RmaFail"; //存在 重複 重複註冊	
							};

					
							
							//管理員完成處理RMA
							@PostMapping("/Rmafinish1.controller")
							public String daletewarranty2(
									@RequestParam("id") Integer rmaId,
									@RequestParam("date1") Date date1,
//									@RequestParam("processingStatus") Integer processingStatus,
									
									Model m){

								System.out.println("(RmaIDDDDDDDDDDDDDDDDDDsDDDDDDDDDDDD)=========="+ rmaId);
								System.out.println(date1);
								RmaBean Rma = rmaService.findRmabean(rmaId); //set物件
								
//								System.out.println("(Rmafinish1.controller 按鈕)=========="+ Rma);
								Integer status = Rma.getProcessingStatus();
								System.out.println("(status )=========="+ status);
								if(status.equals(0)) {
									System.out.println("test1----------------------------------------");
									Rma.setRmaId(rmaId);
									Rma.setProcessingStatus(1);//處理狀態
									Rma.setReceiveproduct(date1);//收到日

									System.out.println("test2----------------------------------------");
//						
									rmaService.updateRma(Rma);
									System.out.println("test3----------------------------------------");
									return "redirect:/RMAFINDALL.controller";	
								}
								if(status.equals(1)) {
								
								Rma.setProcessingStatus(2);//處理狀態	
								int r = 0;
								r = (int)(Math.random()*1000000000);
								Rma.setShipmentnumber(r);
								Rma.setSendoutdate(date1);//回 寄出日期  按鈕更新產生
								rmaService.updateRma(Rma);
								System.out.println("(Rma2)=========="+ Rma);
								return "redirect:/RMAFINDALL.controller";	
								};
								return "redirect:/RMAFINDALL.controller";	
							};

		
				
};