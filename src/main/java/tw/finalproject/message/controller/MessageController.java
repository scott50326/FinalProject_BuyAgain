package tw.finalproject.message.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.finalproject.article.model.ArticleBean;
import tw.finalproject.article.model.ArticleService;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.message.model.MessageBean;
import tw.finalproject.message.model.MessageService;

@Controller
public class MessageController {

	@Autowired
	ServletContext context;

	@Autowired
	private MessageService msgService;

	@Autowired
	private ArticleService atcService;

	@GetMapping("/deletemessage.controller")
	@ResponseBody
	public Boolean deleteMessage(@RequestParam("messageId") Integer id, Model m) {
		msgService.deleteById(id);
		return true;
	}

	@PostMapping("/addmessage/{articleId}")
	@ResponseBody
	public MessageBean processInsertMessages(@RequestBody HashMap<String, Object> messageBean,
			@PathVariable("articleId") int articleId, HttpSession session, Model m) {
	
		ArticleBean articleBean = atcService.findById(articleId);

		MemberBean memberBean = (MemberBean) session.getAttribute("memlogin");

		MessageBean bean = new MessageBean();
//		messageBean.setArticleBean(articleBean);
//		messageBean.setMemberBean(memberBean);
		
		bean.setArticleBean(articleBean);
		bean.setName((String) messageBean.get("name"));
		bean.setContent((String) messageBean.get("content"));
		bean.setMemberBean(memberBean);
		
		return msgService.insertMessage(bean);
		
//		articleBean.getMessages().add(messageBean);
//		articleBean.setMemberBean(memberBean);

//		return atcService.insertArticles(articleBean);
	}

	@PostMapping("/querybyarticleId//{articleId}")
	@ResponseBody
	public List<MessageBean> processFindByArticleIdAction(@PathVariable("articleId") ArticleBean articleId) {
		return msgService.findByArticleId(articleId);
	}

	@PostMapping("/updatebymessageId/{articleId}/{messageId}")
	@ResponseBody
	public MessageBean processUpdateMessages(@RequestBody HashMap<String, Object> messageBean,
			@PathVariable("messageId") int messageId, @PathVariable("articleId") int articleId, HttpSession session) {
		ArticleBean articleBean = atcService.findById(articleId);
		
		MessageBean msgbean = new MessageBean();
		
		MemberBean memBean = (MemberBean) session.getAttribute("memlogin");
		
		msgbean.setMemberBean(memBean);
		msgbean.setArticleBean(articleBean);
		msgbean.setMessageId(messageId);
		msgbean.setName((String) messageBean.get("name"));
		msgbean.setContent((String) messageBean.get("content"));
		msgbean.setRegisterDate(new Date());

		return msgService.updateMessages(msgbean);
	}

	@GetMapping("/deletemessage/{messageId}")
	@ResponseBody
	public void processDeleteMessages(@PathVariable("messageId") int messageId) {
		msgService.deleteMessages(messageId);
	}

}
