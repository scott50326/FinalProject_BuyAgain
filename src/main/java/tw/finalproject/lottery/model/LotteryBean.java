package tw.finalproject.lottery.model;

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

import com.fasterxml.jackson.annotation.JsonBackReference;

import tw.finalproject.member.model.MemberBean;
import tw.finalproject.product.model.ProductBean;

@Entity
@Table(name = "lotterys")
public class LotteryBean {

	@Id
	@Column(name = "LOTTERYID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer lotteryId;

	@Column(name = "FK_PRODUCTID", insertable = false)
	@Transient
	private Integer fk_productId;

	@Column(name = "FK_MEMBERID", insertable = false)
	@Transient
	private Integer fk_memberId;

	@Column(name = "REGISTERDATE")
	private Date registerDate;

	@Column(name = "STATE")
	private Integer state;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_PRODUCTID")
	private ProductBean productBean;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FK_MEMBERID")
	private MemberBean memberBean;

	public LotteryBean() {
	}

	@Override
	public String toString() {
		return "LotteryBean [lotteryId=" + lotteryId + ", fk_productId=" + fk_productId + ", fk_memberId=" + fk_memberId
				+ ", registerDate=" + registerDate + "]";
	}

	public Integer getLotteryId() {
		return lotteryId;
	}

	public void setLotteryId(Integer lotteryId) {
		this.lotteryId = lotteryId;
	}

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

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
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

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

}
