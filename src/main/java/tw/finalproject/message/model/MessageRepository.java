package tw.finalproject.message.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.finalproject.article.model.ArticleBean;

public interface MessageRepository extends JpaRepository<MessageBean, Integer> {

	public List<MessageBean> findByArticleBean(ArticleBean articleBean);
}
