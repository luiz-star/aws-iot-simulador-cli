# Contribuindo

Obrigado por contribuir! Este guia descreve como abrir issues e PRs, rodar os checks locais e o padrão de commits.

## Requisitos

- Git, Node/Python (se aplicável), Bash
- AWS CLI configurado (para executar a simulação IoT)
- ShellCheck (opcional localmente — a CI roda automaticamente)

## Como começar

1. Faça um fork do repositório e clone seu fork:
   git clone https://github.com/SEU-USUARIO/aws-iot-simulador-cli
   cd aws-iot-simulador-cli

2. Crie um branch:
   git checkout -b feat/nome-da-feature

3. Rode os checks locais (se aplicável):
   shellcheck $(git ls-files | grep -E '\.sh$|^scripts/|^src/scripts/' || true)

4. Commit e push:
   git commit -m "feat: descrição curta da mudança"
   git push origin feat/nome-da-feature

5. Abra um Pull Request apontando para main.

## Padrão de commits (sugerido)

Use o prefixo do Conventional Commits:
- feat: nova funcionalidade
- fix: correção de bug
- docs: documentação
- chore: manutenção (build, deps)
- ci: mudanças na pipeline
- refactor: refatoração sem alterar comportamento
- test: testes

Ex.: feat: gerar gráfico HTML no target make demo

## Linters e CI

- Shellcheck roda em push/PR para main.
- O PR deve passar nos checks para ser aprovado.

## Projetos (Projects)

Issues novas são adicionadas automaticamente ao Project “Portfólio IoT — Roadmap”.
- Status muda para Done quando a issue é fechada.
- Ao reabrir, Status volta para In progress.

## Código de conduta

Seja respeitoso e empático. Não são tolerados comportamentos ofensivos.
