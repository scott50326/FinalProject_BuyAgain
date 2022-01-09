package tw.finalproject.articlesort.model;

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

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.finalproject.article.model.ArticleBean;

@Entity
@Table(name = "articlesorts")
public class ArticleSortBean {

	@Id
	@Column(name = "SORTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer sortId;

	@Column(name = "SORTNAME")
	private String sortName;

	@JsonManagedReference
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleSortBean", cascade = CascadeType.ALL)
	private List<ArticleBean> articles = new ArrayList<ArticleBean>();

	public ArticleSortBean() {
	}

	public ArticleSortBean(String sortName) {
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

	public List<ArticleBean> getArticles() {
		return articles;
	}

	public void setArticles(List<ArticleBean> articles) {
		this.articles = articles;
	}

}
