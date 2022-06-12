#!/bin/bash

SOURCE="source"
ACTIVE="active"
FAILED="failed"
SONGS_COUNT=3

until [ -z "$(ls -A $SOURCE)" ]
do
    for file in $(ls -p $SOURCE | grep -v / | tail -n$SONGS_COUNT)
    do
        mv $SOURCE/$file $ACTIVE/
    done

    bash start.sh

    for file in $(ls -p $ACTIVE)
    do
        mv $ACTIVE/$file $FAILED/
    done
done
