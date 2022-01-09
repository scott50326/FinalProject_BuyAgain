package tw.finalproject.lottery.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LotteryService {

	@Autowired
	private LotteryRepository ltrReps;

	public List<LotteryBean> findAll() {
		return ltrReps.findAll();
	}

	public LotteryBean findById(Integer id) {
		Optional<LotteryBean> op1 = ltrReps.findById(id);
		if (op1.isPresent()) {
			LotteryBean ltrb = op1.get();
			return ltrb;
		}
		return null;
	}
	

	public LotteryBean insertOrder(LotteryBean ltrBean) {
		return ltrReps.save(ltrBean);
	}

	public LotteryBean updateOrder(LotteryBean ltrBean) {
		return ltrReps.save(ltrBean);
	}

	public void deleteById(Integer id) {
		ltrReps.deleteById(id);
	}

	public ArrayList<Integer> LotteryBeanMemberId(){
		return ltrReps.LotteryBeanMemberId();
	}
	
	public ArrayList<LotteryBean> findByState(Integer state){
		return ltrReps.findByState(state);
	}
}
