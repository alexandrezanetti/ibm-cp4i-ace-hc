#!/bin/bash
export ACEUSERNAME=admin
export ACEPASSWORD=admin
export ACEHASh=$(echo '{"authType":"BASIC_AUTH","credentials":{"username":"${ACEUSERNAME}","password":"${ACEPASSWORD}"}}' | base64)

echo "ACEUSERNAME: ${ACEUSERNAME}"
echo "ACEPASSWORD: ${ACEPASSWORD}"
