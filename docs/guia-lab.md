# Simulando Dispositivo IoT no AWS CloudShell (CLI)

## Objetivos de ensino
- Criação de dispositivo (Thing) no AWS IoT Core.
- Simulação de envio de dados via AWS CloudShell e AWS CLI.
- Visualização de mensagens em tempo real no Cliente de Teste MQTT.
- Automação de envio de leituras usando Bash Script.

## Contexto
Sua organização precisa validar o envio de telemetria de sensores na nuvem AWS. Usaremos AWS IoT Core + MQTT + CloudShell para simular um dispositivo virtual chamado “SimuladorCLI”.

## Diagrama de arquitetura
- Imagem: diagrama-aws-iot.png
- Fluxo: CloudShell/AWS CLI publica no tópico MQTT `iot/sensor` → AWS IoT Core → Cliente de Teste MQTT assina `iot/sensor`.

Diagrama em Mermaid (renderiza no GitHub):
```mermaid
flowchart LR
  A[CloudShell / AWS CLI] -- publish iot/sensor --> B[AWS IoT Core (MQTT)]
  C[Cliente de Teste MQTT] -- subscribe iot/sensor --> B
