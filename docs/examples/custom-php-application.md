# Custom PHP Application

You can add your own PHP application.

`mkdir -p src/web && cat > src/web/index.php` (paste from below, then `CTRL+D`)

```html
<!doctype html>
<html lang="en">
<head>
    <title>Sample Page</title>
</head>
<body>
<?= 'Hello World!' ?>
</body>
</html>
```

Update your application definition.

`cat > docker-compose.yml` (paste from below, the `CTRL+D`)

```yaml
version: '3'
services:
  php:
    image: cornernote/php
    ports:
      - 80:80
    volumes:
      - ./src:/app
```

Start or restart the stack.
    
```shell script
docker-compose up -d
```
