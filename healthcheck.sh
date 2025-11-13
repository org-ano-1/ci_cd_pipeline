#!/bin/bash

URL="http://localhost:3000/health"
MAX_RETRIES=10
RETRY_INTERVAL=5

for ((i=1; i<=MAX_RETRIES; i++)); do
  echo "Health check attempt $i/$MAX_RETRIES"
  RESPONSE=$(curl -s $URL)
  STATUS=$(echo $RESPONSE | jq -r '.status' 2>/dev/null)

  if [ "$STATUS" == "healthy" ]; then
    echo "Health check passed"
    exit 0
  fi

  if [ $i -lt $MAX_RETRIES ]; then
    echo "Health check failed, retrying in $RETRY_INTERVAL seconds..."
    sleep $RETRY_INTERVAL
  fi
done

echo "Health check failed after $MAX_RETRIES attempts"
exit 1