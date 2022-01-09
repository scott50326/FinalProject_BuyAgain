package tw.finalproject.productsort.controller;

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

import tw.finalproject.billboard.model.BillboardBean;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.productsort.model.ProductSortBean;
import tw.finalproject.productsort.model.ProductSortService;

@Controller
public class ProductSortController {

	@Autowired
	private ProductSortService pdsService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;

//	@GetMapping("/findallbillboards.controller")
//	public String processFindAll(Model m) {
//
//		List<BillboardBean> billboards = pdsService.findAll();
//		m.addAttribute("allbillboards", billboards);
//
//		return "backController_billboard";
//	}
	
	
//	@GetMapping("/insertbillboard.controller")
//	public String insertBillboard() {
//		return "billboardInsert";
//	}

	@PostMapping("/insertproductsort2.controller")
	@ResponseBody
	public ProductSortBean insertProductSort2(
			@RequestBody HashMap<String, String> param
			) {
		
		ProductSortBean pdsBean = new ProductSortBean();
		pdsBean.setSortName(param.get("sortName"));
		
		ProductSortBean pdsB = pdsService.insertProductSort(pdsBean);
		
		return pdsB;
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
