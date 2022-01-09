package tw.finalproject.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository pdReps;

	public List<ProductBean> findAll() {
		return pdReps.findAll();
	}

	public ProductBean findById(Integer id) {
		Optional<ProductBean> op1 = pdReps.findById(id);

		if (op1.isPresent()) {
			ProductBean pd = op1.get();
			return pd;
		}
		return null;
	}

	public ProductBean insertProduct(ProductBean pdBean) {
		return pdReps.save(pdBean);
	}

	public ProductBean updateProduct(ProductBean pdBean) {
		return pdReps.save(pdBean);
	}

	public void deleteById(Integer id) {
		pdReps.deleteById(id);
	}

	//
	public List<ProductBean> findByproductId(String productId) {

		return pdReps.findByproductId(productId);
	}

	public List<ProductBean> findBysort(Integer sortId) {

		return pdReps.findBysort(sortId);
	}
	
	public List<ProductBean> findByname(String inquire) {
		return pdReps.findByname(inquire);
	}
	public List<ProductBean>findByclickCount(Integer clickCount){
		return pdReps.findByclickCount(clickCount);
	}
	
	public void updateproductIdLook(Integer clickCount,String productId) {
		 pdReps.updateproductIdLook(clickCount,productId);
	}
	
}
