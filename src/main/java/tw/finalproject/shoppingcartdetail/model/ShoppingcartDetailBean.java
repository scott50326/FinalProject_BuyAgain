package tw.finalproject.shoppingcartdetail.model;

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

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.product.model.ProductBean;

@Entity
@Table(name = "shoppingcartdetails")
@Component
public class ShoppingcartDetailBean {

	@Id
	@Column(name = "SHOPPINGCARTDETAILID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shoppingcartDetailId;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "FK_PRODUCTID", insertable = false)
	@Transient
	private Integer fk_productId;

	@Column(name = "QUANTITY")
	private Integer quantity;

	@Column(name = "UNITPRICE")
	private Integer unitPrice;

	@Column(name = "TOTALPRICE", insertable = false)
	private Integer totalPrice;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_PRODUCTID")
	private ProductBean productBean;

	public ShoppingcartDetailBean() {
	}

	public ShoppingcartDetailBean(Integer fk_memberId, Integer fk_productId, String img, Integer quantity,
			Integer unitPrice, Integer totalPrice) {
		this.fk_memberId = fk_memberId;
		this.fk_productId = fk_productId;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "ShoppingcartDetailBean [shoppingcartDetailId=" + shoppingcartDetailId + ", fk_memberId=" + fk_memberId
				+ ", fk_productId=" + fk_productId + ", quantity=" + quantity + ", unitPrice=" + unitPrice
				+ ", totalPrice=" + totalPrice + "]";
	}

	public Integer getShoppingcartDetailId() {
		return shoppingcartDetailId;
	}

	public void setShoppingcartDetailId(Integer shoppingcartDetailId) {
		this.shoppingcartDetailId = shoppingcartDetailId;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public Integer getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

}
