#!/bin/sh

function validate_url() {
  if wget --spider ${DRUPAL_RELEASE_DOWNLOAD} -q; then
    return 0
  else
    return 1
  fi
}

function download() {
  if validate_url; then
    echo "Downloading ${DRUPAL_RELEASE_DOWNLOAD}"
    wget -qO- ${DRUPAL_RELEASE_DOWNLOAD} | tar xz -C /var/www/html/ --strip-components 1
    echo "Download completed"
    return 0
  else
    return 1
  fi
}

if [ ! -f "/var/www/html/composer.json" ]; then
  if download; then
    break
  else
    rm -rf /tmp/drupal
    echo "Cloning repository ${DRUPAL_REPOSITORY_NAME}"
    git clone ${DRUPAL_REPOSITORY_NAME} --branch ${DRUPAL_REPOSITORY_BRANCH} /tmp/drupal
    echo "Clone completed"
    cp -R /tmp/drupal/* /var/www/html/
    rm -rf .git
    echo "Installing dependencies"
    composer install --no-interaction
    echo "Install completed"
    break
  fi
fi

exit 0
