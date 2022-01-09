package tw.finalproject.message.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.finalproject.article.model.ArticleBean;

@Service
@Transactional
public class MessageService {

	@Autowired
	private MessageRepository msgReps;

	public List<MessageBean> findAll() {
		return msgReps.findAll();
	}

	public MessageBean findById(Integer id) {
		Optional<MessageBean> op1 = msgReps.findById(id);

		if (op1.isPresent()) {
			MessageBean msg = op1.get();
			return msg;
		}
		return null;
	}

	public MessageBean insertMessage(MessageBean msgBean) {
		return msgReps.save(msgBean);
	}

	public MessageBean updateMessage(MessageBean msgBean) {
		return msgReps.save(msgBean);
	}

	public void deleteById(Integer id) {
		msgReps.deleteById(id);
	}

	public MessageBean insertMessages(MessageBean messageBean) {
		return msgReps.save(messageBean);
	}

	public List<MessageBean> findByArticleId(ArticleBean id) {
		List<MessageBean> optional = msgReps.findByArticleBean(id);
		return optional;
	}

	public void deleteMessages(int messageId) {
		msgReps.deleteById(messageId);
	}

	public MessageBean updateMessages(MessageBean messageIdBean) {
		return msgReps.save(messageIdBean);
	}
}
