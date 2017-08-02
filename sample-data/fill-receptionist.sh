#! /usr/bin/env bash

export PGHOST=localhost
export PGPORT=5435
export PGUSER=receptionist
export PGDATABASE=receptionist
export PGPASSWORD=receptionist

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
psql -f $SCRIPT_DIR/sample-receptionist.sql
