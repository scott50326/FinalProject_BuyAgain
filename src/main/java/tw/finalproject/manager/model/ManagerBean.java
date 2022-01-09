package tw.finalproject.manager.model;

import java.sql.Date;
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

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.billboard.model.BillboardBean;

@Entity
@Table(name = "managers")
@Component
public class ManagerBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MANAGERID")
	private Integer managerId;

	@Column(name = "USERID")
	private String userId;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "NAME")
	private String name;

	@Column(name = "REGISTERDATE", insertable = false)
	private Date registerDate;

	@Column(name = "STARS", insertable = false)
	private Integer stars;

	@Column(name = "SCORECOUNT", insertable = false)
	private Integer scoreCount;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managerBean", cascade = CascadeType.ALL)
	private List<BillboardBean> billboards = new ArrayList<BillboardBean>();

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "managerBean2", cascade = CascadeType.ALL)
	private List<BillboardBean> billboards2 = new ArrayList<BillboardBean>();

	public ManagerBean() {
	}

	public ManagerBean(String userId, String password, String name) {
		this.userId = userId;
		this.password = password;
		this.name = name;
	}

	@Override
	public String toString() {
		return "ManagerBean [userId=" + userId + ", password=" + password + ", name=" + name + "]";
	}

	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
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

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Integer getStars() {
		return stars;
	}

	public void setStars(Integer stars) {
		this.stars = stars;
	}

	public Integer getScoreCount() {
		return scoreCount;
	}

	public void setScoreCount(Integer scoreCount) {
		this.scoreCount = scoreCount;
	}

	public List<BillboardBean> getBillboards() {
		return billboards;
	}

	public void setBillboards(List<BillboardBean> billboards) {
		this.billboards = billboards;
	}

	public List<BillboardBean> getBillboards2() {
		return billboards2;
	}

	public void setBillboards2(List<BillboardBean> billboards2) {
		this.billboards2 = billboards2;
	}

}
