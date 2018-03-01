# Try Drupal
---

## Want to quickly see how Drupal works?

This repo was created to make easy to spinning up Drupal sites.

### Clone repository
```
git clone https://github.com/weknowinc/try-drupal
```

### Copy and rename then `.env.dist` file
```
cp .env.dist app/.env
```

### Edit configuration
Edit the copied `app/.env` file and make changes according to your project needs.

Example update default `HOST_NAME` from `weknowinc.develop` to `mysite.develop`.

### Starting the containers
To start the containers you need to execute the following command docker-compose up -d, grab some coffee or a beer and be patient while the images are downloaded to your local computer.
```
docker-compose start -d
```
NOTE: We suggest provide the detached mode flag to run in background.

### Download and install Drupal
```
docker-compose exec --user=82 php ../shell/get-drupal.sh
```

### Stoping the containers
```
docker-compose stop

docker-compose stop -v
```
NOTE: You can pass the -v flag to destroy the shared volumes as well. Be careful this will destroy any data on the shared volumes between the container and the local machine.

### Checking for used ports
One common issue you'll likely run into while starting the containers, is finding the ports in use, this could mean an instance of Apache, Nginx, MySQL or other service is already running, so if you want to know what is using the ports you can run this commands on your terminal:

```
# web (Apache, Nginx)
lsof -i :80

# db (MySQL, MariaDB)
lsof -i :3306
```
