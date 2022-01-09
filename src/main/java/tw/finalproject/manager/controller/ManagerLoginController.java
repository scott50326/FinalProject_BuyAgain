package tw.finalproject.manager.controller;

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

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;

@Controller
@SessionAttributes(names = { "mngLogin" })
public class ManagerLoginController {

	@Autowired
	private ManagerService mngService;

	@Autowired
	private HttpSession session;

	@RequestMapping(path = "/managerlogin.controller", method = RequestMethod.GET)
	public String processMainPageAction() {

		if (session.getAttribute("mngLogin") != null) {
			return "backController";
		}

		return "managerLogin";
	}

	@RequestMapping(path = "/managerchecklogin.controller", method = RequestMethod.POST)
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
			return "managerLogin";
		}

		ManagerBean mngBean = new ManagerBean();
		mngBean.setUserId(user);
		mngBean.setPassword(pwd);
		ManagerBean account = mngService.findByUserId(mngBean);
		



		
		if (account != null) {
			m.addAttribute("mngLogin", account);
			return "backController";
		} else {
			errors.put("msg", "帳號密碼有誤");
			return "managerLogin";
		}

	}

}
