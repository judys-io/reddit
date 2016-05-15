#!/bin/bash

set -x
set -e

ID=$1

cat <<DUMP_THINGDATA | ./run-query.sh
SET enable_bitmapscan=false;

\\copy (SELECT thing_id, key, value FROM reddit_data_link WHERE thing_id=$ID) to 'input/link_$ID.dump';
DUMP_THINGDATA
