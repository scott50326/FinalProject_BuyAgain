package tw.finalproject.manager.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.member.model.MemberBean;

@Service
@Transactional
public class ManagerService {

	@Autowired
	private ManagerRepository mngReps;

	public ManagerBean findByUserId(ManagerBean mngBean) {

		String userId = mngBean.getUserId();
		Optional<ManagerBean> op1 = mngReps.findByUserId(userId);

		if (op1.isPresent()) {
			ManagerBean mng = op1.get();

			if (mng.getPassword().equals(mngBean.getPassword())) {
				return mng;
			} else {
				return null;
			}

		}
		return null;
	}

	public ManagerBean findByManagerId(Integer managerId) {
		Optional<ManagerBean> op1 = mngReps.findByManagerId(managerId);
		return op1.get();
	}

	public ManagerBean findByName(String name) {
		Optional<ManagerBean> op1 = mngReps.findByName(name);
		return op1.get();
	}

	public ManagerBean updateManager(ManagerBean mngBean) {
		return mngReps.save(mngBean);
	}

	public ManagerBean findById(Integer id) {
		Optional<ManagerBean> op1 = mngReps.findById(id);
		return op1.get();
	}

	public void deleteById(Integer id) {
		mngReps.deleteById(id);
	}

	public ManagerBean insertManager(ManagerBean mngBean) {
		return mngReps.save(mngBean);
	}

	public List<ManagerBean> findAll() {
		return mngReps.findAll();
	}

	public ManagerBean findManagerBeanByUserId(String userId) {
		return mngReps.findManagerBeanByUserId(userId);
	}
}
