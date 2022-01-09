package tw.finalproject.chat_list.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.finalproject.chat_content_list.model.Chat_Content_ListBean;
import tw.finalproject.chat_content_list.model.Chat_Content_ListService;
import tw.finalproject.chat_list.model.Chat_ListBean;
import tw.finalproject.chat_list.model.Chat_ListService;
import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;

@Controller
@SessionAttributes(names = { "memberCl,memlogin,lu,list" })
public class Chat_ListController {

	@Autowired
	private Chat_ListService clService;

	@Autowired
	private Chat_Content_ListService cclService;

	@Autowired
	private ManagerService mngService;

	// 線上客服頁面
	@GetMapping("/onlineCustomerService.controller")
	public String contactOCSAction() {
		return "onlineCustomerService";
	}

	// 管理員客服頁面
	@GetMapping("/backController_onlineCustomerService.controller")
	public String backController_onlineCustomerServiceAction() {
		return "backController_onlineCustomerService";
	}

	// 常見Q&A頁面
	@GetMapping("/commonProblem.controller")
	public String contactOPAction() {
		return "commonProblem";
	}

	// 新增(ajax)
	@PostMapping("/ajax.controller")
	@ResponseBody
	public Chat_ListBean ajaxCUBInsert(@RequestBody Map<String, Object> clb, Model m) {

		Chat_ListBean cl = new Chat_ListBean();
		cl.setCl_ml_id(Integer.parseInt(String.valueOf(clb.get("cl_ml_id"))));

		Chat_Content_ListBean ccl = new Chat_Content_ListBean();
		ccl.setCcl_content(String.valueOf(clb.get("ccl_content")));
		ccl.setCcl_type(String.valueOf(clb.get("ccl_type")));
		ccl.setChat_listBean(cl);

		List<Chat_Content_ListBean> accl = new ArrayList<>();
		accl.add(ccl);
		cl.setChat_content_listBean(accl);
		return clService.insert(cl);
	}


	// 會員查詢
	@GetMapping("/selectcontonlineCustomerServiceInsert.controller")
	public String selectOCS(@RequestParam(value = "cl_ml_id") Integer cl_ml_id, Model m) {
		List<Chat_ListBean> lu = clService.findChat_List(cl_ml_id);
		if (lu != null) {
			for (int i = 0; i < lu.size(); i++) {
				lu.get(i).getChat_content_listBean().get(0).getCcl_content();
			}
			
			Chat_ListBean chat_ListBean = clService.findChat_List_Mag_Inquire(cl_ml_id);
			m.addAttribute("chat_ListBean", chat_ListBean);
			m.addAttribute("lu", lu);
			return "onlineCustomerService";
		}
		return "onlineCustomerService";
	}

	// 管理員總攬
	@GetMapping("/selectOCSfindAll.controller")
	public String selectOCSfindAll(Model m) {
		List<Chat_ListBean> list = clService.findChat_List_Mag();
		m.addAttribute("list", list);
		return "backController_onlineCustomerService";
	}

	// 管理員查詢
	@GetMapping("/selectcontonlineCustomerServiceInsert2.controller")
	public String selectOCSManager(@RequestParam("cl_ml_id") Integer cl_ml_id, Model m) {
		List<Chat_ListBean> list = clService.findChat_List_Mag();
		m.addAttribute("list", list);

		List<Chat_ListBean> lu = clService.findChat_List(cl_ml_id);
		if (lu != null) {
			for (int i = 0; i < lu.size(); i++) {
				lu.get(i).getChat_content_listBean().get(0).getCcl_content();
			}
			m.addAttribute("lu", lu);
			m.addAttribute("cl_ml_id", cl_ml_id);
			return "backController_onlineCustomerService2";
		}
		return "backController_onlineCustomerService2";
	}

	// 新增(ajax)
	@GetMapping("/ajaxCUBtype.controller")
	@ResponseBody
	public List<Chat_ListBean> ajaxCUBtype(@RequestParam("cl_ml_id") Integer cl_ml_id, Model m) {
		List<Chat_ListBean> cs = clService.findChat_ListBean_type(cl_ml_id);
//		List<Chat_ListBean> list = clService.findAll();
		return cs;
	}

	// 評分(ajax)
	@PostMapping("/MemSpstar.controller")
	@ResponseBody
	public Integer MemSpstar(@RequestBody Map<String, Object> mag, Model m) {
		String ccl_type = mag.get("ccl_type").toString();
		Integer good = Integer.valueOf((String) mag.get("good"));
		ManagerBean managerBean = mngService.findManagerBeanByUserId(ccl_type);

		Integer go = managerBean.getStars();
		Integer sum = go + good;
		managerBean.setScoreCount(managerBean.getScoreCount()+1);
		managerBean.setStars(sum);
		mngService.updateManager(managerBean);

		return good;
	}
}
