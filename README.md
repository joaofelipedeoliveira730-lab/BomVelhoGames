# UNO50

Versão 3.2.0 — jogo UNO multiplayer com modo solo, bots, salas online, ranking, loja, inventário, mapas e histórico de partidas.

## Render
- Runtime: Node
- Build Command: `npm install`
- Start Command: `node server.js`
- Variáveis obrigatórias: `DATABASE_URL`, `JWT_SECRET`, `CEO_INITIAL_PASSWORD`

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
