package tw.finalproject.billboard.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BillboardRepository extends JpaRepository<BillboardBean, Integer> {

	public Optional<BillboardBean> findByPublisher(String publisher);
}
