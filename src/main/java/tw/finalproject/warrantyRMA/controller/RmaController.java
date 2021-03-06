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

	// findALL RMA???????????????
			@GetMapping(path = "/RMAFINDALL.controller")
			public String RMAfindall2(Model m) {
				List<RmaBean> rmabean = rmaService.findallrma();
				System.out.println("RMA???????????????FINDALL===="+rmabean);
				m.addAttribute("rmabean", rmabean); 
	
				return "RmaInfofindall";
			};
	
	// ??????????????? RMA??????
	@PostMapping(path = "/updateRMa.controller")
//	@RequestMapping(path = "/updatewarranty.controller1", method = RequestMethod.POST)
	public String updateRma(@RequestParam("RmaInfoId") String id, Model m){
		List<RmaBean> maService = rmaService.findBRmaMember(id);

		m.addAttribute("rmaService", maService);//??????????????????????????? update
		System.out.println(maService);
		
		return "warrantyupdate";

	}

		//????????? ????????????
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
//			warranty.setFk_productId(fk_productId); //???????????????????????????
//			warranty.setFk_memberId(fk_memberid);//???????????????????????????
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
//			//////////////////??????
//				
//				// findALL ??????RMA??????
				@GetMapping(path = "/RMAfindMember.controller")
				public String WarrantyfindMember2(Model m) {
				
					MemberBean userid = (MemberBean)session.getAttribute("memlogin"); 
					
					
					
					if (session.getAttribute("memlogin") != null) {
						String memLogin = userid.getUserId();
						System.out.println(memLogin +"=TEST");
						List<RmaBean> rma = rmaService.findBRmaMember(memLogin);
						System.out.println("rma test ====="+rma);
						m.addAttribute("rma", rma);
						return "RMAInfoMEMBER"; // redirect: ????????????????????? server
					}
					
					return "memberLogin";
				};
//		
//
//		// findALL RMA????????????
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
//			// findALL ??????????????????
//						@GetMapping(path = "/rmainsert1.controller")
//						public String WarrantyInsert1(Model m) {
//
//							
//							if (session.getAttribute("memlogin") != null) {
//								return "RMAInsert"; // redirect: ????????????????????? server
//							}			
//							return "memberLogin";
//						};
//						
//				
////						};
//						
//						// ????????????RMA   ??????RMA???????????????
						@PostMapping(path = "/Rmainsert.controller")
						public String RmaInsert(
//								@RequestParam("userId") Integer userId,  /// id
								@RequestParam("productId")  String productId , // ????????????
								@RequestParam("sendoutaddress") String sendoutaddress, //????????????
								@RequestParam("RMAreason") String RMAreason, // RMA??????
								@RequestParam("RmaDate")Date RmaDate, 
								@RequestParam("Fk_warrantyInfoid")Integer Fk_warrantyInfoid, 
								Model m) throws MessagingException {
							RmaBean Rma = new RmaBean(); //set??????
							Rma.setProductId(productId);
							System.out.println("productId"+ productId);
							System.out.println("RMAreason()"+ RMAreason);
							Optional<RmaBean> Rma1 = rmaService.findproductid(Rma); //????????????????????????  ???????????????null
							System.out.println("Rma1??????==="+Rma1); //????????????
							if(Rma1==null) {		
								Rma.setProcessingStatus(0);//????????????
								Rma.setReceiveproduct(null); //????????????
								Rma.setProductId(productId);	
//								Rma.setRmaId(3);//??????
								Rma.setRmadate(RmaDate); //RMA????????????
								int r = 0;
								r = (int)(Math.random()*1000000000);
								System.out.println("r===="+r);
								Rma.setRmanumber(r); //RMA ??????   2021 + ????????????6???
								Rma.setRMAreason(RMAreason);  //??????????????? NEW DATE
								Rma.setSendoutaddress(sendoutaddress);//?????????????????????
								Rma.setSendoutdate(null);//??? ????????????  ??????????????????
								Rma.setShipmentnumber(null);//????????????  ???????????????????????? SET
								
								Rma.setWarrantyBean(warrService.findByWarrantyInfoId(Fk_warrantyInfoid));
								System.out.println("Rma1()========="+Rma);
								
								rmaService.updateRma(Rma);
								
								//mail
								MimeMessage mimeMessage = mailSender.createMimeMessage();
								MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
								mimeMessageHelper.setTo(to);
								mimeMessageHelper.setFrom(from);
								mimeMessageHelper.setSubject("Bag RMA?????????????????????");
								StringBuilder sb = new StringBuilder();
								sb.append("<html><head></head>");
								sb.append("<body><h1>Bag RMA?????????????????????</h1><p>????????????????????????" +"<br> ????????????????????????????????????RMA?????????BAG ????????????" 
										+" RMA?????????<br>" + "RMA?????????" + r  +"<br> ???????????????????????? "+productId
										+ "<br>??????????????????????????????????????????????????????????????????????????????????????? ??????????????????????????????"+ "<br> <br>?????????????????????<br>" 
										+ "?????????????????????????????????????????????<br> 106?????????????????????????????????153??? 3??? <br> BAG - RMA?????? ??????<br> <br>?????????????????????????????????????????????????????????????????????7????????????????????????"
										+ "<br>??????????????????????????????????????????????????????????????????????????????Email : buyagain134@gmail.com"
										+ "<br>?????????????????????????????? 02 6631 8168</p>");
								sb.append("<img src=\"cid:imageId\"/></body>");
								sb.append("</html>");
								mimeMessageHelper.setText(sb.toString(), true);
								
								FileSystemResource img = new FileSystemResource(new File("src/main/resources/static/images/Baglogo.jpg"));
								mimeMessageHelper.addInline("imageId",img);
							
								mailSender.send(mimeMessage);
								
								return "RmaSuccess";		
							}
								return "RmaFail"; //?????? ?????? ????????????	
							};

					
							
							//?????????????????????RMA
							@PostMapping("/Rmafinish1.controller")
							public String daletewarranty2(
									@RequestParam("id") Integer rmaId,
									@RequestParam("date1") Date date1,
//									@RequestParam("processingStatus") Integer processingStatus,
									
									Model m){

								System.out.println("(RmaIDDDDDDDDDDDDDDDDDDsDDDDDDDDDDDD)=========="+ rmaId);
								System.out.println(date1);
								RmaBean Rma = rmaService.findRmabean(rmaId); //set??????
								
//								System.out.println("(Rmafinish1.controller ??????)=========="+ Rma);
								Integer status = Rma.getProcessingStatus();
								System.out.println("(status )=========="+ status);
								if(status.equals(0)) {
									System.out.println("test1----------------------------------------");
									Rma.setRmaId(rmaId);
									Rma.setProcessingStatus(1);//????????????
									Rma.setReceiveproduct(date1);//?????????

									System.out.println("test2----------------------------------------");
//						
									rmaService.updateRma(Rma);
									System.out.println("test3----------------------------------------");
									return "redirect:/RMAFINDALL.controller";	
								}
								if(status.equals(1)) {
								
								Rma.setProcessingStatus(2);//????????????	
								int r = 0;
								r = (int)(Math.random()*1000000000);
								Rma.setShipmentnumber(r);
								Rma.setSendoutdate(date1);//??? ????????????  ??????????????????
								rmaService.updateRma(Rma);
								System.out.println("(Rma2)=========="+ Rma);
								return "redirect:/RMAFINDALL.controller";	
								};
								return "redirect:/RMAFINDALL.controller";	
							};

		
				
};