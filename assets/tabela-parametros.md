# Parâmetros do comando aws iot-data publish

- aws iot-data publish: publica no tópico MQTT do AWS IoT Core.
- --topic "iot/sensor": tópico de destino.
- --payload '{"temperatura":25,"umidade":50}': mensagem JSON.
- --region us-east-1: região AWS.
- --cli-binary-format raw-in-base64-out: envia JSON puro (CLI v2).
