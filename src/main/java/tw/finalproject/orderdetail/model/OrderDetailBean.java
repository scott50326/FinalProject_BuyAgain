package tw.finalproject.orderdetail.model;

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

import tw.finalproject.order.model.OrderBean;
import tw.finalproject.product.model.ProductBean;

@Entity
@Table(name = "orderdetails")
@Component
public class OrderDetailBean {

	@Id
	@Column(name = "ORDERDETAILID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailId;

	@Column(name = "FK_ORDERID", insertable = false)
	@Transient
	private Integer fk_orderId;

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
	@JoinColumn(name = "FK_ORDERID")
	private OrderBean orderBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_PRODUCTID")
	private ProductBean productBean;

	public OrderDetailBean() {
	}

	@Override
	public String toString() {
		return "OrderDetailBean [orderDetailId=" + orderDetailId + ", fk_orderId=" + fk_orderId + ", fk_productId="
				+ fk_productId + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", totalPrice=" + totalPrice
				+ ", ProductBean=" + productBean + "]";
	}

	public Integer getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public Integer getFk_orderId() {
		return fk_orderId;
	}

	public void setFk_orderId(Integer fk_orderId) {
		this.fk_orderId = fk_orderId;
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

}
