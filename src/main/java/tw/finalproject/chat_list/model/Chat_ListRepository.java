package tw.finalproject.chat_list.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface Chat_ListRepository extends JpaRepository<Chat_ListBean, Integer> {
	
	//管理員客服單筆查詢
	@Query(value = "SELECT * from chat_list JOIN chat_content_list ON cl_ml_id=?1 and ccl_cl_id = cl_id",nativeQuery = true)
	public List<Chat_ListBean> findChat_List(Integer cl_ml_id);
	
//	public List<Chat_ListBean> findByCl_ml_id(Integer cl_ml_id);
	
	//管理員客服總攬查詢
	@Query(value ="Select cl_id,cl_ml_id,cl_type,cl_add_date From (Select cl_id,cl_ml_id,cl_type,cl_add_date,	ROW_NUMBER() Over (Partition By cl_ml_id Order By cl_add_date Desc) As Sort From chat_list) chat_list Where chat_list.Sort=1",nativeQuery = true)
	public List<Chat_ListBean> findChat_List_Mag();
	
	
//	@Query(value = "SELECT * from chat_content_list where ccl_cl_id = ?1 ",nativeQuery = true)
//	public List<Chat_ListBean> findchat_content_list(List<Chat_ListBean> Chat_ListBean);
	 
	@Query(value = "UPDATE chat_list SET cl_type = 1 WHERE cl_ml_id=?1 SELECT * from chat_list",nativeQuery = true)
	public List<Chat_ListBean> findChat_ListBean_type(Integer cl_ml_id);

	//會員判斷按鈕
	@Query(value ="Select cl_id,cl_ml_id,cl_type,cl_add_date From (Select cl_id,cl_ml_id,cl_type,cl_add_date,	ROW_NUMBER() Over (Partition By cl_ml_id Order By cl_add_date Desc) As Sort From chat_list) chat_list Where cl_ml_id=?1 and chat_list.Sort=1",nativeQuery = true)
	public Chat_ListBean findChat_List_Mag_Inquire(Integer cl_ml_id);
	
}

