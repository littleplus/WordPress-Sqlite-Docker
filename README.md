# WordPress Sqlite Docker
A Docker for wordpress with sqlite db support

# Quick start
# Start
Following command will mount wordpress directory to your host /data/wordpress and bind your host's port 8080 to container.
```
docker run -it -d --name wordpress -v /data/wordpress:/var/www -p 8080:80 littleplus/wordpress:sqlite
```

## Stop
```
docker stop wordpress
```

## Delete(after stop)
Even delete the container, your wordpress data will keep in your host's disk.
```
docker rm wordpress
```
