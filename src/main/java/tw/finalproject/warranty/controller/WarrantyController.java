package tw.finalproject.warranty.controller;

import java.io.File;
import java.io.IOException;
//import java.lang.reflect.Array;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
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
import org.springframework.mail.SimpleMailMessage;
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
import tw.finalproject.product.model.ProductService;
import tw.finalproject.productregister.model.ProductRegisterBean;
import tw.finalproject.productregister.model.ProductRegisterService;
import tw.finalproject.warranty.model.WarrantyBean;
import tw.finalproject.warranty.model.WarrantyService;

@Controller
//@ResponseBody
@SessionAttributes(names = { "memlogin", "mngLogin" })
public class WarrantyController {
	private String from = "scott50321@gmail.com";
	private String to = "scott50321@gmail.com";
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private WarrantyService warrantyService;
	@Autowired
	private ManagerService mngService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductRegisterService pdrgService;
	
	@Autowired
	private ProductService pdService;

	@Autowired
	private HttpSession session;

	// findALL 管理員入口
			@GetMapping(path = "/Warrantyfindall2.controller")
			public String Warrantyfindall2(Model m) {
//				List<WarrantyBean> mbb = warrantyService.findall();
//				m.addAttribute("allmbb", mbb);
				List<WarrantyBean> warranty = warrantyService.findMemberBuyInfoBeanName();
				System.out.println("管理員入口FINDALL"+warranty);
				m.addAttribute("warranty", warranty); //管理員入口
				
				
//				if (session.getAttribute("mngLogin") != null) {
//					return "forward:/W"; // redirect: 提出新的請求給 server
//				}
				
				return "warrantyInfofindall";
			};
	

	// findALL 管理員跳轉
		@GetMapping(path = "/Warrantyfindall.controller")
//		@RequestMapping(path = "/Warrantyfindall.controller", method = RequestMethod.POST)
		public String Warrantyfindall(Model m) {
			List<WarrantyBean> mbb = warrantyService.findall();
			m.addAttribute("allmbb", mbb);
			
			
			if (session.getAttribute("mngLogin") != null) {
				return "forward:/Warrantyfindall2.controller"; // redirect: 提出新的請求給 server
			}
			
			return "managerLogin";
		};



	// 管理員修改 找資料跳轉
	@GetMapping(path = "/updatewarranty.controller1")
//	@RequestMapping(path = "/updatewarranty.controller1", method = RequestMethod.POST)
	public String updatewarranty(@RequestParam("warrantyInfoId") Integer id, Model m){
		List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
		System.out.println(warranty);
		m.addAttribute("mbbb", warranty);//傳直回去的識別字串 update
		System.out.println(warranty);
		
		return "warrantyupdate";

	}

		
		@PostMapping(path = "/updatewarranty.controller2")
//		@RequestMapping(value = "/updatewarranty.controller2" , method = RequestMethod.POST )
		public String updatewarranty2(@RequestParam("warrantyInfoId")Integer warrantyInfoId,
				@RequestParam("registerStart") Date registerStart,
				@RequestParam("registerFinish") Date registerFinish,
				@RequestParam("registerStatus") Integer registerStatus ,
				@RequestParam("fk_productId") Integer fk_productId, 
				@RequestParam("fk_memberid") Integer fk_memberid,
				@RequestParam("pekoinvoice") String img,
				@RequestParam("pekoid") String registerid,
				Model m){
		
			 int resultdate = registerFinish.compareTo(registerStart);
		     System.out.println("resultdate============="+resultdate);
		    if(resultdate == 1) {
		    	System.out.println("字串===============1");
		    	WarrantyBean warranty = new WarrantyBean() ;
				warranty.setWarrantyInfoId(warrantyInfoId);
				warranty.setRegisterStatus(registerStatus);
				warranty.setProductBean(pdService.findById(fk_productId)); //多跳轉一層去做改動
				warranty.setMemberBean(memService.findById(fk_memberid));//多跳轉一層去做改動
				warranty.setRegisterStart(registerStart);
				warranty.setRegisterFinish(registerFinish);
				warranty.setInvoice(img);
				warranty.setRegisterid(registerid);
				warrantyService.updatewarranty(warranty);
				System.out.println(warranty);
				return "redirect:/Warrantyfindall2.controller";
		    }
		    else {
		    	return "warrantyupdateFail";
		    }
//			System.out.println("pekoimgpekoimg=" + img);
			
//		    return "forward:/Warrantyfindall2.controller";
		}


