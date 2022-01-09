package tw.finalproject.contactus.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "CONTACTUS")
@Component
public class ContactUsBean {

	@Id
	@Column(name = "CONTACTUSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer contactUsId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "TITLE")
	private String title;

	@Column(name = "CONTENT")
	private String content;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss.sss")
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss.sss")
	@Column(name = "REGISTERDATE", insertable = false)
	private Date registerDate;

	@Column(name = "RESPONDER")
	private String responder;

	@Column(name = "RESPONSEDATE")
	private Date responseDate;

	@Column(name = "RESPONSETITLE")
	private String responseTitle;

	@Column(name = "RESPONSECONTENT")
	private String responseContent;

	@Column(name = "CONFIRM", insertable = false)
	private Integer confirm;

	public ContactUsBean() {
	}

	public ContactUsBean(Integer contactUsId, String name, String email, String title, String content,
			Date registerDate, String responder, Date responseDate, String responseTitle, String responseContent,
			Integer confirm) {
		this.contactUsId = contactUsId;
		this.name = name;
		this.email = email;
		this.title = title;
		this.content = content;
		this.registerDate = registerDate;
		this.responder = responder;
		this.responseDate = responseDate;
		this.responseTitle = responseTitle;
		this.responseContent = responseContent;
		this.confirm = confirm;
	}

	public Integer getConfirm() {
		return confirm;
	}

	public void setConfirm(Integer confirm) {
		this.confirm = confirm;
	}

	@Override
	public String toString() {
		return "ContactUsBean [contactUsId=" + contactUsId + ", name=" + name + ", email=" + email + ", title=" + title
				+ ", content=" + content + ", registerDate=" + registerDate + ", confirm=" + confirm + "]";
	}

	public Integer getContactUsId() {
		return contactUsId;
	}

	public void setContactUsId(Integer contactUsId) {
		this.contactUsId = contactUsId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public String getResponder() {
		return responder;
	}

	public void setResponder(String responder) {
		this.responder = responder;
	}

	public Date getResponseDate() {
		return responseDate;
	}

	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}

	public String getResponseTitle() {
		return responseTitle;
	}

	public void setResponseTitle(String responseTitle) {
		this.responseTitle = responseTitle;
	}

	public String getResponseContent() {
		return responseContent;
	}

	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}

}
