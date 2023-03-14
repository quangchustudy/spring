package se.magnus.api.healthcheck;

public class HealthCheck {
    private String status;

    public HealthCheck(String status) {
        this.status = status;
    }

    public String getStatus() {
		return status;
    }
}
