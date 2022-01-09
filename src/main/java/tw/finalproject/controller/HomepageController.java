package tw.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.finalproject.billboard.model.BillboardBean;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.productsort.model.ProductSortBean;
import tw.finalproject.productsort.model.ProductSortService;

@Controller
public class HomepageController {

	@Autowired
	private BillboardService bbService;
	
	@Autowired
	private ProductSortService pdsService;

	@RequestMapping(path = "/homepage.controller", method = RequestMethod.GET)
	public String homepageAction(Model m) {

		List<BillboardBean> billboards = bbService.findAll();
		m.addAttribute("allbillboards", billboards);

		List<ProductSortBean> productSort = pdsService.findAll();
		m.addAttribute("allProductSort", productSort);
		
		return "homepage";
	}
	
}
