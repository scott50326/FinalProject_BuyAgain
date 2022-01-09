package tw.finalproject.article.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.finalproject.member.model.MemberBean;

public interface ArticleRepository extends JpaRepository<ArticleBean, Integer> {

	boolean ture = false;

	public Page<ArticleBean> findByOrderByRegisterDateDesc(Pageable pageable);

	public List<ArticleBean> findByOrderByRegisterDateDesc();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=1 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByRULEPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=1 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByRULEPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=2 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByVGAPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=2 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByVGAPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=3 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByCPUPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=3 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByCPUPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=4 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByRAMPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=4 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByRAMPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=5 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByMBPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=5 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByMBPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=6 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findBySSDPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=6 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findBySSDPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=7 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findBySCREENPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=7 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findBySCREENPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=8 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByKEYBOARDPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=8 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByKEYBOARDPage();

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=9 ORDER BY e.registerDate DESC")
	public Page<ArticleBean> findByMOUSEPage(Pageable pageable);

	@Query("SELECT e FROM ArticleBean e WHERE e.articleSortBean.sortId=9 ORDER BY e.registerDate DESC")
	public List<ArticleBean> findByMOUSEPage();

	public Page<ArticleBean> findByOrderByTouchDesc(Pageable pageable);

	public List<ArticleBean> findByOrderByTouchDesc();
	
	 @Query(value="select * from Articles where HEADER like concat('%',:keyval,'%') ORDER BY registerDate DESC",nativeQuery = true)
	public Page<ArticleBean> findHeaderPage(Pageable pageable, String keyval);
	
	public List<ArticleBean> findAllByHeaderContaining(String keyval); 
	
	public Optional<ArticleBean> findByHeader(String keyval);

}
