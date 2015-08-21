#!/bin/bash

SLOW_QUERIES=`mysql -s -e 'SELECT USER, HOST, DB, COMMAND, TIME, STATE, INFO FROM INFORMATION_SCHEMA.PROCESSLIST WHERE COMMAND = "Query" AND Time > 30'`
EXIT_STATUS=`echo "$SLOW_QUERIES" | wc -l`
echo "$SLOW_QUERIES" | sed -e "s/[[:space:]]\+/ /g"
exit $EXIT_STATUS
