#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
#heroku plugins:install heroku-container-registry
#heroku plugins:install @heroku-cli/plugin-container-registry
snap install heroku --classic
docker login  -u _ --password=$HEROKU_API_KEY registry.heroku.com
heroku container:push web4 --app $HEROKU_APP_NAME
heroku container:release web4 --app $HEROKU_APP_NAME
heroku ps:scale web4=1 --app $HEROKU_APP_NAME
#heroku ps:scale web3=1

