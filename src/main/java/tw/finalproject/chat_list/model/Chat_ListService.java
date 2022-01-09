package tw.finalproject.chat_list.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class Chat_ListService {
	@Autowired
	private Chat_ListRepository clResp;

	public Chat_ListBean insert(Chat_ListBean cus) {
		return clResp.save(cus);
	}
	
	public Chat_ListBean update(Chat_ListBean cus) {
		return clResp.save(cus);
	}

	public void deleteById(Integer id) {
		clResp.deleteById(id);
	}

	public Chat_ListBean findChat_ListById(Integer id) {
		Optional<Chat_ListBean> op1 = clResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	
	public List<Chat_ListBean> findAll(){
		return clResp.findAll();
	}
	
	public List<Chat_ListBean> findChat_List(Integer cl_ml_id){
		return clResp.findChat_List(cl_ml_id);
	}
	
	public List<Chat_ListBean> findChat_List_Mag(){
		return clResp.findChat_List_Mag();
	}
	
//	public List<Chat_ListBean> findByCl_ml_id(Integer cl_ml_id){
//		return clResp.findByCl_ml_id(cl_ml_id);
//	}
	
//	public List<Chat_ListBean> findchat_content_list(List<Chat_ListBean> Chat_ListBean){
//		return clResp.findchat_content_list(Chat_ListBean);
//	}
//	
	public List<Chat_ListBean> findChat_ListBean_type(Integer cl_ml_id){
		return clResp.findChat_ListBean_type(cl_ml_id);
	}
	
	public Chat_ListBean findChat_List_Mag_Inquire(Integer cl_ml_id){
		return clResp.findChat_List_Mag_Inquire(cl_ml_id);
	}
}