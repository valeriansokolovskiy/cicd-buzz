#!/bin/sh
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
#heroku plugins:install heroku-container-registry
#heroku plugins:install @heroku-cli/plugin-container-registry
docker login  -u _ --password=$HEROKU_API_KEY registry.heroku.com
heroku container:push web3 --app $HEROKU_APP_NAME
heroku container:release web3
#heroku ps:scale web3=1

