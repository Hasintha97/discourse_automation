#!/bin/bash

UNICORN_PORT=3000
DISCOURSE_HOSTNAME=4.188.73.138
DISCOURSE_PATH=/home/azureuser/discourse

SESSION_NAME="discourse"


# Environment variables and command

COMMAND="ALLOW_EMBER_CLI_PROXY_BYPASS=1 \
UNICORN_PORT=$UNICORN_PORT \
UNICORN_BIND_ALL=true \
DISCOURSE_HOSTNAME=$DISCOURSE_HOSTNAME \
$DISCOURSE_PATH/bin/unicorn"

# Start the application in a screen session
screen -dmS "$SESSION_NAME" bash -c "$COMMAND"

echo "Discourse application started in screen session: $SESSION_NAME"

