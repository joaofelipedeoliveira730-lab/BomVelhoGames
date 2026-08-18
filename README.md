# UNO50

Projeto UNO50 pronto para GitHub + Render + PostgreSQL.

## Arquivos principais
- `index.html` — interface completa.
- `style.css` — layout responsivo para computador, celular, paisagem e retrato.
- `app.js` — navegação, login, cadastro, loja, inventário, personalização, modo clássico e chat.
- `server.js` — autenticação, PostgreSQL, partidas, proteção de ações, chat e área CEO.
- `schema.sql` — banco não destrutivo e compatibilidade com bancos antigos.
- `seed.sql` — catálogo inicial e itens.
- `assets/maps/` — mapas leves em SVG.

## Render
Runtime: Node
Build Command: `npm install`
Start Command: `node server.js`

Variáveis obrigatórias:
- `DATABASE_URL`
- `JWT_SECRET` — use uma chave longa e aleatória.
- `CEO_INITIAL_PASSWORD` — usada somente para criar `CeoVelho` se ele ainda não existir; o servidor não apaga contas existentes.

## Segurança importante
A senha nunca é colocada na URL. A sessão principal usa cookie `HttpOnly`.
O schema corrige bancos antigos em que `profiles.password_hash` estava como `NOT NULL`, evitando o erro de salvamento do personagem.

## Modo clássico
JOGAR → MODO CLÁSSICO → SOLO / DUO / TRIO → procura aleatória de até 20 segundos → Partida encontrada → contagem 5, 4, 3, 2, 1 → mesa.
Não existe dificuldade no modo clássico.

## Banco
Não existe reset automático de banco no deploy. O bootstrap do CEO somente cria `CeoVelho` quando necessário.
