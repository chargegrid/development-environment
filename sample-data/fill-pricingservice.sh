#! /usr/bin/env bash

export PGHOST=localhost
export PGPORT=5434
export PGUSER=prservice
export PGDATABASE=prservice
export PGPASSWORD=prservice

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
psql -f $SCRIPT_DIR/sample-pricingservice.sql