	//管理員刪除 註銷保固(保固狀態更改為0)
				@PostMapping("/deletewarranty.controller")
				public String daletewarranty2(
						@RequestParam("id") Integer id,
						@RequestParam("registerid") String registerid,
						@RequestParam("registerStatus")  Integer registerStatus,
						Model m) throws MessagingException{
					System.out.println("registerStatus()==="+registerStatus);
//				if(registerStatus.equals(1)) {
					
//					ArrayList<WarrantyBean> waa= new ArrayList<>();
//					waa.add(registerid);
//					
//					for( WarrantyBean dddaa  : waa) {
//						System.out.println("dddaa ===="+ dddaa);
//						System.out.println("waa ===="+ waa);
//					}
//					WarrantyBean wa = new WarrantyBean();
//					wa.setRegisterid(registerid);
//					Optional<WarrantyBean> warr = warrantyService.findregisterid(wa);
			
//					System.out.println("registerid1 ===="+ registerid1);
//					System.out.println("registerid1 ===="+ waa);
					
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
					mimeMessageHelper.setTo(to);
					mimeMessageHelper.setFrom(from);
					mimeMessageHelper.setSubject("Bag 註銷保固通知");
					StringBuilder sb = new StringBuilder();
					sb.append("<html><head></head>");
					sb.append("<body><h1>Bag 註銷保固通知</h1><p>尊貴的顧客，您好，經調查您帳戶之產品使用異常<br>違反BAG保固條款   "
							+"BAG已註銷您此筆產品保固，請登入BAG帳戶進行確認 "
							+ "<a href=\"https://https://localhost:8080/homepage.controller>登入帳戶</a><br>若有疑問請聯絡客服</p>");
					sb.append("<img src=\"cid:imageId\"/></body>");
					sb.append("</html>");
					mimeMessageHelper.setText(sb.toString(), true);
					
					FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
					mimeMessageHelper.addInline("imageId",img);
					
					mailSender.send(mimeMessage);
					
					System.out.println(id);
					warrantyService.update(id);
					return "redirect:/Warrantyfindall2.controller";
//				}
//				else {
//					return "redirect:/Warrantyfindall2.controller";
//					}
				}

				
			//////////////////會員
				
				// findALL 會員入口
				@GetMapping(path = "/WarrantyfindMember.controller2")
				public String WarrantyfindMember2(Model m) {
				
					MemberBean userid = (MemberBean)session.getAttribute("memlogin"); 
					String memLogin = userid.getUserId();
					System.out.println(memLogin +"=TEST");
					List<WarrantyBean> warranty = warrantyService.findmemberall(memLogin);
					System.out.println(warranty);
					m.addAttribute("warranty", warranty);
					
					
//					if (session.getAttribute("mngLogin") != null) {
//						return "forward:/W"; // redirect: 提出新的請求給 server
//					}
					
					return "warrantyInfoMEMBER";
				};
		

