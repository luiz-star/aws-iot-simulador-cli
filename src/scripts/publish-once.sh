#!/usr/bin/env bash
set -euo pipefail

REGION="${AWS_REGION:-us-east-1}"
TOPIC="${TOPIC:-iot/sensor}"
PAYLOAD='{"temperatura":25,"umidade":50}'

echo "Publicando no tópico: ${TOPIC} (região: ${REGION})"
aws iot-data publish \
  --topic "${TOPIC}" \
  --payload "${PAYLOAD}" \
  --region "${REGION}" \
  --cli-binary-format raw-in-base64-out

echo "OK"
