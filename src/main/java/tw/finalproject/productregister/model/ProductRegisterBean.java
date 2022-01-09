package tw.finalproject.productregister.model;

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

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.order.model.OrderBean;
import tw.finalproject.product.model.ProductBean;

@Entity
@Table(name = "productregister")
@Component
public class ProductRegisterBean {

	@Id
	@Column(name = "PRODUCTREGISTERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productRegisterId;

	@Column(name = "FK_ORDERID", insertable = false)
	@Transient
	private Integer fk_orderId;

	@Column(name = "LICENSEKEY")
	private String licenseKey;

	@Column(name = "FK_PRODUCTID", insertable = false)
	@Transient
	private Integer fk_productId;

	@Column(name = "BUYDATE", insertable = false)
	private Date buyDate;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "REGISTERDATE")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date registerDate;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_ORDERID")
	private OrderBean orderBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_PRODUCTID")
	private ProductBean productBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	public ProductRegisterBean() {
	}

	public ProductRegisterBean(String licenseKey, Integer fk_productId, Date buyDate, Integer fk_memberId,
			ProductBean productBean, MemberBean memberBean) {
		this.licenseKey = licenseKey;
		this.fk_productId = fk_productId;
		this.buyDate = buyDate;
		this.fk_memberId = fk_memberId;
		this.productBean = productBean;
		this.memberBean = memberBean;
	}

	@Override
	public String toString() {
		return "ProductRegisterBean [productRegisterId=" + productRegisterId + ", licenseKey=" + licenseKey
				+ ", fk_productId=" + fk_productId + ", buyDate=" + buyDate + ", fk_memberId=" + fk_memberId + ""
						+ ", OrderBean=" + orderBean + "]";
	}

	public Integer getProductRegisterId() {
		return productRegisterId;
	}

	public void setProductRegisterId(Integer productRegisterId) {
		this.productRegisterId = productRegisterId;
	}

	public Integer getFk_orderId() {
		return fk_orderId;
	}

	public void setFk_orderId(Integer fk_orderId) {
		this.fk_orderId = fk_orderId;
	}

	public String getLicenseKey() {
		return licenseKey;
	}

	public void setLicenseKey(String licenseKey) {
		this.licenseKey = licenseKey;
	}

	public Integer getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

}
