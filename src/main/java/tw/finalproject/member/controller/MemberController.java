package tw.finalproject.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;

@Controller
@SessionAttributes(names = { "memlogin", "mnglogin", "members" })
public class MemberController {

	@Autowired
	private MemberService memService;

	@Autowired
	private HttpSession session;

	private String savePathid;

	@Autowired
	private ServletContext context;

	// 註冊頁面
	@GetMapping("/memberregister.controller")
	public String processMemberRegister() {
		return "memberRegister";
	}

	// 個人資訊頁面
	@GetMapping("/memberInformation.controller")
	public String processMemberInformationRegister() {
		return "memberInformation";
	}

	// 會員儀表板
	@GetMapping("/memberService.controller")
	public String memberService(Model m) {
		return "memberService";
	}

	// 修改個人資訊頁面
	@GetMapping("/memberInformationUpdate.controller")
	public String processMemberInformationUpdater() {
		return "memberInformationUpdate";
	}

	// 修改密碼頁面
	@GetMapping("/memberPasswordUpdate.controller")
	public String processMemberPasswordUpdate() {
		return "memberPasswordUpdate";
	}

	@GetMapping("/findallmembers.controller")
	public String processFindAll(Model m) {

		List<MemberBean> members = memService.findAll();
		m.addAttribute("allMembers", members);

		return "backController_member";
	}

	@GetMapping("/findmembersbyrank.controller")
	@ResponseBody
	public List<MemberBean> processFindMemeberByRank(@RequestParam("rank") Integer rank) {
		List<MemberBean> members = memService.findByRank(rank);
		return members;
	}

	@GetMapping("/findmembersbysimilarname.controller")
	@ResponseBody
	public List<MemberBean> processFindMemeberByRank(@RequestParam("similarname") String similarname) {

		System.out.println("Rank = " + similarname);
		List<MemberBean> members = memService.findByNameLike(similarname);

		return members;
	}

	@GetMapping("/insertmember.controller")
	public String insertMember(Model m) throws IOException {

		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/memberimages/defaultpicture.jpg");
		byte[] pic = IOUtils.toByteArray(is1);

		m.addAttribute("pic", pic);

		return "memberInsert";
	}

	// 註冊會員
	@PostMapping("/insertmember2.controller")
	public String insertMember2(@RequestParam("picture") MultipartFile picture, @RequestParam("userId") String userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email, Model m)
			throws IllegalStateException, IOException {

		String fileName = picture.getOriginalFilename();
		if (fileName.trim().length() != 0) {
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile); // 檔案上傳
		} else {
			savePathid = "defaultpicture.jpg";
		}

		MemberBean mbBean = new MemberBean();
		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setName(name);
		mbBean.setBirthday(birthday);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);
		mbBean.setImg(savePathid);

		memService.insertMember(mbBean);

