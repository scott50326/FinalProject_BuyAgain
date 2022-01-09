package tw.finalproject.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;

@Controller
@SessionAttributes(names = { "memlogin" })
public class MemberLoginController {

	@Autowired
	private MemberService memService;

	@Autowired
	private HttpSession session;

	@RequestMapping(path = "/memberlogin.controller", method = RequestMethod.GET)
	public String processMainPageAction() {

		if (session.getAttribute("memlogin") != null) {
			return "loginSuccess";
		}

		return "memberLogin";
	}

	@RequestMapping(path = "/memberchecklogin.controller", method = RequestMethod.POST)
	public String processAction(@RequestParam("userId") String user, @RequestParam("userPwd") String pwd, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (user == null || user.length() == 0) {
			errors.put("name", "請輸入帳號");
		}

		if (pwd == null || pwd.length() == 0) {
			errors.put("pwd", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "memberLogin";
		}

		MemberBean memBean = new MemberBean();
		memBean.setUserId(user);
		memBean.setPassword(pwd);
		MemberBean account = memService.findByUserId(memBean);


		if (account != null) {
			m.addAttribute("memlogin", account);
			return "memberLoginSuccess";
		} else {
			errors.put("msg", "帳號密碼有誤");
			return "memberLogin";
		}

		
//		return "memberLogin";
		
		
//		return null;

	}

}
