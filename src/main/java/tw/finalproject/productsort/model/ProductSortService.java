package tw.finalproject.productsort.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductSortService {

	@Autowired
	private ProductSortRepository pdsReps;

	public List<ProductSortBean> findAll() {
		return pdsReps.findAll();
	}

	public ProductSortBean findById(Integer id) {
		Optional<ProductSortBean> op1 = pdsReps.findById(id);

		if (op1.isPresent()) {
			ProductSortBean pds = op1.get();
			return pds;
		}
		return null;
	}

	public ProductSortBean insertProductSort(ProductSortBean pdsBean) {
		return pdsReps.save(pdsBean);
	}

	public ProductSortBean updateProductSort(ProductSortBean pdsBean) {
		return pdsReps.save(pdsBean);
	}

	public void deleteById(Integer id) {
		pdsReps.deleteById(id);
	}

}
