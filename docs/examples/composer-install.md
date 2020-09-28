# Composer Libraries

Create the empty composer files.

```shell script
echo {} > composer.json && echo {} > composer.lock
```

Create a PHP page using the `alrik11es/cowsayphp` extension.

`mkdir -p src/web && cat > src/web/index.php` (paste from below, then `CTRL+D`)

```html
<?php require('../vendor/autoload.php'); ?>
<!doctype html>
<html lang="en">
<head>
    <title>Sample Page</title>
</head>
<body>
<?php
$cow = \Cowsayphp\Farm::create(\Cowsayphp\Farm\Cow::class);
echo '<pre>'.$cow->say($_GET['message'] ?? 'Send me a ?message= in the URL').'</pre>';
?>
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
      - ./composer.json:/app/composer.json
      - ./composer.lock:/app/composer.lock
      - ./src:/app
```

Start or restart the container.
    
```shell script
docker-compose up -d
```

Run composer require inside the container.

```shell script
docker-compose exec php composer require alrik11es/cowsayphp
```
