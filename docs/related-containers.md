# Related Containers

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
# these can be within the same host, or on different hosts
version: '3'
services:

  db:
    image: percona:8.0
    command: --character-set-server=utf8 --collation-server=utf8_general_ci --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,IGNORE_SPACE,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,PIPES_AS_CONCAT,REAL_AS_FLOAT"
    environment:
      - MYSQL_USER=test
      - MYSQL_DATABASE=test
      - MYSQL_PASSWORD=test
      - MYSQL_ROOT_PASSWORD=root
    #ports:
    #  - 3306:3306

  redis:
    image: redis:5.0-alpine
    #ports:
    #  - 6379:6379

  gearman:
    image: cornernote/gearman
    #ports:
    #  - 4730:4730
```

```yaml
# monitor the stack from a different host
version: '3'
services:
  skinken:
    image: cornernote/shinken
```

