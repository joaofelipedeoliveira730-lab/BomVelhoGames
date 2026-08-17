# UNO50 3.7.0 — QA e correções

## Corrigido
- Logout agora limpa sessão do cliente e o Service Worker não armazena respostas de `/api/*`.
- Inventário/loja não ficam presos em resposta antiga de cache.
- Compra atualiza inventário e perfil antes de abrir a personalização.
- Equipar cosmético exige que o item esteja no inventário; CEO pode equipar seus itens exclusivos.
- Loja normal exibe apenas itens com preço a partir de 200 moedas; catálogo chega até 15.000.
- Central CEO exclusiva, com denúncias, temporada, busca de jogador, ações administrativas, partidas em andamento e pausa global.
- CEO não entra no ranking/pódio.
- CEO pode limpar o próprio ouro/inventário.
- CEO possui emblema exclusivo `title_owner` / `DONO DO JOGO` e acesso ao catálogo completo.
- Colocação administrativa do pódio é persistida em `users.admin_rank` e é zerada na nova temporada.
- Partidas encerradas pelo CEO são marcadas como `stopped` no histórico quando PostgreSQL está ativo.
- Bots/oponentes não são identificados como bots na interface da partida; nomes internos ficam somente no servidor.
- Botões de preenchimento/dificuldade usam linguagem de “oponente”/“preenchimento automático”.
- Configuração para usar celular em paisagem adicionada.

## Testes executados
- `node --check server.js` — PASS
- `node --check app.js` — PASS
- IDs HTML duplicados — PASS (0)
- referências principais de scripts/assets — PASS
- Service Worker: API fora do cache — PASS
- ranking exclui CEO — PASS
- endpoints administrativos presentes e protegidos por `requireRole('CEO')` — PASS
- filtro de loja normal mínimo 200 — PASS
- catálogo com item de 15.000 — PASS

## Limitação
O ambiente desta execução não tinha as dependências npm instaladas e o `npm install` atingiu timeout de rede. Portanto, não foi possível executar uma partida real com PostgreSQL/Socket.IO nesta sessão. O pacote precisa ser validado no Render com as variáveis de ambiente e banco reais antes de produção.
