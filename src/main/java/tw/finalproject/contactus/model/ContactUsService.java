package tw.finalproject.contactus.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContactUsService {
	@Autowired
	private ContactUsRepository cuResp;

	public ContactUsBean insert(ContactUsBean cus) {
		return cuResp.save(cus);
	}
	
	public ContactUsBean update(ContactUsBean cus) {
		return cuResp.save(cus);
	}

	public void deleteById(Integer id) {
		cuResp.deleteById(id);
	}

	public ContactUsBean findById(Integer id) {
		Optional<ContactUsBean> op1 = cuResp.findById(id);
		if(op1.isPresent()) {
			return op1.get();
		}
		return null;
	}
	
	public List<ContactUsBean> findAll(){
		return cuResp.findAll();
	}
	
}