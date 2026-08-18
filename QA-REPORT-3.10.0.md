# UNO50 3.10.0 — Regra sagrada de identidades

## Implementado
- 20 personas fictícias de bot, com nomes de jogador, avatares, acessórios, níveis e prestígios variados.
- Três estilos internos de IA: fácil, médio e difícil.
- Nomes duplicados evitados dentro da mesma partida.
- `isBot`, `botStyle` e `botPersonaId` permanecem somente no servidor.
- `roomSummary` e `game:state` não expõem `isBot`.
- Tela de carregamento de partida real mostra somente `🌐 JOGADOR`, nome, nível, prestígio e personagem.
- Vitória de bot usa o nome da persona, nunca `BOT` ou `Oponente`.
- Modo Solo/Treinamento é a única tela que informa explicitamente `🤖 BOT DE TREINAMENTO`.
- Nenhum asset novo foi criado nesta alteração; os personagens continuam sendo renderizados em CSS.

## Verificações locais
- `node --check server.js`: PASS
- `node --check app.js`: PASS
- Busca por `isBot` no app do navegador: PASS — nenhuma ocorrência.
- Propriedades internas de bot não aparecem em `publicPlayer`/`safeGameFor`: PASS.
- Perfis de bot usam classes de avatar existentes no CSS: PASS.

## Limitação
Não foi executado um multiplayer real com PostgreSQL/Render neste ambiente. O teste final de partida deve ser feito após publicar no Render.
