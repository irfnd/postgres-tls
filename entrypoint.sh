#!/bin/bash
set -e

# Add certificate files
echo "$SERVER_CRT" > /etc/dokploy/certs/postgres/server.crt
echo "$SERVER_KEY" > /etc/dokploy/certs/postgres/server.key
echo "$ROOT_CA_CRT" > /etc/dokploy/certs/postgres/ca.crt

# Update file permissions of certificates
chmod 600 /etc/dokploy/certs/postgres/server.* /etc/dokploy/certs/postgres/ca.crt
chown postgres:postgres /etc/dokploy/certs/postgres/server.* /etc/dokploy/certs/postgres/ca.crt

# Run the base entrypoint
docker-entrypoint.sh postgres
