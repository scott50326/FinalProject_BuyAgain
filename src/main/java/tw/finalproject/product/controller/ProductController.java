package tw.finalproject.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.product.model.ProductBean;
import tw.finalproject.product.model.ProductService;
import tw.finalproject.productsort.model.ProductSortBean;
import tw.finalproject.productsort.model.ProductSortService;

@Controller
public class ProductController {

	@Autowired
	private ProductService pdService;
	
	@Autowired
	private ProductSortService pdsService;
	
	@Autowired
	ServletContext context;
		
	@Autowired
	private HttpSession session;
	
	private String savePathid = null;

	@GetMapping("/findallproducts.controller")
	public String processFindAll(Model m) {

		List<ProductBean> products = pdService.findAll();
		m.addAttribute("allProducts", products);
		
		List<ProductSortBean> productsorts = pdsService.findAll();
		m.addAttribute("allproductsorts", productsorts);

		return "backController_product";
	}
	
	@GetMapping("/findproductsbysort.controller")
	@ResponseBody
	public Map<String, Object> processFindProductsBySort(@RequestParam("sortId") Integer sortId, Model m) {
		System.out.println(sortId);
		ProductSortBean productsort = pdsService.findById(sortId);
		List<ProductBean> products = productsort.getProducts();
		
		Map<String, Object> sortandproducts = new HashMap<>();
		sortandproducts.put("sort", productsort);
		sortandproducts.put("products", products);
//		for(ProductBean product: products) {
//			product.setProductSortBean(null);
//		}
		return sortandproducts;
	}
	
	@GetMapping("/productregister.controller")
	public String processProductRegister() {
		return "product/productregister";
	}
	
	@GetMapping("/insertproduct.controller")
	public String insertProduct(Model m) throws IOException {
		
		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/productimages/defaultpicture.jpg");
		byte[] pic = IOUtils.toByteArray(is1);
		
		m.addAttribute("pic", pic);
		
		List<ProductSortBean> productsorts = pdsService.findAll();
		m.addAttribute("allproductsorts", productsorts);
		
		return "productInsert";
	}
	

	@PostMapping("/insertproduct2.controller")
	public String insertProduct2(
			@RequestParam("picture1") MultipartFile picture1,
			@RequestParam("picture2") MultipartFile picture2,
			@RequestParam("picture3") MultipartFile picture3,
			@RequestParam("name") String name, @RequestParam("sortId") Integer sortId, 
			@RequestParam("unitPrice") Integer unitPrice, @RequestParam("quantity") Integer quantity, 
			@RequestParam("content") String content, Model m
			) throws IllegalStateException, IOException {
		
		ProductSortBean pdsBean = pdsService.findById(sortId);
		
		ProductBean pdBean = new ProductBean();
		pdBean.setName(name);
		
		pdBean.setUnitPrice(unitPrice);
		pdBean.setQuantity(quantity);
		pdBean.setContent(content);
		pdBean.setProductSortBean(pdsBean);
		
		String fileName1 = picture1.getOriginalFilename();
		String fileName2 = picture2.getOriginalFilename();
		String fileName3 = picture3.getOriginalFilename();
		
		String[] fileNames = {fileName1, fileName2, fileName3};
		
		int i = 1;
		File savePathFile = null;
		for (String fileName : fileNames) {
			if (fileName.trim().length() != 0) {
				String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名
				
				ClassPathResource resource = new ClassPathResource("/src/main/webapp/WEB-INF/Buy_again/images/productimages/");
				String saveDirPath = resource.getPath();
				
				File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
				saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立
				
				String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
				savePathFile = new File(savePath); // 儲存檔案
				savePathid = savePathFile.getName();
			} else {
				savePathid = "defaultpicture.jpg";
			}
			if (i == 1) {
				picture1.transferTo(savePathFile); // 檔案上傳
				pdBean.setImg1(savePathid);
			} else if (i == 2) {
				picture2.transferTo(savePathFile); // 檔案上傳
				pdBean.setImg2(savePathid);
			} else if (i == 3) {
				picture3.transferTo(savePathFile); // 檔案上傳
				pdBean.setImg3(savePathid);
			}
			i++;
		}
		
		pdService.insertProduct(pdBean);
		
		if (session.getAttribute("mngLogin") != null) {
			return "redirect:/findallproducts.controller";
		}
		
		return "homepage";
	}
	
	
	@GetMapping("/deleteproduct.controller")
	public String deleteProduct(@RequestParam("productId") Integer id, Model m) {
		pdService.deleteById(id);
		System.out.println("delete success!!");
		return "forward:/findallproducts.controller";
	}

	@GetMapping("/updateproduct.controller")
	public String updateProduct(@RequestParam("productId") Integer id, Model m) throws IOException {
		ProductBean pd = pdService.findById(id);
		m.addAttribute("product", pd);
		
		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/productimages/" + pd.getImg1());
		byte[] pic1 = IOUtils.toByteArray(is1);
		InputStream is2 = context.getResourceAsStream("/WEB-INF/Buy_again/images/productimages/" + pd.getImg2());
		byte[] pic2 = IOUtils.toByteArray(is2);
		InputStream is3 = context.getResourceAsStream("/WEB-INF/Buy_again/images/productimages/" + pd.getImg3());
		byte[] pic3 = IOUtils.toByteArray(is3);
		
		m.addAttribute("pic1", pic1);
		m.addAttribute("pic2", pic2);
		m.addAttribute("pic3", pic3);
		
		List<ProductSortBean> productsorts = pdsService.findAll();
		m.addAttribute("allproductsorts", productsorts);
		
		return "productUpdate";
	}
	
