#!/usr/bin/env bash
set -euo pipefail

REGION="${AWS_REGION:-us-east-1}"
TOPIC="${TOPIC:-iot/sensor}"
COUNT="${COUNT:-5}"
SLEEP="${SLEEP:-2}"
TEMP_BASE="${TEMP_BASE:-25}"
UMI_BASE="${UMI_BASE:-50}"

echo "Enviando ${COUNT} leituras para ${TOPIC} (região: ${REGION})"
for ((i=0; i<COUNT; i++)); do
  temp=$((TEMP_BASE + i))
  umi=$((UMI_BASE + i))
  payload=$(printf '{"temperatura":%d,"umidade":%d}' "$temp" "$umi")
  aws iot-data publish \
    --topic "${TOPIC}" \
    --payload "${payload}" \
    --region "${REGION}" \
    --cli-binary-format raw-in-base64-out
  echo "Enviado: temperatura=${temp}, umidade=${umi}"
  sleep "${SLEEP}"
done
echo "Concluído."
