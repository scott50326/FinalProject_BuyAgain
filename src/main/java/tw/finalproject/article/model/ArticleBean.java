package tw.finalproject.article.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.articlesort.model.ArticleSortBean;
import tw.finalproject.member.model.MemberBean;
import tw.finalproject.message.model.MessageBean;

@Entity
@Table(name = "articles")
@Component
public class ArticleBean {

	@Id
	@Column(name = "ARTICLEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer articleId;

	@Column(name = "FK_SORTID", insertable = false)
	@Transient
	private Integer fk_sortId;

	@Column(name = "HEADER")
	private String header;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "IMG1")
	private String img1;
	@Column(name = "IMG2")
	private String img2;
	@Column(name = "IMG3")
	private String img3;

	@Column(name = "REGISTERDATE", insertable = false)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Date registerDate;

	@Column(name = "TOUCH", insertable = false)
	private Integer touch;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_SORTID")
	private ArticleSortBean articleSortBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleBean", cascade = CascadeType.ALL)
	private List<MessageBean> messages = new ArrayList<MessageBean>();

	public ArticleBean() {
	}

	public ArticleBean(Integer fk_sortId, String header, Integer fk_memberId, String name, String content) {
		super();
		this.fk_sortId = fk_sortId;
		this.header = header;
		this.fk_memberId = fk_memberId;
		this.name = name;
		this.content = content;
	}

	@Override
	public String toString() {
		return "ArticleBean [articleId=" + articleId + ", fk_sortId=" + fk_sortId + ", header=" + header
				+ ", fk_memberId=" + fk_memberId + ", name=" + name + ", content=" + content + ", registerDate="
				+ registerDate + "]";
	}

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getFk_sortId() {
		return fk_sortId;
	}

	public void setFk_sortId(Integer fk_sortId) {
		this.fk_sortId = fk_sortId;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
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

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getTouch() {
		return touch;
	}

	public void setTouch(Integer touch) {
		this.touch = touch;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public List<MessageBean> getMessages() {
		return messages;
	}

	public void setMessages(List<MessageBean> messages) {
		this.messages = messages;
	}

	public ArticleSortBean getArticleSortBean() {
		return articleSortBean;
	}

	public void setArticleSortBean(ArticleSortBean articleSortBean) {
		this.articleSortBean = articleSortBean;
	}

}
