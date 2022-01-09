package tw.finalproject.billboard.model;

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

import tw.finalproject.manager.model.ManagerBean;

@Entity
@Table(name = "billboards")
@Component
public class BillboardBean {

	@Id
	@Column(name = "BILLBOARDID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer billboardId;

	@Column(name = "PUBLISHERID", insertable = false, updatable = false)
	@Transient
	private Integer publisherId;

	@Column(name = "PUBLISHER")
	private String publisher;

	@Column(name = "CONTENT")
	private String content;

	@Column(name = "REGISTERDATE", insertable = false)
	private Date registerDate;

	@Column(name = "LASTUPDATEMANAGERID", insertable = false, updatable = false)
	private Integer lastUpdateManagerId;

	@Column(name = "LASTUPDATEMANAGER")
	private String lastUpdateManager;

	@Column(name = "LASTUPDATETIME")
	private Date lastUpdateTime;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "PUBLISHERID")
	private ManagerBean managerBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "LASTUPDATEMANAGERID")
	private ManagerBean managerBean2;

	public BillboardBean() {
	}

	public BillboardBean(Integer publisherId, String content) {
		super();
		this.publisherId = publisherId;
		this.content = content;
	}

	@Override
	public String toString() {
		return "BillboardBean [billboardId=" + billboardId + ", publisher=" + publisher + ", content=" + content
				+ ", RegisterDate=" + registerDate + ", lastUpdateManager=" + lastUpdateManager + ", lastUpdateTime="
				+ lastUpdateTime + ", managerBean=" + managerBean + ", managerBean2=" + managerBean2 + "]";
	}

	public Integer getBillboardId() {
		return billboardId;
	}

	public void setBillboardId(Integer billboardId) {
		this.billboardId = billboardId;
	}

	public Integer getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getLastUpdateManagerId() {
		return lastUpdateManagerId;
	}

	public void setLastUpdateManagerId(Integer lastUpdateManagerId) {
		this.lastUpdateManagerId = lastUpdateManagerId;
	}

	public String getLastUpdateManager() {
		return lastUpdateManager;
	}

	public void setLastUpdateManager(String lastUpdateManager) {
		this.lastUpdateManager = lastUpdateManager;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public ManagerBean getManagerBean() {
		return managerBean;
	}

	public void setManagerBean(ManagerBean managerBean) {
		this.managerBean = managerBean;
	}

	public ManagerBean getManagerBean2() {
		return managerBean2;
	}

	public void setManagerBean2(ManagerBean managerBean2) {
		this.managerBean2 = managerBean2;
	}

}
