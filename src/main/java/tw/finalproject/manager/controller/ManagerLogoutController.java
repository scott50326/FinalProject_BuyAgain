package tw.finalproject.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@SessionAttributes(names = { "mngLogin" })
public class ManagerLogoutController {

	@GetMapping(path = "/managerlogout.controller")
	public String managerLogout(SessionStatus status) {
		// 要用 .setComplete 清除 session, 不能用以前對 HttpSession 的方法清除
		status.setComplete();

		System.out.println("Manager Logout Success !!");
		return "homepage";
	}
}
