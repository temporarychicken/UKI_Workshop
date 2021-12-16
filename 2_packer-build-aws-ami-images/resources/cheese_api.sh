#!/bin/sh

cat > /tmp/cheese.conf <<EOF
server {
    root /usr/share/nginx/html;

    default_type  text/json;
    listen       8088 ;
    server_name  apibackend;



   location = /beemster {
        return 200 '{  "name": "Beemster",  "country": "Holland",  "region": "North",  "notes": {    "texture": "hard",    "flavour": "smooth/creamy"  } }';
    }
    location = /cheddar {
        return 200 '{  "name": "Cheddar",  "country": "England",  "region": "Somerset",  "notes": {    "texture": "firm",    "flavour": "mature"  } }';
    }
    location = /emmental {
        return 200 '{  "name": "Emmental",  "country": "Switzerland",  "region": "Canton Bern",  "notes": {    "texture": "soft",    "flavour": "savoury/mild"  } }';
    }
    location = /gouda {
        return 200 '{  "name": "Gouda",  "country": "Holland",  "region": "South",  "notes": {    "texture": "soft",    "flavour": "soapy"  } }';
    }
    location = /wensleydale {
        return 200 '{  "name": "Wensleydale",  "country": "England",  "region": "North Yorkshire",  "notes": {    "texture": "crumbly/moist",    "flavour": "honey/acidic"  } }';
    }


}
EOF

sudo mv /tmp/cheese.conf /etc/nginx/conf.d/cheese.conf
sudo nginx -s reload
