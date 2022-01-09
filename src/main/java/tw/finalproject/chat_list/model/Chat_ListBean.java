package tw.finalproject.chat_list.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.chat_content_list.model.Chat_Content_ListBean;

@Entity
@Table(name = "CHAT_LIST")
@Component
public class Chat_ListBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CL_ID")
	private Integer cl_id;

	@Column(name = "CL_ML_ID")
	private Integer cl_ml_id;

	@Column(name = "CL_TYPE", insertable = false)
	private Integer cl_type;

	@Column(name = "CL_ADD_DATE", insertable = false)
	private Date cl_add_date;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "chat_listBean", cascade = CascadeType.ALL)
	private List<Chat_Content_ListBean> chat_content_listBean;

	public Chat_ListBean() {
	}
	

	public List<Chat_Content_ListBean> getChat_content_listBean() {
		return chat_content_listBean;
	}

	public void setChat_content_listBean(List<Chat_Content_ListBean> chat_content_listBean) {
		this.chat_content_listBean = chat_content_listBean;
	}

	public Integer getCl_id() {
		return cl_id;
	}

	public void setCl_id(Integer cl_id) {
		this.cl_id = cl_id;
	}

	public Integer getCl_ml_id() {
		return cl_ml_id;
	}

	public void setCl_ml_id(Integer cl_ml_id) {
		this.cl_ml_id = cl_ml_id;
	}

	public Integer getCl_type() {
		return cl_type;
	}

	public void setCl_type(Integer cl_type) {
		this.cl_type = cl_type;
	}

	public Date getCl_add_date() {
		return cl_add_date;
	}

	public void setCl_add_date(Date cl_add_date) {
		this.cl_add_date = cl_add_date;
	}

	public Chat_ListBean(Integer cl_id, Integer cl_ml_id, Integer cl_type, Date cl_add_date) {
		this.cl_id = cl_id;
		this.cl_ml_id = cl_ml_id;
		this.cl_type = cl_type;
		this.cl_add_date = cl_add_date;
	}

	@Override
	public String toString() {
		return "Chat_ListBean [cl_id=" + cl_id + ", cl_ml_id=" + cl_ml_id + ", cl_type=" + cl_type + ", cl_add_date="
				+ cl_add_date + ", chat_content_listBean=" + chat_content_listBean + "]";
	}

}
