# Composer Libraries

Create the composer files

`echo {} > composer.lock && cat > composer.json` (paste from below, the `CTRL+D`)

```json
{
    "require": {
        "alrik11es/cowsayphp": "1.2.*"
    }
}
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

Start or restart the stack.
    
```shell script
docker-compose up -d
```

Run composer install inside the container

```shell script
docker-compose exec php composer install
```

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
