package tw.finalproject.product.model;

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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.lottery.model.LotteryBean;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.productregister.model.ProductRegisterBean;
import tw.finalproject.productsort.model.ProductSortBean;
import tw.finalproject.shoppingcartdetail.model.ShoppingcartDetailBean;
import tw.finalproject.warranty.model.WarrantyBean;

@Entity
@Table(name = "products")
@Component
public class ProductBean {

	@Id
	@Column(name = "PRODUCTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	@Column(name = "NAME")
	private String name;

	@Column(name = "FK_SORTID", insertable = false, updatable = false)
	@Transient
	private Integer fk_sortId;

	@Column(name = "UNITPRICE")
	private Integer unitPrice;

	@Column(name = "QUANTITY")
	private Integer quantity;

	@Column(name = "BUYCOUNT", insertable = false)
	private Integer buyCount;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "CLICKCOUNT", insertable = false)
	private Integer clickCount;

	@Column(name = "ONSALE", insertable = false)
	private Integer onSale; // 0 為原價, 1 為特價

	@Column(name = "IMG1")
	private String img1;

	@Column(name = "IMG2")
	private String img2;

	@Column(name = "IMG3")
	private String img3;

	@Column(name = "REGISTERDATE", insertable = false)
	private Date registerDate;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productBean", cascade = CascadeType.ALL)
	private List<OrderDetailBean> orders = new ArrayList<OrderDetailBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productBean", cascade = CascadeType.ALL)
	private List<ProductRegisterBean> registerProducts = new ArrayList<ProductRegisterBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productBean", cascade = CascadeType.ALL)
	private List<ShoppingcartDetailBean> shoppingcartDetails = new ArrayList<ShoppingcartDetailBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productBean", cascade = CascadeType.ALL)
	private List<LotteryBean> lotterys = new ArrayList<LotteryBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productBean", cascade = CascadeType.ALL)
	private Set<WarrantyBean> warranty = new HashSet<WarrantyBean>();

	@JsonBackReference
//	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_SORTID")
	private ProductSortBean productSortBean;

	public ProductBean() {
	}

	public ProductBean(String name, Integer fk_sortId, Integer unitPrice, Integer quantity, Integer buyCount,
			String content, Integer clickCount, Integer onSale, String img1, String img2, String img3) {
		super();
		this.name = name;
		this.fk_sortId = fk_sortId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.buyCount = buyCount;
		this.content = content;
		this.clickCount = clickCount;
		this.onSale = onSale;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
	}

	@Override
	public String toString() {
		return "ProductBean [productId=" + productId + ", name=" + name + ", fk_sortId=" + fk_sortId + ", unitPrice="
				+ unitPrice + ", quantity=" + quantity + ", buyCount=" + buyCount + ", content=" + content
				+ ", clickCount=" + clickCount + ", onSale=" + onSale + ", img1=" + img1 + ", img2=" + img2 + ", img3="
				+ img3 + ", registerDate=" + registerDate + "]";
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getFk_sortId() {
		return fk_sortId;
	}

	public void setFk_sortId(Integer fk_sortId) {
		this.fk_sortId = fk_sortId;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getClickCount() {
		return clickCount;
	}

	public void setClickCount(Integer clickCount) {
		this.clickCount = clickCount;
	}

	public Integer getOnSale() {
		return onSale;
	}

	public void setOnSale(Integer onSale) {
		this.onSale = onSale;
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
	@JsonIgnore
	public List<OrderDetailBean> getOrders() {
		return orders;
	}
	@JsonIgnore
	public void setOrders(List<OrderDetailBean> orders) {
		this.orders = orders;
	}
	@JsonIgnore
	public List<ProductRegisterBean> getRegisterProducts() {
		return registerProducts;
	}
	@JsonIgnore
	public void setRegisterProducts(List<ProductRegisterBean> registerProducts) {
		this.registerProducts = registerProducts;
	}
	@JsonIgnore
	public List<ShoppingcartDetailBean> getShoppingcartDetails() {
		return shoppingcartDetails;
	}
	@JsonIgnore
	public void setShoppingcartDetails(List<ShoppingcartDetailBean> shoppingcartDetails) {
		this.shoppingcartDetails = shoppingcartDetails;
	}
	@JsonIgnore
	public List<LotteryBean> getLotterys() {
		return lotterys;
	}
	@JsonIgnore
	public void setLotterys(List<LotteryBean> lotterys) {
		this.lotterys = lotterys;
	}
	@JsonIgnore
	public ProductSortBean getProductSortBean() {
		return productSortBean;
	}
	@JsonIgnore
	public void setProductSortBean(ProductSortBean productSortBean) {
		this.productSortBean = productSortBean;
	}
	@JsonIgnore
	public Set<WarrantyBean> getWarranty() {
		return warranty;
	}
	@JsonIgnore
	public void setWarranty(Set<WarrantyBean> warranty) {
		this.warranty = warranty;
	}

}