		// findALL 會員跳轉
			@GetMapping(path = "/WarrantyfindMember.controller1")
			public String WarrantyfindMember1(Model m) {
		
				
				
				if (session.getAttribute("memlogin") != null) {
					return "forward:/WarrantyfindMember.controller2"; // redirect: 提出新的請求給 server
				}
//				
				return "memberLogin";
			};
			
			
			// findALL 會員註冊跳轉
						@GetMapping(path = "/Warrantyinsert1.controller")
						public String WarrantyInsert1(Model m) {

							
							if (session.getAttribute("memlogin") != null) {
								return "warrantyMmeberInsertcheck"; // redirect: 提出新的請求給 server
							}			
							return "memberLogin";
						};
						
						
						// findALL 會員註冊序號確認
//						@GetMapping(path = "/Warrantyinsertcheck.controller")
						@RequestMapping(path = "/Warrantyinsertcheck.controller", method = RequestMethod.POST)
						public String WarrantyInsertcheck(
								@RequestParam("productid") String productid,  //接收JSP比對  註冊帳號
								@RequestParam("registerid") String registerid, //註冊序號
							
								Model m) {
							
							
//							OrderBean orderBean = new OrderBean();//test 資料SET進BEAN 比對order訂單序號 及購買日
//							orderBean.setProductserialnumber(registerid); // 序號
//							orderBean.setOrderDate(buytime); // 購買日期
//							System.out.println("orderBean======"+orderBean); //BEAN的資料
							
							ProductRegisterBean productRegisterBean = pdrgService.findByLicenseKey(registerid);
							
//							List<OrderBean> neworder = orderService.findserial(registerid);
//							System.out.println("neworder============================"+neworder);
//							List<OrderBean> orderinfo = orderService.findserial(registerid); // 比對值是否正確   序號
//							System.out.println("orderinfo回傳============="+orderinfo); // 回傳存在不存在 
//							System.out.println("orderinfo.get(2).equals(orderinfo)");
							
							m.addAttribute("productRegisterBean", productRegisterBean);//order屬性	$
							if(productRegisterBean == null) { //序號正確    設定購買者登入帳號SESSION  如果存在不等於NULL
						
//								List<OrderBean> mbb = orderService.findAll(); //TEST 整合 改成ORDER訂單							
//								List<OrderBean> ordermbb = orderService.findByregisterId(registerid); //帶序號 取得回傳fk_productId
//								System.out.println("mbb取出的值===="+mbb);
//								System.out.println("order取出的值="+ordermbb);

//								m.addAttribute("ordermbb", ordermbb); //此識別設定 註冊表格  fk_product欄位 購買類別?物品
								return "warrantyFail";					
							}	
//							else {
//								return "warrantyFail";
//							}
						
							return "warrantymemberInsert";  
						};
//						};
						
						// 會員註冊新增保固   //*比對warranty序號不重複
						@PostMapping(path = "/Warrantyinsert2.controller")
						public String WarrantyInsert2(
								@RequestParam("fk_member") Integer fk_memberid,  ///FK參數
								@RequestParam("fk_productorder")  Integer fk_productId ,
								@RequestParam("registerid") String registerid,
								@RequestParam("setTimestart") Date setTimestart, //註冊起始日 
								@RequestParam("setTimeEnd")Date setTimeEnd, //保固結束日
								@RequestParam("imgtest")String imgtest,
								Model m) throws MessagingException {
							System.out.println("setTimestart()====="+setTimestart);
							ProductRegisterBean productRegisterBean = pdrgService.findByLicenseKey(registerid);
							
							MemberBean memBean = (MemberBean) session.getAttribute("memlogin");
							Integer memId = memBean.getMemberId();
							String username = memBean.getName();
							MemberBean memberBean = memService.findByMemberId(memId);
							productRegisterBean.setMemberBean(memberBean);
							productRegisterBean.setRegisterDate(setTimestart);
							
							WarrantyBean warranty = new WarrantyBean(); //set物件
							warranty.setRegisterid(registerid);
							
							Optional<WarrantyBean> warranty1 = warrantyService.findregisterid(warranty); //帶入值比對資料庫  不存在回傳null
							System.out.println("warrantyService.findregisterid======" +warranty1);

							System.out.println("fk_memberid顯示LIST==="+fk_memberid); //回傳結果
							if(warranty1==null) {		
//								warranty.setWarrantyInfoId(warrantyInfoId);  //set主鍵 @Param
								warranty.setRegisterStatus(1);//SET保固狀態
								warranty.setProductBean(pdService.findById(fk_productId)); //多跳轉一層去做改動 外鍵 商品
								warranty.setMemberBean(memService.findById(fk_memberid));//多跳轉一層去做改動 外鍵 註冊者
								warranty.setInvoice("defaultpicture.jpg");
								warranty.setRegisterStart(setTimestart); //SET保固註冊日 
								warranty.setRegisterFinish(setTimeEnd);  //保固結束日 NEW DATE
								System.out.println("warranty bean====="+warranty);
								warrantyService.updatewarranty(warranty);	//save
								//mail
								MimeMessage mimeMessage = mailSender.createMimeMessage();
								MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
								mimeMessageHelper.setTo(to);
								mimeMessageHelper.setFrom(from);
								mimeMessageHelper.setSubject("Bag 感謝您的註冊");
								StringBuilder sb = new StringBuilder();
								sb.append("<html><head></head>");
								sb.append("<body><h1>Bag 感謝您的註冊</h1><p>尊貴的顧客 " + username +"<br> 感謝您使用序列號註冊您的 "
										+"BAG產品："+ registerid + " <br> 我們鼓勵您將購買證明（發票/收據）的副本上傳到您的BAG帳戶，<br>"
										+ "這將確保任何可用促銷或Rma保修更換請求的最快處理時間<br>，產品保固生效日 ：　"+ setTimestart +"，保固日期至：　" + setTimeEnd +"　截止。</p>");
								sb.append("<img src=\"cid:imageId\"/></body>");
								sb.append("</html>");
								mimeMessageHelper.setText(sb.toString(), true);
								
								FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
								mimeMessageHelper.addInline("imageId",img);
							
								mailSender.send(mimeMessage);
								
								    System.out.println("已發送註冊郵件");
								return "warrantySuccess";	//存在 重複 重複註冊		
							}
								return "warrantyError";
							};

