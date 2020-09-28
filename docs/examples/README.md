# Examples

You can try this image on any system with `docker-compose` installed.  Alternatively you can create a free instance on [Play with Docker](http://labs.play-with-docker.com/).


* [Basic Server](basic-server.md)
* [Custom PHP Application](custom-php-application.md)
* [Composer Install](composer-install.md)
* [Single Container Deploy](single-container-deploy.md)
* [Multiple Container Deploy](multiple-container-deploy.md)


## Troubleshooting

### Viewing Logs

When all else fails, check the logs.

```shell script
docker-compose logs -f
```

### Missing Port Link

If the link to the exposed port does not show then you can determine it from the SSH link provided.  Simply convert the link as follows then visit the page.

Change:

```shell script
ssh EXAMPLE@direct.labs.play-with-docker.com
```

To:

```
http://EXAMPLE-80.direct.labs.play-with-docker.com
```

