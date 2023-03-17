package se.magnus.microservices.composite.product.services;

import org.springframework.web.bind.annotation.RestController;
import se.magnus.api.healthcheck.HealthCheck;
import se.magnus.api.healthcheck.ProductCompositeHc;

@RestController
public class ProductCompositeHcImpl implements ProductCompositeHc {
    @Override
    public HealthCheck healthCheck() {
        return new HealthCheck("UP");
    }
}
