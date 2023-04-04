#!/bin/sh
mongoimport --db=lpdiwa --collection=todolistEntries --file=/docker-entrypoint-initdb.d/lpdiwa.json --jsonArray