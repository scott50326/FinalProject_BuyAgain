package tw.finalproject.article.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.article.model.ArticleBean;
import tw.finalproject.article.model.ArticleService;
import tw.finalproject.articlesort.model.ArticleSortBean;
import tw.finalproject.articlesort.model.ArticleSortService;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;
import tw.finalproject.message.model.MessageService;

@Controller
//@RequestMapping("/article")
@SessionAttributes(names = { "totalPages", "totalElements", "memberimg", "searchtext" })
public class ArticleController2 {

	@Autowired
	private ArticleService articleService;

	@Autowired
	private ArticleSortService articleSortService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private HttpSession session;

	private String savePathid = null;

	@GetMapping("/mainarticle")
	public String processArticleMainAction() {
		return "articleQueryAll";
	}

	@GetMapping("/rulearticle")
	public String processArticleRuleAction() {
		return "articleQueryRULE";
	}

	@GetMapping("/cpuarticle")
	public String processArticleCpuAction() {
		return "articleQueryCPU";
	}

	@GetMapping("/ramarticle")
	public String processArticleRamAction() {
		return "articleQueryRAM";
	}

	@GetMapping("/mbarticle")
	public String processArticleMbAction() {
		return "articleQueryMB";
	}

	@GetMapping("/vgaarticle")
	public String processArticleVgaAction() {
		return "articleQueryVGA";
	}

	@GetMapping("/ssdarticle")
	public String processArticleSsdAction() {
		return "articleQuerySSD";
	}

	@GetMapping("/screenarticle")
	public String processArticleScreenAction() {
		return "articleQuerySCREEN";
	}

	@GetMapping("/keyboardarticle")
	public String processArticleKeyboardAction() {
		return "articleQueryKEYBOARD";
	}

	@GetMapping("/mousearticle")
	public String processArticleMouseAction() {
		return "articleQueryMOUSE";
	}

	@GetMapping("/toucharticle")
	public String processArticleTouchAction() {
		return "articleQueryTouch";
	}

//	@GetMapping("/insertarticle")
//	public String processMainInsertArticle() {
//		return "articleInsert";
//	}

	@GetMapping("/insertarticle2")
	public String processMainInsertArticle2() {
		return "articleInsert2";
	}

	@GetMapping("/loading")
	public String processLoading() {
		return "articleInsertLoading";
	}

//	@GetMapping("/userIdArticle")
//	public String processUseIdArticle() {
//		return "articleUserId";
//	}

	@GetMapping("/updatearticle")
	public String processMainUpdateArticle(@RequestParam("articleId") int articleId, ArticleBean articles, Model m) {
		m.addAttribute("articleId", articleId);
		m.addAttribute("articles", articles);
		return "articleUpdate";
	}

	@GetMapping("/updatearticle2")
	public String processMainUpdateArticle2(@RequestParam("articleId") int articleId, ArticleBean articles, Model m) {
		m.addAttribute("articleId", articleId);
		m.addAttribute("articles", articles);

		ArticleBean artBean = articleService.findById(articleId);

		m.addAttribute("artBean", artBean);
		return "articleUpdate3";
	}

	@PostMapping("/addarticle")
	@ResponseBody
	public Map<String, Object> processInsertArticles(@RequestBody HashMap<String, Object> articles, Model m,
			HttpSession session) {

		Map<String, Object> data = new HashMap<String, Object>();
		Map<String, String> errors = new HashMap<String, String>();
		data.put("errors", errors);
		m.addAttribute("data", data);

		String header = (String) articles.get("header");
		if (header == null || header.length() == 0) {
			errors.put("header", "標題必須輸入");
		}

		String content = (String) articles.get("content");
		if (content == null || content.trim().length() < 5) {
			errors.put("content", "內容必須輸入且超過5個字");
		}

		if (errors != null && !errors.isEmpty()) {
			return data;
		} else {

			ArticleBean atcBean = new ArticleBean();

			Integer sortId = Integer.parseInt((String) articles.get("sortId"));

			ArticleSortBean atcsBean = articleSortService.findById(sortId);

			MemberBean memBean = (MemberBean) session.getAttribute("memlogin");

			atcBean.setHeader((String) articles.get("header"));
			atcBean.setContent((String) articles.get("content"));
			atcBean.setMemberBean(memBean);
			atcBean.setName((String) articles.get("name"));
			atcBean.setArticleSortBean(atcsBean);

			ArticleBean articleBean = articleService.insertArticles(atcBean);
			data.put("articleBean", articleBean);

			return data;
		}

	}

