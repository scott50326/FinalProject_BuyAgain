package tw.finalproject.articlesort.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleSortService {

	@Autowired
	private ArticleSortRepository atcsReps;

	public List<ArticleSortBean> findAll() {
		return atcsReps.findAll();
	}

	public ArticleSortBean findById(Integer id) {
		Optional<ArticleSortBean> op1 = atcsReps.findById(id);

		if (op1.isPresent()) {
			ArticleSortBean atcs = op1.get();
			return atcs;
		}
		return null;
	}

	public ArticleSortBean insertArticleSort(ArticleSortBean atcsBean) {
		return atcsReps.save(atcsBean);
	}

	public ArticleSortBean updateArticleSort(ArticleSortBean atcsBean) {
		return atcsReps.save(atcsBean);
	}

	public void deleteById(Integer id) {
		atcsReps.deleteById(id);
	}

}
