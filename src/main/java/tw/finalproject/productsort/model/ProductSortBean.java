package tw.finalproject.productsort.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.product.model.ProductBean;

@Entity
@Table(name = "productsorts")
public class ProductSortBean {

	@Id
	@Column(name = "SORTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sortId;

	@Column(name = "SORTNAME")
	private String sortName;
//	@JsonIgnore
	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "productSortBean", cascade = CascadeType.ALL)
	private List<ProductBean> products = new ArrayList<ProductBean>();

	public ProductSortBean() {
	}

	public ProductSortBean(String sortName) {
		this.sortName = sortName;
	}

	@Override
	public String toString() {
		return "ProductSortBean [sortId=" + sortId + ", sortName=" + sortName + "]";
	}

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public List<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(List<ProductBean> products) {
		this.products = products;
	}

}
