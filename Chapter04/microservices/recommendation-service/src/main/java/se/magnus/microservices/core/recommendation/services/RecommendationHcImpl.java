package se.magnus.microservices.core.recommendation.services;

import org.springframework.web.bind.annotation.RestController;
import se.magnus.api.healthcheck.HealthCheck;
import se.magnus.api.healthcheck.ProductCompositeHc;

@RestController
public class RecommendationHcImpl implements ProductCompositeHc {
    @Override
    public HealthCheck healthCheck() {
        return new HealthCheck("UP");
    }
}
