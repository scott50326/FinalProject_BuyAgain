package tw.finalproject.member.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
	
	@Autowired
	private MemberRepository memReps;
	
	public List<MemberBean> findAll() {
		return memReps.findAll();
	}

	public MemberBean findByUserId(MemberBean memBean) {
		
		String userId = memBean.getUserId();
		Optional<MemberBean> op1 = memReps.findByUserId(userId);
		
		if (op1.isPresent()) {
			MemberBean mem = op1.get();
			
			if (mem.getPassword().equals(memBean.getPassword())) {
				return mem;
			} else {
				return null;
			}
			
		}
		return null;
	}

	public MemberBean insertMember(MemberBean mbBean) {
		
		return memReps.save(mbBean);
	}
	
	
//	public boolean checkLogin(MemberBean mem) {
//		return mDao.checkLogin(mem);
//	}
//
//	public List<MemberBean> findAll() {
//		return mDao.findAll();
//	}
//	
	public void deleteById(Integer id) {
		memReps.deleteById(id);
	}
//	
//	public MemberBean insertMember(Integer mbId, MemberBean mem) {
//		return mDao.insertMember(mbId, mem);
//	}
//	
//	public MemberBean updateMember(Integer mbId, MemberBean mem) {
//		return mDao.updateMember(mbId, mem);
//	}

	public MemberBean findById(Integer id) {
		Optional<MemberBean> op1 = memReps.findById(id);
		if (op1.isPresent()) {
			MemberBean mem = op1.get();
			return mem;
		}
		
		return null;
	}
	
	
	public MemberBean findByMemberId(Integer id) {
		
		Optional<MemberBean> op1 = memReps.findByMemberId(id);
		
		if (op1.isPresent()) {
			MemberBean mem = op1.get();
			return mem;
		}
		
		return null;
	}
	
	public List<MemberBean> findByRank(Integer rank) {
		List<MemberBean> members = memReps.findByRank(rank);
		return members;
	}
	
	public List<MemberBean> findByNameLike(String similarName) {
		List<MemberBean> members = memReps.findByNameLike(similarName);
		return members;
	}

	public MemberBean updateMember(MemberBean mbBean) {
		return memReps.save(mbBean);
	}
	
	public MemberBean findCheckId(String userId) {
		return memReps.findCheckId(userId);
	}

	public MemberBean findEmail(String email) {
		return memReps.findEmail(email);
	}
	
	public Integer spendToRank(Integer spend) {
		Integer rank = 1;
		if (spend >= 5000) {
			rank = 2;
			if (spend >= 10000) {
				rank = 3;
				if (spend >= 20000) {
					rank = 4;
					if (spend >= 50000) {
						rank = 5;
					}
				}
			}
		}
		return rank;
	}
	
	public MemberBean findLotteryMemberId() {
		return memReps.findLotteryMemberId();
	}
}
