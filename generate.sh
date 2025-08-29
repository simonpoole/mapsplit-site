#!/bin/sh

cd

/usr/bin/pyosmium-up-to-date -s 3000 planet-latest.osm.pbf

osmium extract  --set-bounds --overwrite --config osmium.config.json planet-latest.osm.pbf

cat files.lst | parallel -P2 'java -Xmx10G -jar mapsplit-all-0.4.0.jar -tvMm -i pbf/{}.osm.pbf -o msf/{}.msf -f 4000 -z 15 -O 2000 -s 140000000,15000000,2200000 ; mv msf/{}.msf /var/www/mapsplit/{}.msf'
