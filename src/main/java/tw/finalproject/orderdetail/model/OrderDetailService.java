package tw.finalproject.orderdetail.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class OrderDetailService {

	@Autowired
	private OrderDetailRepository oddReps;

	public List<OrderDetailBean> findAll() {
		return oddReps.findAll();
	}

	public OrderDetailBean findById(Integer id) {
		Optional<OrderDetailBean> op1 = oddReps.findById(id);
		if (op1.isPresent()) {
			OrderDetailBean oddb = op1.get();
			return oddb;
		}
		return null;
	}
	

	public OrderDetailBean insertOrder(OrderDetailBean oddBean) {
		return oddReps.save(oddBean);
	}

	public OrderDetailBean updateOrder(OrderDetailBean oddBean) {
		return oddReps.save(oddBean);
	}

	public void deleteById(Integer id) {
		oddReps.deleteById(id);
	}
	
}
