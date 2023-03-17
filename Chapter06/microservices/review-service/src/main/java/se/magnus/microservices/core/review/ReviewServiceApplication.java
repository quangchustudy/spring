package se.magnus.microservices.core.review;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("se.magnus")
public class ReviewServiceApplication {

  private static final Logger LOG = LoggerFactory.getLogger(ReviewServiceApplication.class);

  public static void main(String[] args) {
    ConfigurableApplicationContext ctx = SpringApplication.run(ReviewServiceApplication.class, args);

    String mysqlUriWriter = ctx.getEnvironment().getProperty("spring.datasource.jdbc-url");
    String mysqlUriReader = ctx.getEnvironment().getProperty("spring.read.jdbc-url");
    LOG.info("Connected to readMySQL: " + mysqlUriReader);
    LOG.info("Connected to writeMySQL: " + mysqlUriWriter);
  }
}
