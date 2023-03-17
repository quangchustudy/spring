package se.magnus.microservices.core.review.persistence.write.repo;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import se.magnus.microservices.core.review.persistence.write.entities.ReviewEntity;

public interface ReviewRepository extends CrudRepository<ReviewEntity, Integer> {

  @Transactional(readOnly = true)
  List<ReviewEntity> findByProductId(int productId);
}
