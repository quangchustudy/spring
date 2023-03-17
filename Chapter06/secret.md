#ssh tunnel
```shell
ssh -i "dev.pem" -L 27017:docdb-2023-03-14-13-50-53.cluster-cltvrdi2i5ee.ap-southeast-1.docdb.amazonaws.com:27017 ec2-user@ec2-13-229-207-202.ap-southeast-1.compute.amazonaws.com -N
```

```shell
mongo --sslAllowInvalidHostnames --ssl --sslCAFile rds-combined-ca-bundle.pem --username quangchu --password mongodb123$
```

```shell
mongo  --username quangchu --password mongodb123$
```

```yaml
  uri: mongodb://quangchu:mongodb123$@docdb-2023-03-14-13-50-53.cluster-cltvrdi2i5ee.ap-southeast-1.docdb.amazonaws.com:27017/?replicaSet=rs0&readPreference=secondaryPreferred&retryWrites=false
  database: product-db
```

https://aws.amazon.com/blogs/database/integrate-your-spring-boot-application-with-amazon-documentdb/


