package tw.finalproject.warranty.model;

import java.sql.Date;

//import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.productsort.model.ProductSortBean;
import tw.finalproject.warrantyRMA.model.RmaBean;

@Entity
@Table(name = "WARRANTYINFO")
@Component
public class WarrantyBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "WARRANTYINFOID")
	private Integer warrantyInfoId;

	@Column(name = "REGISTERID")
	private String registerid;

	@Column(name = "REGISTERSTART")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date registerStart;
	
	@Column(name = "REGISTERFINISH")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date registerFinish;
	
	@Column(name = "REGISTERSTATUS")
	private Integer registerStatus;
	
	@Column(name = "FK_PRODUCTID", insertable = false, updatable = false) // 新增 修改忽略
	@Transient
	private Integer fk_productId;
	
	@Column(name = "FK_MEMBERID", insertable = false, updatable = false)
	@Transient
	private Integer fk_memberId;
	
	@Column(name = "INVOICE")
	private String invoice;
	// 1209
//	@OneToOne
//	@JoinColumn(name = "FK_WARRANTYINFOID")
//	private RmaBean rmaBean;

//	public RmaBean getRmaBean() {
//		return rmaBean;
//	}
//
//	public void setRmaBean(RmaBean rmaBean) {
//		this.rmaBean = rmaBean;
//	}

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_PRODUCTID")
	private ProductBean productBean;

	public Integer getFk_productId() {
		return fk_productId;
	}

	public void setFk_productId(Integer fk_productId) {
		this.fk_productId = fk_productId;
	}

	public Integer getFk_memberId() {
		return fk_memberId;
	}

	public void setFk_memberId(Integer fk_memberId) {
		this.fk_memberId = fk_memberId;
	}

	public WarrantyBean() {

	}

	public WarrantyBean(Integer warrantyInfoId, Integer fk_memberId, String registerid, Integer fk_productId,
			Date registerStart, Date registerFinish, Integer registerStatus, MemberBean memberBean,
			ProductBean productBean) {
		super();
		this.warrantyInfoId = warrantyInfoId;
		this.registerid = registerid;
		this.registerStart = registerStart;
		this.registerFinish = registerFinish;
		this.registerStatus = registerStatus;

	}

	@Override
	public String toString() {
		return "WarrantyBean [warrantyInfoId=" + warrantyInfoId + ", registerid=" + registerid + ", registerStart="
				+ registerStart + ", registerFinish=" + registerFinish + ", registerStatus=" + registerStatus
				+ ", fk_productId=" + fk_productId + ", fk_memberId=" + fk_memberId + ", invoice=" + invoice
				+ ", memberBean=" + memberBean + ", productBean=" + productBean + "]";
	}

	public Integer getWarrantyInfoId() {
		return warrantyInfoId;
	}

	public void setWarrantyInfoId(Integer warrantyInfoId) {
		this.warrantyInfoId = warrantyInfoId;
	}

	public Date getRegisterStart() {
		return registerStart;
	}

	public void setRegisterStart(Date registerStart) {
		this.registerStart = registerStart;
	}

	public Date getRegisterFinish() {
		return registerFinish;
	}

	public void setRegisterFinish(Date registerFinish) {
		this.registerFinish = registerFinish;
	}

	public Integer getRegisterStatus() {
		return registerStatus;
	}

	public void setRegisterStatus(Integer registerStatus) {
		this.registerStatus = registerStatus;
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

	public String getRegisterid() {
		return registerid;
	}

	public void setRegisterid(String registerid) {
		this.registerid = registerid;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

}
