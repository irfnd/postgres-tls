#!/bin/bash
set -e

# Add certificate files
echo "$SERVER_CRT" > /var/lib/postgresql/server.crt
echo "$SERVER_KEY" > /var/lib/postgresql/server.key
echo "$ROOT_CA_CRT" > /var/lib/postgresql/ca.crt

# Update file permissions of certificates
chmod 600 /var/lib/postgresql/server.* /var/lib/postgresql/ca.crt
chown postgres:postgres /var/lib/postgresql/server.* /var/lib/postgresql/ca.crt

# Run the base entrypoint
docker-entrypoint.sh postgres 
