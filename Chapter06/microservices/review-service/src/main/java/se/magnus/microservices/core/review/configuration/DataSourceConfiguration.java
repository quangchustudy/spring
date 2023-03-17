//package se.magnus.microservices.core.review.configuration;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.boot.jdbc.DataSourceBuilder;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Primary;
//import org.springframework.jdbc.datasource.DataSourceTransactionManager;
//
//import javax.sql.DataSource;
//
//@Configuration
//public class DataSourceConfiguration {
//    @Bean(name = "writer")
//    @Primary
//    @ConfigurationProperties("database1.datasource")
//    public DataSource writerDataSource() {
//        return DataSourceBuilder.create().build();
//    }
//
//    @Bean(name = "reader")
//    @ConfigurationProperties("database2.datasource")
//    public DataSource readerDataSource() {
//        return DataSourceBuilder.create().build();
//    }
//
//    @Bean(name = "tm1")
//    @Autowired
//    @Primary
//    DataSourceTransactionManager tm1(@Qualifier ("writer") DataSource dataSource) {
//        DataSourceTransactionManager txm = new DataSourceTransactionManager(dataSource);
//        return txm;
//    }
//    @Bean(name = "tm1")
//    @Autowired
//    @Primary
//    DataSourceTransactionManager tm2(@Qualifier ("reader") DataSource dataSource) {
//        DataSourceTransactionManager txm = new DataSourceTransactionManager(dataSource);
//        return txm;
//    }
//}
