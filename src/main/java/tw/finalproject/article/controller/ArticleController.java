package tw.finalproject.article.controller;

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
import tw.finalproject.article.model.ArticleService;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.manager.model.ManagerService;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.order.model.OrderService;

@Controller
public class ArticleController {

	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ArticleService atcService;

	@GetMapping("/findallarticles.controller")
	public String processFindAll(Model m) {

		List<ArticleBean> articles = atcService.findAll();
		m.addAttribute("allarticles", articles);

		return "backController_article";
	}
	
	@GetMapping("/deletearticle.controller")
	public String deleteArticle(@RequestParam("articleId") Integer id, Model m) {
		atcService.deleteById(id);
		return "forward:/findallarticles.controller";
	}

	@GetMapping("/updatearticle.controller")
	public String updateOrder(@RequestParam("articleId") Integer id, Model m) {
		ArticleBean atcb = atcService.findById(id);
		m.addAttribute("article", atcb);
		
		return "articleUpdate2";
	}

}
