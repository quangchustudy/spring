package se.magnus.api.healthcheck;

import org.springframework.web.bind.annotation.GetMapping;

public interface ProductCompositeHc {
    @GetMapping(
            value = "/health",
            produces = "application/json"
    )
    HealthCheck healthCheck();
}
