#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
LIGHT_GRAY='\033[1;30m'
NC='\033[0m' # No Color

function check_status {
  APP_NAME="$1"
  APP_ADDR="$2"
  http --check-status --ignore-stdin --timeout=1.0 \
    "$APP_ADDR" &> /dev/null

  EXIT_CODE=$?
  if [ $EXIT_CODE -eq 0 ]; then
    printf "%-25s ${GREEN}%-13s${NC} ${LIGHT_GRAY}%s${NC}\n" $APP_NAME "UP" $APP_ADDR
    STATUS=
  else
    printf "%-25s ${RED}%-13s${NC} ${LIGHT_GRAY}%s${NC}\n" $APP_NAME "DOWN (${EXIT_CODE}xx)" $APP_ADDR
  fi

}

check_status "receptionist" localhost:8075/policies
check_status "central-system" localhost:8080/sessions
check_status "pricing-service" localhost:8081/policies/12
check_status "transaction-service" localhost:8082/transactions
