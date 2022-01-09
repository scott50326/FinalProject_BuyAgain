package tw.finalproject.member.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

import tw.finalproject.article.model.ArticleBean;
import tw.finalproject.lottery.model.LotteryBean;
import tw.finalproject.message.model.MessageBean;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.productregister.model.ProductRegisterBean;
import tw.finalproject.shoppingcartdetail.model.ShoppingcartDetailBean;
import tw.finalproject.warranty.model.WarrantyBean;

@Entity
@Table(name = "members")
@Component
public class MemberBean {

	@Id
	@Column(name = "MEMBERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberId;

	@Column(name = "USERID")
	private String userId;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "BIRTHDAY")
	private String birthday;

	@Column(name = "PHONE")
	private String phone;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "EMAIL")
	private String email;

	@Column(name = "IMG")
	private String img;

	@Column(name = "REGISTERDATE", insertable = false)
	private Date registerDate;

	@Column(name = "SPEND", insertable = false)
	private Integer spend;

	@Column(name = "RANK", insertable = false)
	private Integer rank; // 1銅 2銀 3金 4白金 5鑽石

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<OrderBean> orders = new ArrayList<OrderBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<ArticleBean> articles = new ArrayList<ArticleBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<MessageBean> messages = new ArrayList<MessageBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<ShoppingcartDetailBean> shoppingcartDetails = new ArrayList<ShoppingcartDetailBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<LotteryBean> lotterys = new ArrayList<LotteryBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<ProductRegisterBean> productRegisters = new ArrayList<ProductRegisterBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "memberBean", cascade = CascadeType.ALL)
	private List<WarrantyBean> warranty = new ArrayList<WarrantyBean>();

	public MemberBean() {
	}

	public MemberBean(String userId, String password, String name, String birthday, String phone, String address,
			String email) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberBean [memberId=" + memberId + ", userId=" + userId + ", password=" + password + ", name=" + name
				+ ", birthday=" + birthday + ", phone=" + phone + ", address=" + address + ", email=" + email
				+ ", registerDate=" + registerDate + ", spend=" + spend + ", rank=" + rank + "]";
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getSpend() {
		return spend;
	}

	public void setSpend(Integer spend) {
		this.spend = spend;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public List<OrderBean> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderBean> orders) {
		this.orders = orders;
	}

	public List<ArticleBean> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticleBean> articles) {
		this.articles = articles;
	}

	public List<MessageBean> getMessages() {
		return messages;
	}

	public void setMessages(List<MessageBean> messages) {
		this.messages = messages;
	}

	public List<ShoppingcartDetailBean> getShoppingcartDetails() {
		return shoppingcartDetails;
	}

	public void setShoppingcartDetails(List<ShoppingcartDetailBean> shoppingcartDetails) {
		this.shoppingcartDetails = shoppingcartDetails;
	}

	public List<LotteryBean> getLotterys() {
		return lotterys;
	}

	public void setLotterys(List<LotteryBean> lotterys) {
		this.lotterys = lotterys;
	}

	public List<ProductRegisterBean> getProductRegisters() {
		return productRegisters;
	}

	public void setProductRegisters(List<ProductRegisterBean> productRegisters) {
		this.productRegisters = productRegisters;
	}

	public List<WarrantyBean> getWarranty() {
		return warranty;
	}

	public void setWarranty(List<WarrantyBean> warranty) {
		this.warranty = warranty;
	}

}
