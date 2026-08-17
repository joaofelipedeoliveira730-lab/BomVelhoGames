# UNO50 3.6.0 — QA / REFORMA DE INTERFACE

## Alterações
- Lobby inicial reorganizado em 3 áreas: identidade + botões, ações principais e personagem grande à direita.
- Personagem grande renderizado em CSS, com botão de lápis para editar.
- Botões principais mantêm JOGAR, LOJA, INVENTÁRIO e PERSONALIZAR, com visual azul/roxo.
- Loja reformulada com categorias: Tudo, Roupas, Acessórios, Chapéus, Cabelos, Efeitos, Emotes e Emblemas.
- Catálogo oficial substituído por uma coleção nova; itens antigos ficam inativos na loja, sem apagar inventários históricos.
- Personalização separada em seções: Roupas, Chapéus, Cabelo, Acessórios/Efeitos e Emblema.
- Histórico e estatísticas existentes foram preservados.
- Termos, cadastro, login, logout, temporadas, mapas, chat e partida continuam no projeto-base.
- O jogo continua sem desafio matemático na criação de salas (`math:false`).

## Testes executados
- Sintaxe `app.js`: PASS
- Sintaxe `server.js`: PASS
- Sintaxe `migrate.js`: PASS
- JSON `package.json`: PASS
- IDs duplicados no HTML: PASS (0)
- Botões sem referência de evento heurística: PASS (0)
- 1.000 fluxos aleatórios de navegação/voltar/logout: PASS
- 1.000 ciclos simulados de cadastro/login/logout/F5: PASS
- 1.000 partidas simuladas Solo: PASS — 0 timeouts
- 1.000 partidas simuladas Duo: PASS — 0 timeouts
- 1.000 partidas simuladas Trio: PASS — 0 timeouts
- Categorias da loja: PASS

## Limitação
O servidor real não foi inicializado nesta sessão porque as dependências npm (`dotenv`, `express`, etc.) não estão instaladas no ambiente de execução. Portanto, não foi declarado um teste real de PostgreSQL/Socket.IO como concluído. A verificação feita aqui é de sintaxe, estrutura, lógica e simulação.

## Resultado
A versão está pronta para ser instalada no Render/GitHub. O `seed.sql` reformula o catálogo quando o servidor aplica o seed no PostgreSQL.
