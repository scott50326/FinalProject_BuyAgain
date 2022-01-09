package tw.finalproject.billboard.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BillboardService {

	@Autowired
	private BillboardRepository bbReps;

	public List<BillboardBean> findAll() {
		return bbReps.findAll();
	}

	public BillboardBean findById(Integer id) {
		Optional<BillboardBean> op1 = bbReps.findById(id);
		if (op1.isPresent()) {
			BillboardBean bb = op1.get();
			return bb;
		}
		return null;
	}
	
	public BillboardBean findByPublisher(String publisher) {
		Optional<BillboardBean> op1 = bbReps.findByPublisher(publisher);
		if (op1.isPresent()) {
			BillboardBean bb = op1.get();
			return bb;
		}
		return null;
	}

	public BillboardBean insertBillboard(BillboardBean mbBean) {
		return bbReps.save(mbBean);
	}

	public BillboardBean updateBillboard(BillboardBean mbBean) {
		return bbReps.save(mbBean);
	}

	public void deleteById(Integer id) {
		bbReps.deleteById(id);
	}

}
