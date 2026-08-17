# UNO50

Versão 3.2.0 — jogo UNO multiplayer com modo solo, bots, salas online, ranking, loja, inventário, mapas e histórico de partidas.

## Render
- Runtime: Node
- Build Command: `npm install`
- Start Command: `node server.js`
- Variáveis obrigatórias: `DATABASE_URL`, `JWT_SECRET`

## Banco
O servidor aplica `schema.sql` e `seed.sql` automaticamente quando `DATABASE_URL` está configurada. Também existe `npm run migrate` para aplicação manual.

## Teste local sem PostgreSQL
O servidor possui fallback para `database.json` quando `DATABASE_URL` não está definida.


## Segurança e correções da versão 3.2.0
- Sessão autenticada somente por cookie HttpOnly; o JWT não é devolvido ao JavaScript nem colocado na URL.
- Em produção o cookie usa `__Host-uv_session` + `Secure` + `SameSite=Lax`.
- O servidor não deriva mais o segredo JWT de `DATABASE_URL`; `JWT_SECRET` fraco/ausente bloqueia produção.
- O servidor não expõe mais `server.js`, `schema.sql`, `.env.example` ou outros arquivos do projeto via `express.static`.
- Parâmetros sensíveis na URL são removidos/recusados para evitar credenciais em links.
- Cache offline deixou de bloquear a entrada no jogo; mapas são carregados sob demanda.
- Corrigido o escopo quebrado do JavaScript que impedia `DOMContentLoaded -> init()` de executar.
- Reconexão de sala após troca de orientação/recarregamento foi adicionada.
- Turnos online têm watchdog de tempo para impedir partidas travadas.
- Regras de +2/+4 são validadas no servidor.
- Mapa Pirata foi incluído como recurso leve em SVG.

### Testes realizados
- `node --check app.js`: PASS
- `node --check server.js`: PASS
- 140 partidas simuladas online (2 a 8 jogadores, com e sem empilhamento): PASS
- 150 partidas simuladas solo (Fácil/Médio/Difícil): PASS
- Baralho: 108 cartas e 108 IDs únicos: PASS
- Verificação estática de sessão, URL, cache, reconexão, timeout e exposição de arquivos: PASS

> O ambiente de testes desta entrega não conseguiu concluir `npm install` por timeout de rede, então a execução real do processo Node + PostgreSQL/Render ainda deve ser validada no Render após o deploy.


## Banco de dados novo

Esta versão não cria mais a conta `CeoVelho` automaticamente e não carrega contas de teste. O banco começa sem jogadores: o primeiro usuário deve tocar em **CADASTRAR** na tela de login.

Para zerar completamente um PostgreSQL existente uma única vez, execute:

```bash

```

O comando apaga todas as tabelas do schema `public`, recria a estrutura e reaplica somente o catálogo estático do jogo. **Ele é destrutivo e não deve ser executado novamente depois que jogadores começarem a usar o banco.**

Depois do reset, inicie normalmente com `npm start`. O servidor não executa o reset automaticamente.

### Fluxo de autenticação

- `ENTRAR NA CONTA` continua sendo o botão principal.
- `CADASTRAR` fica diretamente abaixo do botão Entrar.
- O cadastro abre somente quando o jogador toca em `CADASTRAR`.
- Usuário e senha são enviados por `POST` e a sessão fica em cookie `HttpOnly`; credenciais não são colocadas na URL.
