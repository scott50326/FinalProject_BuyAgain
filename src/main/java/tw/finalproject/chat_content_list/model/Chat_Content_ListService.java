package tw.finalproject.chat_content_list.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Chat_Content_ListService {
	@Autowired
	private Chat_Content_ListRepository cclResp;

	public Chat_Content_ListBean insert(Chat_Content_ListBean cus) {
		return cclResp.save(cus);
	}
	
	public Chat_Content_ListBean update(Chat_Content_ListBean cus) {
		return cclResp.save(cus);
	}

	public void deleteById(Integer id) {
		cclResp.deleteById(id);
	}

	public Chat_Content_ListBean findChat_Content_ListById(Integer id) {
		Optional<Chat_Content_ListBean> op1 = cclResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<Chat_Content_ListBean> findAll(){
		return cclResp.findAll();
	}
	
}