	@GetMapping("/articlecontent")
	public String processArticleContent(@RequestParam("articleId") int articleId, Model m) {
		m.addAttribute("articleId", articleId);
		return "articleContent";
	}

	@GetMapping("/articlecontentupdate")
	public String processArticleContentUpdate(@RequestParam("articleId") int articleId, Model m) {
		m.addAttribute("articleId", articleId);
		return "articleContentUpdate";
	}

	@PostMapping("/querybyid/{articleId}")
	@ResponseBody
	public Map<String, Object> processFindByIdAction(@PathVariable("articleId") int articleId, Model m) {

		List<ArticleBean> list = articleService.findAll();

		for (ArticleBean article : list) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		ArticleBean articleBean = articleService.findById(articleId);

		Integer touch = articleBean.getTouch();

		articleBean.setTouch(touch + 1);

		articleService.insertArticle(articleBean);

		String memberimg = articleBean.getMemberBean().getImg();

//		m.addAttribute("memberimg", memberimg);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("articleBean", articleBean);
		map.put("memberimg", memberimg);

		return map;
	}

	@PostMapping("/querybypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryAllByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findAllArticlesByPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByOrderByRegisterDateDesc();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryRULEbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryRULEByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByRULEPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByRULEPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryCPUbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryCPUByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByCPUPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByCPUPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryRAMbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryRAMByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByRAMPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByRAMPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryMBbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryMBByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByMBPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByMBPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryVGAbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryVGAByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByVGAPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByVGAPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/querySSDbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQuerySSDByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findBySSDPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findBySSDPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/querySCREENbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQuerySCREENByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findBySCREENPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findBySCREENPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryKEYBOARDbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryKEYBOARDByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByKEYBOARDPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByKEYBOARDPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/queryMOUSEbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQueryMOUSEByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByMOUSEPage(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByMOUSEPage();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@PostMapping("/querytouchbypage/{pageNo}")
	@ResponseBody
	public Map<String, Object> processQuerytouchByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pagesize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pagesize);
		Page<ArticleBean> page = articleService.findByOrderByTouchDesc(pageable);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findByOrderByTouchDesc();

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;
	}

	@GetMapping("/deletearticle/{articleId}")
	@ResponseBody
	public void processDeleteArticle(@PathVariable("articleId") int articleId) {
		ArticleBean articleBean = articleService.findById(articleId);
		articleBean.setMemberBean(null);

		articleService.deleteArticles(articleId);
	}

	@PostMapping("/replacearticle")
	@ResponseBody
	public ArticleBean processUpdateArticle(@RequestBody HashMap<String, Object> articles, HttpSession session) {

		ArticleBean atcBean = new ArticleBean();

		Integer sortId = Integer.parseInt((String) articles.get("sortId"));

		ArticleSortBean atcsBean = articleSortService.findById(sortId);

		MemberBean memBean = (MemberBean) session.getAttribute("memlogin");

		atcBean.setArticleId(Integer.valueOf((String) articles.get("articleId")));
		atcBean.setHeader((String) articles.get("header"));
		atcBean.setContent((String) articles.get("content"));
		atcBean.setMemberBean(memBean);
		atcBean.setName((String) articles.get("name"));
		atcBean.setArticleSortBean(atcsBean);
		atcBean.setRegisterDate(new Date());

		return articleService.updateArticles(atcBean);
	}

	@GetMapping("/querybyuserId")
	public String processFindByMemberBean(Model m) {
		MemberBean tempBean = (MemberBean) session.getAttribute("memlogin");

		MemberBean memberBean = memberService.findByMemberId(tempBean.getMemberId());

		session.setAttribute("memlogin", memberBean);

		List<ArticleBean> list = memberBean.getArticles();

		for (ArticleBean article : list) {
			System.out.println(article.getHeader());
		}

		m.addAttribute("tempBean", tempBean);
		m.addAttribute("articles", list);

		return "articleUserId";
	}

	@PostMapping("/addarticle2")
	public String processInsertArticle2(@RequestParam("picture") MultipartFile picture,
			@RequestParam("header") String header, @RequestParam("name") String name,
			@RequestParam("content") String content, @RequestParam("sort") Integer sort, Model m)
			throws IllegalStateException, IOException {

		String fileName = picture.getOriginalFilename();

		if (fileName.trim().length() != 0) {
			String fileString = fileName.substring(fileName.lastIndexOf("."));

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/articleimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath);
			saveDirPathFile.mkdirs();

			String savePath = saveDirPath + UUID.randomUUID() + fileString;
			File savePathFile = new File(savePath);
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile);
		} else {
			savePathid = null;
		}
		Map<String, String> errors = new HashMap<String, String>();

		m.addAttribute("errors", errors);

		if (header == null || header.length() == 0) {
			errors.put("header", "標題必須輸入");
		}

		if (content == null || content.trim().length() < 5) {
			errors.put("content", "內文必須輸入且大於5個字");
		}

		if (errors != null && !errors.isEmpty()) {
			return "articleInsert2";
		} else {

			MemberBean memBean = (MemberBean) session.getAttribute("memlogin");

			ArticleSortBean sortBean = articleSortService.findById(sort);

			ArticleBean articleBean = new ArticleBean();
			articleBean.setImg1(savePathid);
			articleBean.setHeader(header);
			articleBean.setName(name);
			articleBean.setContent(content);
			articleBean.setMemberBean(memBean);
			articleBean.setArticleSortBean(sortBean);

			articleService.insertArticles(articleBean);

			return "articleInsertLoading";
		}
	}

	@PostMapping("/replacearticle2")
	public String processUpdateArticle2(@RequestParam("articleId") Integer articleId,
			@RequestParam("picture") MultipartFile picture, @RequestParam("header") String header,
			@RequestParam("name") String name, @RequestParam("content") String content,
			@RequestParam("sort") Integer sort, Model m) throws IllegalStateException, IOException {

		ArticleBean artBean = articleService.findById(articleId);

		System.out.println("1------" + artBean);
		m.addAttribute("artBean", artBean);

		String fileName = picture.getOriginalFilename();

		if (fileName.trim().length() != 0) {
			String fileString = fileName.substring(fileName.lastIndexOf("."));

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/articleimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath);
			saveDirPathFile.mkdirs();

			String savePath = saveDirPath + UUID.randomUUID() + fileString;
			File savePathFile = new File(savePath);
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile);
		} else {
			savePathid = artBean.getImg1();
		}

		Map<String, String> errors = new HashMap<String, String>();

		m.addAttribute("errors", errors);

		if (header == null || header.length() == 0) {
			errors.put("header", "標題必須輸入");
		}

		if (content == null || content.trim().length() < 5) {
			errors.put("content", "內文必須輸入且大於5個字");
		}

		if (errors != null && !errors.isEmpty()) {

			return "articleUpdate3";
		} else {

			ArticleBean Bean = articleService.findById(articleId);

			Integer touch = Bean.getTouch();

			MemberBean memBean = (MemberBean) session.getAttribute("memlogin");

			ArticleSortBean sortBean = articleSortService.findById(sort);

			Bean.setImg1(savePathid);
			Bean.setHeader(header);
			Bean.setName(name);
			Bean.setContent(content);
			Bean.setMemberBean(memBean);
			Bean.setArticleSortBean(sortBean);
			Bean.setRegisterDate(new Date());
			Bean.setTouch(touch);

			articleService.updateArticle(Bean);

			return "redirect:/querybyuserId";
		}
	}

	@GetMapping("/searchqueryByPage")
	public String gosearchList(@RequestParam("searchtext") String searchtext, Model m) throws SQLException {
		m.addAttribute("searchtext", searchtext);

		return "articleSearchResult";
	}

	@PostMapping("/searchqueryByPage/{pageNo}")
	@ResponseBody
	public Map<String, Object> searchQueryByPage(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 10;
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);

		String searchText = (String) m.getAttribute("searchtext");

		System.out.println("searchText:-----------------------------" + searchText);

		Page<ArticleBean> page = articleService.findHeaderPage(pageable, searchText);

		for (ArticleBean article : page) {
			article.setFk_sortId(article.getArticleSortBean().getSortId());
		}

		List<Integer> msgsizes = new ArrayList<Integer>();

		List<ArticleBean> list = articleService.findAllByHeaderContaining(searchText);

		for (ArticleBean article : list) {
			msgsizes.add(article.getMessages().size());
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("content", page.getContent());
		map.put("msgsizes", msgsizes);

		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		return map;

	}
}