//		if (account != null) {
//			m.addAttribute("memlogin", account);
//		}

		if (session.getAttribute("mngLogin") != null) {
			return "redirect:/findallmembers.controller";
		}

		return "homepage";
	}

	@GetMapping("/deletemember.controller")
	public String deleteMember(@RequestParam("memberId") Integer id, Model m) {
		memService.deleteById(id);
		System.out.println("delete success!!");
		return "forward:/findallmembers.controller";
	}

	@GetMapping("/updatemember.controller")
	public String updateMember(@RequestParam("memberId") Integer id, Model m) throws IOException {

		MemberBean mem = memService.findByMemberId(id);
		m.addAttribute("member", mem);

		InputStream is1 = context.getResourceAsStream("/WEB-INF/Buy_again/images/memberimages/" + mem.getImg());
		byte[] pic = IOUtils.toByteArray(is1);

		m.addAttribute("pic", pic);

		return "memberUpdate";
	}

	@PostMapping("/updatemember2.controller")
	public String updateMember2(@RequestParam("picture") MultipartFile picture,
			@RequestParam("memberId") Integer memberId, @RequestParam("userId") String userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email,
			@RequestParam("spend") Integer spend, Model m) throws IllegalStateException, IOException {

		MemberBean mbBean = memService.findByMemberId(memberId);
		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setName(name);
		mbBean.setBirthday(birthday);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);
		mbBean.setSpend(spend);
		mbBean.setRank(memService.spendToRank(spend));

		String fileName = picture.getOriginalFilename();

		if (fileName.trim().length() != 0) { // 代表有重新上傳
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile); // 檔案上傳

			mbBean.setImg(savePathid);
		}
		// 沒重新上傳的話不用給值, 本來裡面就有

		MemberBean account = memService.updateMember(mbBean);

		if (session.getAttribute("mngLogin") != null) {
			return "redirect:/findallmembers.controller"; // redirect: 提出新的請求給 server
		}

		if (account != null) {
			m.addAttribute("memlogin", account);
		}

		return "homepage";
	}

	// 個人資訊單筆查詢
	@GetMapping("/memberInformation")
	public String processmemberInformationfindById(@RequestParam("memberId") Integer id, Model m) {
		MemberBean memberBean = memService.findByMemberId(id);
		m.addAttribute("members", memberBean);
		return "memberInformation";
	}

	// 會員修改個資(導的頁面不一樣)
	@PostMapping(path = "/updatemember3.controller")
	public String updateMember3(@RequestParam("picture") MultipartFile picture,
			@RequestParam("memberId") Integer memberId, @RequestParam("userId") String userId,
			@RequestParam("password") String password, @RequestParam("name") String name,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("email") String email,
			@RequestParam("spend") Integer spend, @RequestParam("rank") Integer rank, Model m)
			throws IllegalStateException, IOException {

		String fileName = picture.getOriginalFilename();

		MemberBean mbBean = memService.findByMemberId(memberId);

		if (fileName.trim().length() != 0) { // 代表有重新上傳
			String fileString = fileName.substring(fileName.lastIndexOf(".")); // 只取副檔名

			ClassPathResource resource = new ClassPathResource(
					"/src/main/webapp/WEB-INF/Buy_again/images/memberimages/");
			String saveDirPath = resource.getPath();

			File saveDirPathFile = new File(saveDirPath); // new File(saveDirPath); 新建資料夾(路徑)
			saveDirPathFile.mkdirs(); // mkdirs()不管原本有沒有資料夾都幫我建立

			String savePath = saveDirPath + UUID.randomUUID() + fileString; // 設定儲存路徑
			File savePathFile = new File(savePath); // 儲存檔案
			savePathid = savePathFile.getName();
			picture.transferTo(savePathFile); // 檔案上傳
		} else { // 沒重新上傳
			savePathid = mbBean.getImg();
		}

		mbBean.setUserId(userId);
		mbBean.setPassword(password);
		mbBean.setName(name);
		mbBean.setBirthday(birthday);
		mbBean.setPhone(phone);
		mbBean.setAddress(address);
		mbBean.setEmail(email);
		mbBean.setImg(savePathid);
		mbBean.setSpend(spend);
		mbBean.setRank(rank);

		MemberBean account = memService.updateMember(mbBean);

		if (session.getAttribute("mnglogin") != null) {
			return "redirect:/findallmembers.controller"; // redirect: 提出新的請求給 server
		}

		if (account != null) {
			m.addAttribute("members", account);
		}

		return "memberInformation";
	}

	// 臉書登入(ajax)
	@PostMapping("/insertmemberFB.controller")
	@ResponseBody
	public MemberBean insertmemberFB(@RequestBody HashMap<String, String> mem, Model m) {

		MemberBean meMail = memService.findEmail(mem.get("email"));

		if (meMail == null) {
			MemberBean member = new MemberBean();
			member.setName(mem.get("name"));
			member.setEmail(mem.get("email"));
			member.setUserId("ases12396");
			member.setPassword("2142431");
			member.setBirthday("");
			member.setPhone("");
			member.setAddress("");
			member.setImg("defaultpicture.jpg");

			MemberBean me = memService.insertMember(member);
			m.addAttribute("memlogin", me);
			return me;
		} else {
			m.addAttribute("memlogin", meMail);
			return meMail;
		}

	}
}
