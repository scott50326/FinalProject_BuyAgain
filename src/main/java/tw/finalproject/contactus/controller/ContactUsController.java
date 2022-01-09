package tw.finalproject.contactus.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.contactus.model.ContactUsBean;
import tw.finalproject.contactus.model.ContactUsService;

@Controller
public class ContactUsController {

	@Autowired
	private ContactUsService cuService;

	@GetMapping("/contactUs")
	public String contactUsAction() {
		return "contactUs";
	}

	@GetMapping("/viewContactUs")
	public String backContactUsAction() {
		return "viewContactUs";
	}

	// 新增(ajax)
	@PostMapping("/contactUsInsert.controller")
	@ResponseBody
	public ContactUsBean processCUInsert(@RequestBody ContactUsBean cus) {
		return cuService.insert(cus);
	}
	
	// 客服回覆(ajax)
	@PostMapping("/contactUsInsert2.controller")
	@ResponseBody
	public ContactUsBean processCUInsert2(@RequestBody ContactUsBean cus) {
		cus.setResponseDate(new Date());
		cus.setConfirm(1);
		return cuService.update(cus);
	}

	// 找全部
	@GetMapping(path = "/contactUsfindall.controller")
	public String processContactUsFindAll(Model m) {
		List<ContactUsBean> contactUs = cuService.findAll();
		m.addAttribute("allcontactUs", contactUs);
		return "backController_contactUs";
	}

	// 單筆查詢(未處理)
	@GetMapping("/CUfindById.controller")
	public String processCUfindById(@RequestParam("contactUsId") Integer id, Model m) {
		ContactUsBean ContactUs = cuService.findById(id);
		m.addAttribute("contactUs", ContactUs);
		return "viewContactUs";
	}
	
	// 單筆查詢(已處理)
	@GetMapping("/checkContactUs.controller")
	public String processcheckContactUs(@RequestParam("contactUsId") Integer id, Model m) {
		ContactUsBean ContactUs = cuService.findById(id);
		m.addAttribute("contactUs", ContactUs);
		return "checkContactUs";
	}
	
//	//修改(回覆)
//	@PostMapping("/contactUpdate.controller")
//	public String processCUUpdate(@RequestParam("contactUsId") Integer contactUsId, @RequestParam("name") String name,
//			@RequestParam("email") String email, @RequestParam("title") String title,
//			@RequestParam("content") String content, @RequestParam("registerDate") String registerDate) throws Exception {
//		
//		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.sss");
//		Date date = f.parse(registerDate);
//		
//		ContactUsBean cus = new ContactUsBean();
//		cus.setContactUsId(contactUsId);
//		cus.setName(name);
//		cus.setEmail(email);
//		cus.setTitle(title);
//		cus.setContent(content);
//		cus.setConfirm(1);
//		cus.setRegisterDate(date);
//		cuService.update(cus);
//		
//		return "redirect:/contactUsfindall.controller";
//	}
}
