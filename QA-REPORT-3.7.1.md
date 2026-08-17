# UNO50 3.7.1 — Correção do servidor ainda inicializando

## Problema observado
Na tela de cadastro/login aparecia “Servidor ainda está inicializando. Tente novamente em alguns segundos.”. Isso significa que `databaseReady` não chegava a `true`, então `/api/register` e `/api/login` eram bloqueados por `requireDatabase`.

## Correções
- PostgreSQL estrutural agora fica pronto antes das rotinas administrativas opcionais.
- Falha no seed da loja não derruba Login/Cadastro; fica registrada no log do servidor.
- Falta de `CEO_INITIAL_PASSWORD` não derruba o jogo inteiro; o CEO fica pendente até a variável ser configurada.
- Inicialização tenta novamente até 8 vezes com espera progressiva quando o PostgreSQL estiver temporariamente indisponível.
- Service Worker continua sem cachear `/api/*` e `/socket.io/*`, evitando sessão/inventário antigos após F5.
- Logout continua limpando sessão, caches e URL.

## Verificações locais
- `node --check server.js`: PASS
- `package.json`: PASS
- Service Worker sem cache de API: PASS
- Logout limpa estado/caches: PASS

## Observação
Não foi possível executar uma partida real contra o PostgreSQL/Socket.IO nesta máquina porque as dependências npm não estão instaladas e o acesso de instalação tem limite de rede. O teste final deve ser feito no Render.
