package tw.finalproject.lottery.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.billboard.model.BillboardBean;
import tw.finalproject.billboard.model.BillboardService;
import tw.finalproject.lottery.model.LotteryBean;
import tw.finalproject.lottery.model.LotteryService;
import tw.finalproject.manager.model.ManagerBean;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.member.model.MemberService;
import tw.finalproject.product.model.ProductBean;

@Controller
public class LotteryController {

	@Autowired
	private LotteryService ltrService;

	@Autowired
	private MemberService memService;

	@Autowired
	private BillboardService bbService;

	@Autowired
	ServletContext context;

	@Autowired
	private HttpSession session;

	@GetMapping("/findalllotterys.controller")
	public String processFindAll(Model m) {

		List<LotteryBean> lotterys = ltrService.findAll();
		m.addAttribute("alllotterys", lotterys);

		return "backController_lottery";
	}

	// 抽獎+新增公告
	@GetMapping("/productlottery.controller")
	@ResponseBody
	public MemberBean updateOrder(@RequestParam("lotteryId") Integer id, Model m, HttpSession session) {
		LotteryBean ltrb = ltrService.findById(id);

		MemberBean memberBean = memService.findLotteryMemberId();

		ArrayList<Integer> al = ltrService.LotteryBeanMemberId();

		for (Integer i : al) {
			System.out.println(i);
		}

		if (!al.isEmpty()) {
			Boolean flag = true;

			while (flag) {
				memberBean = memService.findLotteryMemberId();
				for (int i = 0; i < al.size(); i++) {
					if (al.get(i) == memberBean.getMemberId()) {
						flag = true;
						break;
					} else {
						flag = false;
					}
				}
			}
		}

		ltrb.setMemberBean(memberBean);
		ltrb.setRegisterDate(new Date());
		ltrb.setState(1);
		LotteryBean lb = ltrService.updateOrder(ltrb);
		ManagerBean managerBean = (ManagerBean) session.getAttribute("mngLogin");

		BillboardBean billboardBean = new BillboardBean();
		billboardBean.setManagerBean(managerBean);
		billboardBean.setPublisher(managerBean.getName());
		billboardBean.setRegisterDate(new Date());
		billboardBean.setContent(
				"恭喜! 會員帳號" + memberBean.getUserId() + "抽中獎品" + lb.getProductBean().getName() + ", 全體員工齊慶賀!");
		bbService.insertBillboard(billboardBean);

		return memberBean;
	}

	// 查詢
	@GetMapping("/selectLottery.controller")
	@ResponseBody
	public Map<String,Object> selectLottery(@RequestParam("state") Integer state, Model m) {

		ArrayList<LotteryBean> lotteryBean = ltrService.findByState(state);
		List<ProductBean> productBean = new ArrayList<ProductBean>();
		List<MemberBean> memberBean = new ArrayList<MemberBean>();
		
		Map<String,Object> map = new HashedMap<String,Object>();
		
		if (lotteryBean != null) {
			for (int i = 0; i < lotteryBean.size(); i++) {
				productBean.add(lotteryBean.get(i).getProductBean()); 
				memberBean.add(lotteryBean.get(i).getMemberBean());
			}
		}
		map.put("LotteryBean",lotteryBean );
		map.put("ProductBean",productBean );
		map.put("MemberBean",memberBean );
		
		
		return map;

	}
}
