# aws-iot-simulador-cli
Simulação de dispositivo IoT no AWS CloudShell/CLI com MQTT
Este repositório guia você a criar um Thing no AWS IoT Core, publicar mensagens via AWS CLI, visualizar em tempo real no Cliente de Teste MQTT e automatizar leituras com Bash. Inclui scripts, diagrama, tabela de parâmetros e dados para gráfico.

Sumário

Objetivos
Arquitetura
Pré-requisitos
Guia rápido
Scripts
Dados e gráfico
Guia detalhado
Estrutura do repositório
Variáveis e personalização
Limpeza
Licença
Objetivos

Criar um dispositivo (Thing) no AWS IoT Core.
Publicar dados de sensor via AWS CLI no CloudShell.
Visualizar mensagens em tempo real no Cliente de Teste MQTT.
Automatizar envio de leituras com Bash Script.
Arquitetura

Diagrama em imagem: docs/diagrama-aws-iot.png
Diagrama em Mermaid (renderizado no GitHub):

flowchart LR
  A[CloudShell / AWS CLI] -- publish iot/sensor --> B[AWS IoT Core (MQTT)]
  C[Cliente de Teste MQTT] -- subscribe iot/sensor --> B

Pré-requisitos

Conta AWS com acesso ao AWS IoT Core e CloudShell.
AWS CLI v2 (o CloudShell já possui).
Região alinhada (ex.: us-east-1).
Permissão de iot:Publish no tópico iot/sensor pela identidade do CloudShell.
Guia rápido

Criar Thing
AWS IoT Core → Gerenciar → Todos os dispositivos → Coisas → Criar coisas.
Criar uma coisa única → Nome: SimuladorCLI → concluir sem certificados (para este lab).
Cliente de Teste MQTT
AWS IoT Core → Testar → Cliente de teste MQTT → Assinar o tópico iot/sensor.
CloudShell: clonar e executar
git clone https://github.com/luiz-star/aws-iot-simulador-cli.git
cd aws-iot-simulador-cli
chmod +x src/scripts/*.sh
bash src/scripts/publish-once.sh
bash src/scripts/publish-loop.sh
Scripts

Envio único: src/scripts/publish-once.sh
Envio contínuo: src/scripts/publish-loop.sh
Personalize por variáveis de ambiente:

export AWS_REGION=us-east-1
export TOPIC=iot/sensor
export COUNT=5
export SLEEP=2
export TEMP_BASE=25
export UMI_BASE=50
Exemplos:

TOPIC="iot/sensor/dev" bash src/scripts/publish-once.sh
COUNT=10 SLEEP=1 bash src/scripts/publish-loop.sh
Dados e gráfico

Tabela de parâmetros: assets/tabela-parametros.md
CSV de leituras simuladas: assets/grafico-exemplo.csv
Gráfico (opcional): assets/grafico-linhas.png

gnuplot -e "set term png size 900,500; set output 'assets/grafico-linhas.png'; set datafile separator ','; set key left top; set grid; set title 'Leituras simuladas'; set xlabel 'Iteração'; set ylabel 'Valor'; plot 'assets/grafico-exemplo.csv' using 1:2 with linespoints title 'Temperatura', 'assets/grafico-exemplo.csv' using 1:3 with linespoints title 'Umidade';"

Guia detalhado

Passo a passo completo do laboratório (derivado do documento “AWS IOT.docx”): docs/guia-lab.md
Estrutura do repositório

docs/
guia-lab.md
diagrama-aws-iot.png
src/
scripts/
publish-once.sh
publish-loop.sh
assets/
grafico-exemplo.csv
grafico-linhas.png
tabela-parametros.md
.gitignore
LICENSE
README.md
Observações importantes

Este lab usa as credenciais do usuário no CloudShell para publicar no IoT Core; não exige certificado do Thing.
Garanta que a região do CloudShell seja a mesma do IoT Core.
Se você usar um tópico diferente de iot/sensor, ajuste nos scripts ou exporte TOPIC antes de rodar.
Limpeza

AWS IoT Core → Gerenciar → Coisas → selecione SimuladorCLI → Excluir.
Licença

Consulte LICENSE (Apache-2.0 ou a licença definida no repositório).
Links rápidos

Guia do lab: docs/guia-lab.md
Diagrama: docs/diagrama-aws-iot.png
Scripts: src/scripts/publish-once.sh | src/scripts/publish-loop.sh
Tabela de parâmetros: assets/tabela-parametros.md
CSV e gráfico: assets/grafico-exemplo.csv | assets/grafico-linhas.png

  
