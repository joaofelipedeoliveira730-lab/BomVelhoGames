# Uno Velho Matematixa — correções 2026-08-17

## O que foi corrigido
- Histórico de partidas com rota `/api/history` para eliminar a tela vazia/erro de comunicação quando o histórico é aberto.
- Botões principais maiores, com tipografia e efeitos de pressão/hover mais fortes.
- Personagem CSS reestruturado: proporções melhores, cabeça/corpo/roupa/acessórios mais estáveis e acessórios com posicionamento corrigido.
- Cartas sem `?` quando o tipo é conhecido: +2, +4, COR, bloqueio e reverso recebem identificação visual.
- Busca de partida: contador começa em 0, vai até 20 segundos e depois usa números variáveis enquanto continua procurando.
- Boneco animado durante a espera da partida.
- Botão Voltar do celular: navegação interna primeiro; ao voltar para o lobby, duas pressões são necessárias para sair do site.
- Central CEO restaurada e exclusiva para `CeoVelho`: pesquisa de jogador, limpar inventário, zerar ouro, zerar XP, suspensão com motivo, banimento, alteração de pódio, duração, temporada, paralisar/retomar, partidas ativas, nomes dos jogadores, encerramento de partida e denúncias.
- CEO é excluído do ranking e não pode receber colocação no pódio.
- Emblema animado `DONO DO JOGO` para o CEO.
- Histórico online passou a registrar início/fim das partidas em `matches`/`match_players`.
- Configurações de duração e temporada foram adicionadas de forma não destrutiva ao `global_game_state`.

## Assets e pastas
**Não foi criada nem alterada nenhuma pasta `assets/` nesta correção.** O pacote preserva o princípio de manter os assets visuais existentes do projeto. Ao substituir arquivos no GitHub, mantenha a pasta `assets/` que já existe no seu projeto.

## Arquivos principais alterados
- `index.html`
- `style.css`
- `app.js`
- `server.js`
- `schema.sql`
- `package.json`
- `migrate.js`
- `service-worker.js`

## Testes executados
- `node --check server.js` — OK
- `node --check app.js` — OK
- parser HTML — OK
- verificação de IDs duplicados — OK
- validação de `package.json` — OK

O teste de execução local completo não foi possível neste ambiente porque as dependências npm (`dotenv`, etc.) não estavam instaladas; `npm install` ultrapassou o limite de execução disponível. No Render, o `npm install` do deploy instala as dependências normalmente.
