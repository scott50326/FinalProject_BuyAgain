package tw.finalproject.article.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.member.model.MemberBean;

@Service
@Transactional
public class ArticleService {

	@Autowired
	private ArticleRepository atcReps;

	public List<ArticleBean> findAll() {
		return atcReps.findAll();
	}

	public ArticleBean findById(Integer id) {
		Optional<ArticleBean> op1 = atcReps.findById(id);

		if (op1.isPresent()) {
			ArticleBean atc = op1.get();
			return atc;
		}
		return null;
	}

	public ArticleBean insertArticle(ArticleBean atcBean) {
		return atcReps.save(atcBean);
	}

	public ArticleBean updateArticle(ArticleBean atcBean) {
		return atcReps.save(atcBean);
	}

	public void deleteById(Integer id) {
		atcReps.deleteById(id);
	}

	public Page<ArticleBean> findAllArticlesByPage(Pageable pageable) {
		return atcReps.findByOrderByRegisterDateDesc(pageable);
	}

	public List<ArticleBean> findByOrderByRegisterDateDesc() {
		return atcReps.findByOrderByRegisterDateDesc();
	}

	public Page<ArticleBean> findByRULEPage(Pageable pageable) {
		return atcReps.findByRULEPage(pageable);
	}

	public List<ArticleBean> findByRULEPage() {
		return atcReps.findByRULEPage();
	}

	public Page<ArticleBean> findByCPUPage(Pageable pageable) {
		return atcReps.findByCPUPage(pageable);
	}

	public List<ArticleBean> findByCPUPage() {
		return atcReps.findByCPUPage();
	}

	public Page<ArticleBean> findByRAMPage(Pageable pageable) {
		return atcReps.findByRAMPage(pageable);
	}

	public List<ArticleBean> findByRAMPage() {
		return atcReps.findByRAMPage();
	}

	public Page<ArticleBean> findByMBPage(Pageable pageable) {
		return atcReps.findByMBPage(pageable);
	}

	public List<ArticleBean> findByMBPage() {
		return atcReps.findByMBPage();
	}

	public Page<ArticleBean> findByVGAPage(Pageable pageable) {
		return atcReps.findByVGAPage(pageable);
	}

	public List<ArticleBean> findByVGAPage() {
		return atcReps.findByVGAPage();
	}

	public Page<ArticleBean> findBySSDPage(Pageable pageable) {
		return atcReps.findBySSDPage(pageable);
	}

	public List<ArticleBean> findBySSDPage() {
		return atcReps.findBySSDPage();
	}

	public Page<ArticleBean> findBySCREENPage(Pageable pageable) {
		return atcReps.findBySCREENPage(pageable);
	}

	public List<ArticleBean> findBySCREENPage() {
		return atcReps.findBySCREENPage();
	}

	public Page<ArticleBean> findByKEYBOARDPage(Pageable pageable) {
		return atcReps.findByKEYBOARDPage(pageable);
	}

	public List<ArticleBean> findByKEYBOARDPage() {
		return atcReps.findByKEYBOARDPage();
	}

	public Page<ArticleBean> findByMOUSEPage(Pageable pageable) {
		return atcReps.findByMOUSEPage(pageable);
	}

	public List<ArticleBean> findByMOUSEPage() {
		return atcReps.findByMOUSEPage();
	}

	public ArticleBean insertArticles(ArticleBean articles) {
		return atcReps.save(articles);
	}

	public ArticleBean updateArticles(ArticleBean articles) {
		return atcReps.save(articles);
	}

	public void deleteArticles(int articleId) {
		atcReps.deleteById(articleId);
	}
	
	public Page<ArticleBean> findByOrderByTouchDesc(Pageable pageable) {
		return atcReps.findByOrderByTouchDesc(pageable);
	}
	
	public List<ArticleBean> findByOrderByTouchDesc() {
		return atcReps.findByOrderByTouchDesc();
	}
	
	public Page<ArticleBean> findHeaderPage(Pageable pageable, String keyval) {
		return atcReps.findHeaderPage(pageable, keyval);
	}
	
	public ArticleBean findByHeader(String keyval) {
		Optional<ArticleBean> optional = atcReps.findByHeader(keyval);
		if (optional.isEmpty()) {
			return null;
		}
		return optional.get();
	}
    
	public List<ArticleBean> findAllByHeaderContaining(String keyval) {
		return atcReps.findAllByHeaderContaining(keyval);
	}
}
