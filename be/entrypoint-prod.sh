#!/bin/sh

cd /app

# nc = "netcat", a tool to test network connections
# -z = "zero-I/O mode", just checks if the port is open (does NOT send any data)

# This loop keeps trying to connect to the database service (host: postgres, port: 5432)
# until it's ready. Once the connection works, the loop ends.
echo "⏳ waiting for postgres to be ready..."
until pg_isready -h postgres -p 5432 >/dev/null 2>&1; do
  sleep 1
done

echo "postgresql is ready. running seed script..."
/seedcmd

echo "🚀 starting main app..."
exec /myapp