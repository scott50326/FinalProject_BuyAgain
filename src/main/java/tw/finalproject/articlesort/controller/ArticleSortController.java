package tw.finalproject.articlesort.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.article.model.ArticleBean;
import tw.finalproject.articlesort.model.ArticleSortBean;
import tw.finalproject.articlesort.model.ArticleSortService;
import tw.finalproject.billboard.model.BillboardBean;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.manager.model.ManagerBean;

@Controller
public class ArticleSortController {

	@Autowired
	private ArticleSortService atcsService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;

//	@GetMapping("/findallarticlesorts.controller")
//	public String processFindAll(Model m) {
//
//		List<ArticleSortBean> articlesorts = atcsService.findAll();
//		m.addAttribute("allarticlesort", articlesorts);
//
//		return "backController_billboard";
//	}
	
	
//	@GetMapping("/insertbillboard.controller")
//	public String insertBillboard() {
//		return "billboardInsert";
//	}

	@PostMapping("/insertarticlesort2.controller")
	@ResponseBody
	public ArticleSortBean insertArticleSort2(
			@RequestBody HashMap<String, String> param
			) {
		
		ArticleSortBean atcsBean = new ArticleSortBean();
		atcsBean.setSortName(param.get("sortName"));
		
		ArticleSortBean atcsB = atcsService.insertArticleSort(atcsBean);
		
		return atcsB;
	}
	
	
//	@GetMapping("/deletebillboard.controller")
//	public String deleteBillboard(@RequestParam("billboardId") Integer id, Model m) {
//		pdsService.deleteById(id);
//		return "forward:/findallbillboards.controller";
//	}
//
//	@GetMapping("/updatebillboard.controller")
//	public String updateBillboard(@RequestParam("billboardId") Integer id, Model m) {
//		BillboardBean bb = pdsService.findById(id);
//		m.addAttribute("billboard", bb);
//		
//		return "billboardUpdate";
//	}
//	
//	@PostMapping("/updatebillboard2.controller")
//	public String updateBillboard2(
//			@RequestParam("billboardId") Integer billboardId,
//			@RequestParam("publisher") String publisher, 
//			@RequestParam("content") String content, 
//			@RequestParam("lastUpdateManager") String lastUpdateManager, Model m
//			) {
//		
//		BillboardBean bbBean = pdsService.findById(billboardId);
//		bbBean.setContent(content);
//		bbBean.setLastUpdateManager(lastUpdateManager);
//		bbBean.setLastUpdateTime(new Date());
//		
//		ManagerBean mngBean = mngService.findByName(lastUpdateManager);
//		bbBean.setManagerBean2(mngBean); // 做關聯
//		
//		pdsService.updateBillboard(bbBean);
//		
////		Set<BillboardBean> billboards = mngBean.getBillboards();
////		billboards.add(bbBean);
////		mngService.updateManager(mngBean); // 做關聯
//		
//		return "redirect:/findallbillboards.controller";
//		
//	}
	

}
