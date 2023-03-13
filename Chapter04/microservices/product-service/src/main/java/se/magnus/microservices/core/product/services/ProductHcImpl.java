package se.magnus.microservices.core.product.services;

import org.springframework.web.bind.annotation.RestController;
import se.magnus.api.healthcheck.HealthCheck;
import se.magnus.api.healthcheck.ProductCompositeHc;

@RestController
public class ProductHcImpl implements ProductCompositeHc {
    @Override
    public HealthCheck healthCheck() {
        return new HealthCheck("UP");
    }
}
