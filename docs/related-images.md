# Related Images

## MySQL Database Server

MySQL is a relational database management system.

```yaml
version: '3'
services:
  db:
    image: percona:8.0
    command: --character-set-server=utf8 --collation-server=utf8_general_ci --default-authentication-plugin=mysql_native_password --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,IGNORE_SPACE,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,PIPES_AS_CONCAT,REAL_AS_FLOAT"
    environment:
      - MYSQL_USER=app
      - MYSQL_DATABASE=app
      - MYSQL_PASSWORD=app
      - MYSQL_ROOT_PASSWORD=root
    volumes:
      - ./build/mysql.cnf:/etc/percona-server.conf.d/zzz-app-last.cnf
    #ports:
    #  - 3306:3306
```

## Redis Cache Server

Redis is an in-memory data management system.

```yaml
version: '3'
services:
  redis:
    image: redis:5.0-alpine
    entrypoint: redis-server /etc/redis/redis.conf
    volumes:
      - ./build/redis.conf:/etc/redis/redis.conf
    #ports:
    #  - 6379:6379
```

## Gearman Message Queue

Gearman is a message queue that distributes tasks to multiple computers.

```yaml
version: '3'
services:
  gearman:
    image: cornernote/gearman
    #ports:
    #  - 4730:4730
```

## Shinken Monitoring Service

Shinken is computer monitoring software compatible with Nagios.

```yaml
version: '3'
services:
  skinken:
    image: cornernote/shinken
```

