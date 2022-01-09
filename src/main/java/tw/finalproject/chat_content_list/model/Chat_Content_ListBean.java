package tw.finalproject.chat_content_list.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

import tw.finalproject.chat_list.model.Chat_ListBean;

@Entity
@Table(name = "CHAT_CONTENT_LIST")
//@Component
public class Chat_Content_ListBean {
	
	@Id
	@Column(name = "CCL_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ccl_id;

	@Column(name = "CCL_CONTENT")
	private String ccl_content;

	@Column(name = "CCL_TYPE")
	private String ccl_type;

	@Column(name = "CCL_ADD_DATE", insertable = false)
	private Date ccl_add_date;

	@Column(name = "CCL_CL_ID")
	@Transient
	private Integer ccl_cl_id;

	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "CCL_CL_ID",updatable = false)
	private Chat_ListBean chat_listBean;

	public Chat_Content_ListBean() {
	}

	public Chat_Content_ListBean(Integer ccl_id, String ccl_content, String ccl_type, Date ccl_add_date,
			Integer ccl_cl_id) {
		this.ccl_id = ccl_id;
		this.ccl_content = ccl_content;
		this.ccl_type = ccl_type;
		this.ccl_add_date = ccl_add_date;
		this.ccl_cl_id = ccl_cl_id;
	}

	public Integer getCcl_id() {
		return ccl_id;
	}

	public void setCcl_id(Integer ccl_id) {
		this.ccl_id = ccl_id;
	}

	public String getCcl_content() {
		return ccl_content;
	}

	public void setCcl_content(String ccl_content) {
		this.ccl_content = ccl_content;
	}

	public String getCcl_type() {
		return ccl_type;
	}

	public void setCcl_type(String ccl_type) {
		this.ccl_type = ccl_type;
	}

	public Date getCcl_add_date() {
		return ccl_add_date;
	}

	public void setCcl_add_date(Date ccl_add_date) {
		this.ccl_add_date = ccl_add_date;
	}

	public Integer getCcl_cl_id() {
		return ccl_cl_id;
	}

	public void setCcl_cl_id(Integer ccl_cl_id) {
		this.ccl_cl_id = ccl_cl_id;
	}

	public Chat_ListBean getChat_listBean() {
		return chat_listBean;
	}

	public void setChat_listBean(Chat_ListBean chat_listBean) {
		this.chat_listBean = chat_listBean;
	}

	@Override
	public String toString() {
		return "Chat_Content_ListBean [ccl_id=" + ccl_id + ", ccl_content=" + ccl_content + ", ccl_type=" + ccl_type
				+ ", ccl_add_date=" + ccl_add_date + ", ccl_cl_id=" + ccl_cl_id + ", chat_listBean=" + chat_listBean
				+ "]";
	}

}
