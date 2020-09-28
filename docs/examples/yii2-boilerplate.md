# Yii2 Boilerplate

Create the empty composer files.

```shell script
echo {} > composer.json && echo {} > composer.lock
```

Create a docker-compose application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:

  php:
    image: cornernote/php
    ports:
      - 80:80
    volumes:
      - ./composer.json:/app/composer.json
      - ./composer.lock:/app/composer.lock
      - ./src:/app
  db:
    image: percona:8.0
    command: --character-set-server=utf8 --collation-server=utf8_general_ci --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,IGNORE_SPACE,NO_ENGINE_SUBSTITUTION,NO_ZERO_DATE,NO_ZERO_IN_DATE,PIPES_AS_CONCAT,REAL_AS_FLOAT"
    environment:
      - MYSQL_USER=test
      - MYSQL_DATABASE=test
      - MYSQL_PASSWORD=test
      - MYSQL_ROOT_PASSWORD=root

  redis:
    image: redis:5.0-alpine
```

Start the container.
    
```shell script
docker-compose up -d
```

Run `docker-compose exec php bash` to create the project using composer inside the container.

To avoid error "Project directory is not empty., create the project in a temporary folder and move it to the app folder.

```shell script
composer create-project --stability=dev cornernote/yii2-boilerplate tmp
mv tmp/* .
mv tmp/.* .
cat tmp/composer.json > composer.json
cat tmp/composer.lock > composer.lock
rm -f tmp
cp .env-dist .env
```
