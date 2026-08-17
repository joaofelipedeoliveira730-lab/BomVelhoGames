# UNO50

Versão 3.1.0 — jogo UNO multiplayer com modo solo, bots, salas online, ranking, loja, inventário, mapas e histórico de partidas.

## Render
- Runtime: Node
- Build Command: `npm install`
- Start Command: `node server.js`
- Variáveis obrigatórias: `DATABASE_URL`, `JWT_SECRET`, `CEO_INITIAL_PASSWORD`

## Banco
O servidor aplica `schema.sql` e `seed.sql` automaticamente quando `DATABASE_URL` está configurada. Também existe `npm run migrate` para aplicação manual.

## Teste local sem PostgreSQL
O servidor possui fallback para `database.json` quando `DATABASE_URL` não está definida.
