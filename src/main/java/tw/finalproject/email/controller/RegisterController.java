package tw.finalproject.email.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.swing.Spring;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.email.model.IEmailSenderService;
import tw.finalproject.email.model.RandomString;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;


@Controller
public class RegisterController {

	final String requestPath = "/confirmedMail";
	
	IEmailSenderService senderService;
	
	@Autowired
	private MemberService memService;
	
	private String savePathid;
	
	@Autowired
	public RegisterController(IEmailSenderService senderService) {
		this.senderService = senderService;
	}
	
	// 忘記密碼頁面
	@GetMapping("/retrievePassword.controller")
	public String processMemberRegister() {
		return "retrievePassword";
	}
	
	@PostMapping("/register")
	public String register(
			@RequestParam("picture") MultipartFile picture, @RequestParam("userId") String userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email,
			Model model, HttpSession session
			) {
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
		
		if (userId == null || userId.length() == 0) {
			errors.put("uid", "※ 帳號不得為空");
		}
		if ( password == null || password.length() == 0) {
			errors.put("pwd", "※ 密碼不得為空");
		}
		if ( name == null || name.length() == 0) {
			errors.put("na", "※ 姓名不得為空");
		}
		if (birthday == null || birthday.length() == 0) {
			errors.put("bi", "※ 生日不得為空");
		}
		if (phone == null || phone.length() == 0) {
			errors.put("ph", "※ 電話不得為空");
		}
		if (address== null || address.length() == 0) {
			errors.put("ad", "※ 地址不得為空");
		}
		if (email == null || email.length() == 0) {
			errors.put("em", "※ 信箱不得為空");
		}
		
		if (errors != null && !errors.isEmpty()) {
			return "memberRegister";
		}
		
		MemberBean check = memService.findCheckId(userId);
		if (check != null) {
			errors.put("uid", "※ 帳號已被註冊");			
			return "memberRegister";
		} 
		
		Map<String, Object> memberRegisterInfo = new HashMap<>();
		memberRegisterInfo.put("picture", picture);
		memberRegisterInfo.put("userId", userId);
		memberRegisterInfo.put("password", password);
		memberRegisterInfo.put("name", name);
		memberRegisterInfo.put("birthday", birthday);
		memberRegisterInfo.put("phone", phone);
		memberRegisterInfo.put("address", address);
		memberRegisterInfo.put("email", email);
		
		session.setAttribute("memberRegisterInfo", memberRegisterInfo);
		// 註冊的前置作業，你要自行完成
		// 假設前端會送一Email Address來後端，本範例將假設放在參數：emailAddress內
		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
		if (map == null) {
			map = new HashMap<>();
			session.setAttribute("randomCode", map);
		}
		RandomString rs = new RandomString(50);
		String random = rs.nextString();
		map.put(random, random);
		System.out.println("random=" + random);
		String link = "https://localhost:8080" + requestPath + "/" + random;
		senderService.sendEmail(email, "Buy_again會員驗證", "請於30分鐘內按下列超連結以驗證會員: " + 
		        link + "<br>");
		model.addAttribute("emailAddress", email);
		return "/memberRegisterConfirm";
		}
		
	
	
	

	@GetMapping("/confirmedMail/{random}")
	public String confirm(Model m, HttpSession session, 
			@PathVariable String random) throws IllegalStateException, IOException {
		String result = null;
		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
		if (map == null) {
			result = "電子郵件地址認證失敗，Session不存在";
		} else {
			String value = map.get(random);
			if (value != null && value.equals(random) ) {
				result = "電子郵件地址認證成功，random=" + random ;
			}
		}
		System.out.println("result=" + result);
		m.addAttribute("result", result);
		
		Map<String, Object> memberRegisterInfo = (Map<String, Object>) session.getAttribute("memberRegisterInfo");
		MultipartFile picture = (MultipartFile) memberRegisterInfo.get("picture");
		String userId = (String) memberRegisterInfo.get("userId");
		String password = (String) memberRegisterInfo.get("password");
		String name = (String) memberRegisterInfo.get("name");
		String birthday = (String) memberRegisterInfo.get("birthday");
		String phone = (String) memberRegisterInfo.get("phone");
		String address = (String) memberRegisterInfo.get("address");
		String email = (String) memberRegisterInfo.get("email");
		
		String fileName = picture.getOriginalFilename();
		if (fileName.trim().length() != 0) {
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile); // 檔案上傳
		} else {
			savePathid = "defaultpicture.jpg";
		}

		MemberBean mbBean = new MemberBean();
		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setName(name);
		mbBean.setBirthday(birthday);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);
		mbBean.setImg(savePathid);

		memService.insertMember(mbBean);
		
		return "redirect:/memberregistersuccess.controller";
	}
	
	@GetMapping("/memberregistersuccess.controller")
	public String memberRegisterSuccessController() {
		return "memberRegisterSuccess";
	}
	
	//信箱訂閱
	@PostMapping("/register1")
	public String register1(@RequestParam("email") String email,
			Model model, HttpSession session
			) {
		
		Map<String, Object> memberRegisterInfo = new HashMap<>();
		memberRegisterInfo.put("email", email);
		
		session.setAttribute("memberRegisterInfo", memberRegisterInfo);
		// 註冊的前置作業，你要自行完成
		// 假設前端會送一Email Address來後端，本範例將假設放在參數：emailAddress內
//		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
//		if (map == null) {
//			map = new HashMap<>();
//			session.setAttribute("randomCode", map);
//		}
//		RandomString rs = new RandomString(50);
//		String random = rs.nextString();
//		map.put(random, random);
//		System.out.println("random=" + random);
//		String link = "http://localhost:8080" + requestPath + "/" + random;
		senderService.sendEmail(email, "Buy_again感謝您的訂閱", "");
		model.addAttribute("emailAddress", email);
		return "/emailSuccess";
	}
	
	//忘記密碼
	@PostMapping("/register2")
	public String register2(@RequestParam("email") String email,Model model, HttpSession session) {
		
		Map<String, Object> memberRegisterInfo = new HashMap<>();
		memberRegisterInfo.put("email", email);
		
		MemberBean pwemail = memService.findEmail(email);
		if(pwemail == null) {
			Map<String, String> errors = new HashMap<String, String>();
			errors.put("mail", "※ 無此信箱");
			model.addAttribute("errors", errors);
			return "retrievePassword";
			
		}
		
		pwemail.setPassword(RandomStringUtils.randomAlphabetic(10));
		memService.updateMember(pwemail);		
		String pw = pwemail.getPassword();
		
		session.setAttribute("memberRegisterInfo", memberRegisterInfo);

		senderService.sendEmail(email, "忘記密碼", "請用這組密碼重新登入"+pw);
		model.addAttribute("emailAddress", email);
		return "/pwemailSuccess";
	}
	
	//
	@PostMapping("/registerContactUs")
	@ResponseBody
	public Boolean registerContactUs(@RequestBody Map<String, Object> us,
			Model model, HttpSession session
			) {
		 String email = us.get("email").toString();
		 String responseTitle = us.get("responseTitle").toString();
		 String responseContent = us.get("responseContent").toString();
				
		Map<String, Object> memberRegisterInfo = new HashMap<>();
		memberRegisterInfo.put("email", email);
		
		session.setAttribute("memberRegisterInfo", memberRegisterInfo);

		senderService.sendEmail(email,responseTitle, responseContent);
		model.addAttribute("emailAddress", email);
		return true;
	}
	
}