	@PostMapping("/updateproduct2.controller")
	public String updateProduct2(
			@RequestParam("picture1") MultipartFile picture1,
			@RequestParam("picture2") MultipartFile picture2,
			@RequestParam("picture3") MultipartFile picture3,
			@RequestParam("productId") Integer productId,
			@RequestParam("name") String name, @RequestParam("sortId") Integer sortId, 
			@RequestParam("unitPrice") Integer unitPrice, @RequestParam("quantity") Integer quantity, 
			@RequestParam("buyCount") Integer buyCount, @RequestParam("content") String content, 
			@RequestParam("clickCount") Integer clickCount, @RequestParam("onSale") Integer onSale, Model m
			) throws IllegalStateException, IOException {
		
		ProductSortBean pdsBean = pdsService.findById(sortId);
		
		ProductBean pdBean = pdService.findById(productId);
		pdBean.setName(name);
		pdBean.setUnitPrice(unitPrice);
		pdBean.setQuantity(quantity);
		pdBean.setBuyCount(buyCount);
		pdBean.setContent(content);
		pdBean.setClickCount(clickCount);
		pdBean.setOnSale(onSale);
		pdBean.setProductSortBean(pdsBean);
		
		String fileName1 = picture1.getOriginalFilename();
		String fileName2 = picture2.getOriginalFilename();
		String fileName3 = picture3.getOriginalFilename();
		
		String[] fileNames = {fileName1, fileName2, fileName3};
		
		int i = 1;
		File savePathFile = null;
		for (String fileName : fileNames) {
			if (fileName.trim().length() != 0) {
				String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名
				
				ClassPathResource resource = new ClassPathResource("/src/main/webapp/WEB-INF/Buy_again/images/productimages/");
				String saveDirPath = resource.getPath();
				
				File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
				saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立
				
				String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
				savePathFile = new File(savePath); // 儲存檔案
				savePathid = savePathFile.getName();
				if (i == 1) {
					picture1.transferTo(savePathFile); // 檔案上傳
					pdBean.setImg1(savePathid);
				} else if (i == 2) {
					picture2.transferTo(savePathFile); // 檔案上傳
					pdBean.setImg2(savePathid);
				} else if (i == 3) {
					picture3.transferTo(savePathFile); // 檔案上傳
					pdBean.setImg3(savePathid);
				}
			}
			// 沒重新上傳的話不用給值, 本來裡面就有
			i++;
		}
				
		return "redirect:/findallproducts.controller";
		
	}
	
	//
	@GetMapping("/productStatus.controller")
	public String products(Model m,@RequestParam("status")String status) {

		List<ProductBean> products = pdService.findAll();
		List<ProductSortBean> productSort = pdsService.findAll();
		m.addAttribute("allProducts", products);
		m.addAttribute("allProductSort", productSort);
		m.addAttribute("status",status);
		return "shopping";
	}
	//查詢所有商品
	@GetMapping("/products.controller") 
	public String products(Model pdts, Model pdtsSort ) {

		List<ProductBean> products = pdService.findAll();
		List<ProductSortBean> productSort = pdsService.findAll();
		pdts.addAttribute("allProducts", products);
		pdtsSort.addAttribute("allProductSort", productSort);

		return "shopping";
	}
	// ajax的url 查詢productId
	@RequestMapping(path = "oneProduct.controller")
	@ResponseBody

	public ProductBean findProduct(@RequestParam("productId") String productId) { // 取出產品Id
		productId = productId.substring(8); // 對應編號數字
		System.out.println("productId:" + productId);
		
		Integer pdId = Integer.parseInt(productId);
		
		ProductBean productBean = pdService.findById(pdId); // sql搜尋條件productId
		pdService.updateproductIdLook(productBean.getClickCount()+1,productId);
		return productBean;

	}
	//查詢種類
	@RequestMapping(path = "/productsSort.controller")

	public String findBysort(Model s, Model p, @RequestParam("sortId") Integer sortId) { // 傳回網頁條件sort值

		List<ProductSortBean> productSort = pdsService.findAll();// 找出所有種類
		s.addAttribute("allProductSort", productSort);
		List<ProductBean> products = pdService.findBysort(sortId); // sql搜尋條件sort
		p.addAttribute("allProducts", products);
		// return productSort.toString();
		return "shopping";

	}
	//單筆商品 
	@RequestMapping("/product.controller")
	public String product(Model pdts, Model pdtsSort, @RequestParam("productId") String productId) {
		System.out.println("productId:" + productId);

		List<ProductBean> products = pdService.findByproductId(productId);
		System.out.println(products);
		List<ProductSortBean> productSort = pdsService.findAll();
		pdts.addAttribute("allProducts", products);
		pdtsSort.addAttribute("allProductSort", productSort);

		return "product";
	}
	//模糊查詢
	@RequestMapping("selectbyname")
	public String findByname(Model pdts, Model pdtsSort,@RequestParam("inquire") String inquire) {
		
		List<ProductBean> products = pdService.findByname(inquire);
		List<ProductSortBean> productSort = pdsService.findAll();
		
		pdts.addAttribute("allProducts", products);
		pdtsSort.addAttribute("allProductSort", productSort);
		
		return "shopping";
	}
	//查詢熱門商品
	@GetMapping("/productsClick.controller") 
	public String findByclickCount(Model l ,Model pdtsSort) {
		int i = 0 ;
		List<ProductBean> productl = pdService.findByclickCount(i);
		List<ProductSortBean> productSort = pdsService.findAll();
		l.addAttribute("allProducts", productl);
		pdtsSort.addAttribute("allProductSort", productSort);
		return "shopping";
	}

}
