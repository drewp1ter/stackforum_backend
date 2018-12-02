#!/usr/bin/env bash
set -e

echo "Removing old server pid's if any..."
if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

echo "Checking bundle dependencies..."
bundle check || bundle install
bundle exec rails server -p 4000 -b 0.0.0.0

#trap "service cron stop; exit" SIGINT SIGTERM
#exec "$@"