							//發票頁面
							@GetMapping("/warrantyimg.controller")
							public String invoicelink(Model m , @RequestParam("warrantyInfoId") Integer id) {
								List<WarrantyBean> invoice = warrantyService.findBywarrantyId(id);
								Integer id1 = id ;
								m.addAttribute("invoice",id1);
								System.out.println("warranty="+invoice);
								List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
								System.out.println("LIST====================="+warranty);
								m.addAttribute("mbbb", warranty); 
								return "warrantyMemberImg";
							}
							//更新上傳發票
							@PostMapping(path ="/warrantyimg2.controller")
//							@RequestMapping(path = "/warrantyimg2.controller", method = RequestMethod.POST)
//						    @RequestMapping(path = "/warrantyimg2.controller",headers = "content-type=multipart/*", method = RequestMethod.POST) 
							public String invoiceUpdater(@RequestParam("warrantyInfoId") Integer id, @RequestParam("picture") MultipartFile picture , Model m) throws IllegalStateException, IOException {
							List<WarrantyBean> warranty = warrantyService.findBywarrantyId(id);
							String fileName = picture.getOriginalFilename();
							
							WarrantyBean mbBean = warrantyService.findByWarrantyInfoId(id);
							
							if (fileName.trim().length() != 0) { // 代表有重新上傳
								String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

								ClassPathResource resource = new ClassPathResource(
										"/src/main/webapp/WEB-INF/Buy_again/images/warrantyimages/");
								String saveDirPath = resource.getPath();

								File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
								saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

								String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
								File savePathFile = new File(savePath); // 儲存檔案
								String savePathid = savePathFile.getName();
								picture.transferTo(savePathFile); // 檔案上傳
								
								mbBean.setInvoice(savePathid); //存圖片路徑
								WarrantyBean waBean  = warrantyService.updatewarranty(mbBean);//update
								m.addAttribute("waBean", waBean);
								System.out.println("waBean(===)" + waBean);
							} else { // 沒重新上傳
								String savePathid = mbBean.getInvoice();
							}
							
								return "redirect:/WarrantyfindMember.controller2";
							}
						
							
							@GetMapping(path ="/FINDALLproductid.controller")
							public String findallproducid(Model m) {
								List<ProductRegisterBean> pdrg = pdrgService.findwarrantyregisterId();
			
								System.out.println("序號查詢入口FINDALL"+pdrg);
								m.addAttribute("pdrg", pdrg); //
														
//								if (session.getAttribute("mngLogin") != null) {
//									return "forward:/W"; // redirect: 提出新的請求給 server
//								}
								
								return "warrantyfindmemberbuyproductid";
							};
};