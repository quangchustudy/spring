package se.magnus.microservices.core.review.services;

import org.springframework.web.bind.annotation.RestController;
import se.magnus.api.healthcheck.HealthCheck;
import se.magnus.api.healthcheck.ProductCompositeHc;

@RestController
public class ReviewHcImpl implements ProductCompositeHc {
    @Override
    public HealthCheck healthCheck() {
        return new HealthCheck("UP");
    }
}
