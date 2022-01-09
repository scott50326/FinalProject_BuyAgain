package tw.finalproject.order.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.orderdetail.model.OrderDetailBean;
import tw.finalproject.orderdetail.model.OrderDetailRepository;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository odReps;
	
	@Autowired
	private OrderDetailRepository oddReps;

	public List<OrderBean> findAll() {
		return odReps.findAll();
	}

	public OrderBean findById(Integer id) {
		Optional<OrderBean> op1 = odReps.findById(id);
		if (op1.isPresent()) {
			OrderBean odb = op1.get();
			return odb;
		}
		return null;
	}
	

	public OrderBean insertOrder(OrderBean odBean) {
		return odReps.save(odBean);
	}

	public OrderBean updateOrder(OrderBean odBean) {
		return odReps.save(odBean);
	}

	public void deleteById(Integer id) {
		odReps.deleteById(id);
	}

	//會員訂單資訊		
	public List<OrderBean> findByordermemberId(Integer fk_memberId) {

		return odReps.findByordermemberId(fk_memberId);
	}

	//會員訂單明細		
	public List<OrderBean> findDetails(Integer fk_memberId,String orderId) {

		return odReps.findDetails(fk_memberId,orderId);
	}
}
