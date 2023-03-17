package se.magnus.microservices.core.review.services;

import java.util.List;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import se.magnus.api.core.review.Review;
import se.magnus.microservices.core.review.persistence.read.entities.ReadReviewEntity;
import se.magnus.microservices.core.review.persistence.write.entities.ReviewEntity;

@Mapper(componentModel = "spring")
public interface ReviewMapper {

  @Mappings({
    @Mapping(target = "serviceAddress", ignore = true)
  })
  Review entityToApi(ReviewEntity entity);

  @Mappings({
          @Mapping(target = "serviceAddress", ignore = true)
  })
  Review entityReadToApi(ReadReviewEntity entity);

  @Mappings({
    @Mapping(target = "id", ignore = true),
    @Mapping(target = "version", ignore = true)
  })
  ReviewEntity apiToEntity(Review api);

  @Mappings({
          @Mapping(target = "id", ignore = true),
          @Mapping(target = "version", ignore = true)
  })
  ReadReviewEntity apiReadToEntity(Review api);

  List<Review> entityListToApiList(List<ReviewEntity> entity);

  List<Review> entityReadListToApiList(List<ReadReviewEntity> entity);

  List<ReviewEntity> apiListToEntityList(List<Review> api);
  List<ReadReviewEntity> apiListReadToEntityList(List<Review> api);
}
