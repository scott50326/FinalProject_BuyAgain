package tw.finalproject.manager.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;

@Controller
@SessionAttributes(names = { "mngLogin" })
public class ManagerController {

	@Autowired
	private ManagerService mngService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;

	@GetMapping("/findallmanagers.controller")
	public String processFindAll(Model m) {

		List<ManagerBean> managers = mngService.findAll();
		m.addAttribute("allmanagers", managers);

		return "backController_manager";
	}
	
	
	@GetMapping("/insertmanager.controller")
	public String insertManager(Model m) {
		
		List<ManagerBean> managers = mngService.findAll();
		Integer lastId = (managers.get(managers.size() - 1)).getManagerId();
		Integer newId = lastId + 1;
		
		m.addAttribute("newId", newId);
		return "managerInsert";
	}

	@PostMapping("/insertmanager2.controller")
	public String insertManager2(
			@RequestParam("userId") String userId,
			@RequestParam("password") String password, 
			@RequestParam("name") String name
			) {
		ManagerBean mngBean = new ManagerBean();
		mngBean.setUserId(userId);
		mngBean.setPassword(password);
		mngBean.setName(name);
		
		mngService.insertManager(mngBean);
		
		if (session.getAttribute("mngLogin") != null) {
			
			return "redirect:/findallmanagers.controller";
		}
		return "homepage";
	}
	
	
	@GetMapping("/deletemanager.controller")
	public String deleteBillboard(@RequestParam("managerId") Integer id, SessionStatus status) {
		ManagerBean mngBean = mngService.findById(id);
		
		ManagerBean mngLoginBean = (ManagerBean) session.getAttribute("mngLogin");
		if (mngBean.getUserId().equals(mngLoginBean.getUserId())) {
			mngService.deleteById(id);
			status.setComplete(); // 清除 session 內的 mngLogin 登入帳戶
			return "managerDeleteSuccess"; // 刪除成功
		} else {
			return "managerDeleteFail"; // 沒刪除權限
		}
//		return "forward:/findallmanagers.controller";
	}

	@GetMapping("/updatemanager.controller")
	public String updateBillboard(@RequestParam("managerId") Integer id, Model m) {
		ManagerBean mngBean = mngService.findById(id);
		
		ManagerBean mngLoginBean = (ManagerBean) session.getAttribute("mngLogin");
		if (mngBean.getUserId().equals(mngLoginBean.getUserId())) {
			m.addAttribute("manager", mngBean);
			return "managerUpdate";
		} else {
			return "managerUpdateFail"; // 沒修改權限
		}
	}
	
	@PostMapping("/updatemanager2.controller")
	public String updateBillboard2(
			@RequestParam("managerId") Integer managerId,
			@RequestParam("userId") String userId, 
			@RequestParam("password") String password, 
			@RequestParam("name") String name, Model m
			) {
		
		ManagerBean bbBean = mngService.findById(managerId);
		bbBean.setUserId(userId);
		bbBean.setPassword(password);
		bbBean.setName(name);
		
		return "redirect:/findallmanagers.controller";
		
	}
	

}
