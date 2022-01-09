package tw.finalproject.order.model;

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
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.productregister.model.ProductRegisterBean;

@Entity
@Table(name = "orders")
@Component
public class OrderBean {

	@Id
	@Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;

	@Column(name = "ORDERNO")
	private String orderNo;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "PHONE")
	private String phone;

	@Column(name = "FINALPRICE")
	private Integer finalPrice;

	@Column(name = "ORDERDATE", insertable = false)
	private Date orderDate;

	@Column(name = "ORDERSTATE", insertable = false)
	private Integer orderState;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderBean", cascade = CascadeType.ALL)
	private List<OrderDetailBean> orderdetails = new ArrayList<OrderDetailBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderBean", cascade = CascadeType.ALL)
	private List<ProductRegisterBean> productregisters = new ArrayList<ProductRegisterBean>();

	public OrderBean() {
	}

	public OrderBean(String orderNo, Integer fk_memberId, String address, String phone, Integer finalPrice) {
		super();
		this.orderNo = orderNo;
		this.fk_memberId = fk_memberId;
		this.address = address;
		this.phone = phone;
		this.finalPrice = finalPrice;
	}

	@Override
	public String toString() {
		return "OrderBean [orderId=" + orderId + ", orderNo=" + orderNo + ", fk_memberId=" + fk_memberId + ", address="
				+ address + ", phone=" + phone + ", finalPrice=" + finalPrice + ", orderDate=" + orderDate
				+ ", orderState=" + orderState + ", MemberBean=" + memberBean+", OrderDetailBean=" + orderdetails+"]";
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(Integer finalPrice) {
		this.finalPrice = finalPrice;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Integer getOrderState() {
		return orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public List<OrderDetailBean> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(List<OrderDetailBean> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public List<ProductRegisterBean> getProductregisters() {
		return productregisters;
	}

	public void setProductregisters(List<ProductRegisterBean> productregisters) {
		this.productregisters = productregisters;
	}

}
