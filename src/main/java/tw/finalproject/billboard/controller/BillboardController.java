package tw.finalproject.billboard.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.finalproject.billboard.model.BillboardBean;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.manager.model.ManagerService;

@Controller
public class BillboardController {

	@Autowired
	private BillboardService bbService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ManagerService mngService;

	@GetMapping("/findallbillboards.controller")
	public String processFindAll(Model m) {

		List<BillboardBean> billboards = bbService.findAll();
		m.addAttribute("allbillboards", billboards);

		return "backController_billboard";
	}
	
	
	@GetMapping("/insertbillboard.controller")
	public String insertBillboard() {
		return "billboardInsert";
	}

	@PostMapping("/insertbillboard2.controller")
	public String insertBillboard2(
			@RequestParam("publisher") String publisher,
			@RequestParam("content") String content, Model m
			) {
		
		BillboardBean bbBean = new BillboardBean();
		bbBean.setPublisher(publisher);
		bbBean.setContent(content);
		
		ManagerBean mngBean = mngService.findByName(publisher);
		bbBean.setManagerBean(mngBean); // 做關聯
		
		bbService.insertBillboard(bbBean);
		
		if (session.getAttribute("mngLogin") != null) {
			return "redirect:/findallbillboards.controller";
		}
		return "homepage";
	}
	
	
	@GetMapping("/deletebillboard.controller")
	public String deleteBillboard(@RequestParam("billboardId") Integer id, Model m) {
		bbService.deleteById(id);
		return "forward:/findallbillboards.controller";
	}

	@GetMapping("/updatebillboard.controller")
	public String updateBillboard(@RequestParam("billboardId") Integer id, Model m) {
		BillboardBean bb = bbService.findById(id);
		m.addAttribute("billboard", bb);
		
		return "billboardUpdate";
	}
	
	@PostMapping("/updatebillboard2.controller")
	public String updateBillboard2(
			@RequestParam("billboardId") Integer billboardId,
			@RequestParam("publisher") String publisher, 
			@RequestParam("content") String content, 
			@RequestParam("lastUpdateManager") String lastUpdateManager, Model m
			) {
		
		BillboardBean bbBean = bbService.findById(billboardId);
		bbBean.setContent(content);
		bbBean.setLastUpdateManager(lastUpdateManager);
		bbBean.setLastUpdateTime(new Date());
		
		ManagerBean mngBean = mngService.findByName(lastUpdateManager);
		bbBean.setManagerBean2(mngBean); // 做關聯
		
		bbService.updateBillboard(bbBean);
		
//		Set<BillboardBean> billboards = mngBean.getBillboards();
//		billboards.add(bbBean);
//		mngService.updateManager(mngBean); // 做關聯
		
		return "redirect:/findallbillboards.controller";
		
	}
	

}
