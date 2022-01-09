package tw.finalproject.message.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

import tw.finalproject.article.model.ArticleBean;
import tw.finalproject.member.model.MemberBean;

@Entity
@Table(name = "messages")
@Component
public class MessageBean {

	@Id
	@Column(name = "MESSAGEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer messageId;

	@Column(name = "FK_ARTICLEID", insertable = false)
	@Transient
	private Integer fk_articleId;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "REGISTERDATE", insertable = false)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date registerDate;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_ARTICLEID")
	private ArticleBean articleBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	public MessageBean() {
	}

	public MessageBean(Integer fk_articleId, Integer fk_memberId, String content) {
		this.fk_articleId = fk_articleId;
		this.fk_memberId = fk_memberId;
		this.content = content;
	}

	@Override
	public String toString() {
		return "MessageBean [messageId=" + messageId + ", fk_articleId=" + fk_articleId + ", fk_memberId=" + fk_memberId
				+ ", content=" + content + ", registerDate=" + registerDate + "]";
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getFk_articleId() {
		return fk_articleId;
	}

	public void setFk_articleId(Integer fk_articleId) {
		this.fk_articleId = fk_articleId;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public ArticleBean getArticleBean() {
		return articleBean;
	}

	public void setArticleBean(ArticleBean articleBean) {
		this.articleBean = articleBean;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

}
