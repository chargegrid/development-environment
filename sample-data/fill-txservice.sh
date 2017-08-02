#! /usr/bin/env bash

export PGHOST=localhost
export PGPORT=5432
export PGUSER=txservice
export PGDATABASE=txservice
export PGPASSWORD=txservice

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
psql -f $SCRIPT_DIR/sample-txservice.sql
