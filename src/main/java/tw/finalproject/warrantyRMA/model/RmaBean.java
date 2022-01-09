package tw.finalproject.warrantyRMA.model;

import java.sql.Date;
//import java.util.Date;
import java.util.HashSet;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.product.model.ProductBean;
import tw.finalproject.warranty.model.WarrantyBean;

@Entity
@Table(name = "RMAINFO")
@Component
public class RmaBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "RMAID")
	private Integer rmaId;

	@Column(name = "RMANUMBER")
	private Integer rmanumber;

	@Column(name = "RMADATE", insertable = false)
	private Date rmadate;
	
	@Column(name = "PRODUCTID")
	private String productId;
	
	@Column(name = "RECEIVEPRODUCT")
	private Date receiveproduct;

	@Column(name = "PROCESSINGSTATUS", insertable = false)
	private Integer processingStatus;
	
//	@Column(name = "REGISTERFINISH")
//	private Date registerFinish;
	@Column(name = "SENDOUTDATE")
	private Date sendoutdate;
	
	@Column(name = "SHIPMENTNUMBER")
	private Integer shipmentnumber;
	
	@Column(name = "FK_WARRANTYINFOID", insertable = false, updatable = false) // 新增 更新 省略欄位
	@Transient
	private Integer fk_warrantyInfoid;
	
	@Column(name = "SENDOUTADDRESS")
	private String sendoutaddress;
	
	@Column(name = "RMAREASON")
	private String RMAreason;

	@OneToOne
	@JoinColumn(name = "FK_WARRANTYINFOID")
	private WarrantyBean warrantyBean;

	public RmaBean() {

	}

	public RmaBean(Integer rmaId, Integer rmanumber, Date rmadate, String productId, Date receiveproduct,
			Integer processingStatus, Date sendoutdate, Integer shipmentnumber, Integer fk_warrantyInfoid,
			String sendoutaddress, String rMAreason) {
		super();
		this.rmaId = rmaId;
		this.rmanumber = rmanumber;
		this.rmadate = rmadate;
		this.productId = productId;
		this.receiveproduct = receiveproduct;
		this.processingStatus = processingStatus;
		this.sendoutdate = sendoutdate;
		this.shipmentnumber = shipmentnumber;
		this.sendoutaddress = sendoutaddress;
		this.RMAreason = rMAreason;
	}

	@Override
	public String toString() {
		return "RmaBean [rmaId=" + rmaId + ", rmanumber=" + rmanumber + ", rmadate=" + rmadate + ", productId="
				+ productId + ", receiveproduct=" + receiveproduct + ", processingStatus=" + processingStatus
				+ ", Sendoutdate=" + sendoutdate + ", shipmentnumber=" + shipmentnumber + ", fk_warrantyInfoid="
				+ fk_warrantyInfoid + ", sendoutaddress=" + sendoutaddress + ", RMAreason=" + RMAreason
				+ ", warrantyBean=" + warrantyBean + "]";
	}

	public Integer getRmaId() {
		return rmaId;
	}

	public void setRmaId(Integer rmaId) {
		this.rmaId = rmaId;
	}

	public Integer getRmanumber() {
		return rmanumber;
	}

	public void setRmanumber(Integer rmanumber) {
		this.rmanumber = rmanumber;
	}

	public Date getRmadate() {
		return rmadate;
	}

	public void setRmadate(Date rmadate) {
		this.rmadate = rmadate;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Date getReceiveproduct() {
		return receiveproduct;
	}

	public void setReceiveproduct(Date receiveproduct) {
		this.receiveproduct = receiveproduct;
	}

	public Integer getProcessingStatus() {
		return processingStatus;
	}

	public void setProcessingStatus(Integer processingStatus) {
		this.processingStatus = processingStatus;
	}

	public Date getSendoutdate() {
		return sendoutdate;
	}

	public void setSendoutdate(Date sendoutdate) {
		this.sendoutdate = sendoutdate;
	}

	public Integer getShipmentnumber() {
		return shipmentnumber;
	}

	public void setShipmentnumber(Integer shipmentnumber) {
		this.shipmentnumber = shipmentnumber;
	}

	public Integer getFk_warrantyInfoid() {
		return fk_warrantyInfoid;
	}

	public void setFk_warrantyInfoid(Integer fk_warrantyInfoid) {
		this.fk_warrantyInfoid = fk_warrantyInfoid;
	}

	public String getSendoutaddress() {
		return sendoutaddress;
	}

	public void setSendoutaddress(String sendoutaddress) {
		this.sendoutaddress = sendoutaddress;
	}

	public String getRMAreason() {
		return RMAreason;
	}

	public void setRMAreason(String rMAreason) {
		RMAreason = rMAreason;
	}

	public WarrantyBean getWarrantyBean() {
		return warrantyBean;
	}

	public void setWarrantyBean(WarrantyBean warrantyBean) {
		this.warrantyBean = warrantyBean;
	}

}
