# Try Drupal

## Want to quickly see how Drupal works?

This repo was created to make easy to spinning up Drupal sites.

### Clone repository
```
git clone https://github.com/weknowinc/try-drupal
```

### Copy and rename the `.env.dist` file
```
cp .env.dist .env
```

### Edit configuration
Edit the copied `.env` file and make changes according to your project needs.

Example update default `HOST_NAME` from `drupal.develop` to `mysite.develop`.

### Starting the containers
To start the containers you need to execute the following command docker-compose up -d, grab some coffee or a beer and be patient while the images are downloaded to your local computer.
```
docker-compose up -d
```
NOTE: We suggest provide the detached mode flag to run in background.

### Download and install Drupal
```
docker-compose exec --user=82 php shell/init.sh
```

### Add hostname entry in your `/etc/hosts` file
```
127.0.0.1    drupal.develop
```
NOTE: Use your own domain if you make changes in the copied `.env` file.

Open your browser and point to `http://drupal.develop/` or the hostname you entered on the `.env` file.

### Shutting down the containers
```
docker-compose down

docker-compose down -v
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

We based the docker configuration of this repository on the [Drupal4Docker](https://github.com/wodby/docker4drupal) project.
