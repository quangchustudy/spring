package se.magnus.microservices.core.review.persistence.read.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;
import se.magnus.microservices.core.review.persistence.read.entities.ReadReviewEntity;
import se.magnus.microservices.core.review.persistence.write.entities.ReviewEntity;

import java.util.List;

public interface ReadReviewRepository extends CrudRepository<ReadReviewEntity, Integer> {

  @Transactional(readOnly = true)
  List<ReadReviewEntity> findByProductId(int productId);
}
