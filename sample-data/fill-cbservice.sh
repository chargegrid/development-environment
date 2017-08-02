#! /usr/bin/env bash

export PGHOST=localhost
export PGPORT=5433
export PGUSER=cbservice
export PGDATABASE=cbservice
export PGPASSWORD=cbservice

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
psql -f $SCRIPT_DIR/sample-cbservice.sql
