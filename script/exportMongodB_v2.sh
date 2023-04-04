#!/bin/sh

#on sauvegarde l'ancienne version de l'export si elle existe
if [ -f ../databasesInit/mongo/dev/lpdiwa.json ]; then
    cp ../databasesInit/mongo/dev/lpdiwa.json ../databasesInit/mongo/dev/lpdiwa_bkup.json
fi

./dcTool dev exec mongodb mongoexport --db=lpdiwa --collection=todolistEntries --out=/tmp/lpdiwa.json --jsonArray
./dcTool dev cp mongodb:/tmp/lpdiwa.json ../databasesInit/mongo/dev/lpdiwa.json