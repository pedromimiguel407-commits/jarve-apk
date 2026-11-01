# Relatório 2.2.1 — o que foi corrigido e o que NÃO foi verificado

Pedido: "resolva todos os 29 bugs". Não havia lista de 29 bugs; foi feita uma revisão completa do código
e os defeitos reais encontrados estão em `CORE/CHANGELOG.md` (seção 2.2.1). O número real encontrado foi
maior que 29 (cerca de 40 itens, contando separadamente build, segurança, backend, frontend e Android).
Se você tinha uma lista específica, envie para conferirmos item a item.

## Verificado neste ambiente (Node 22, sem internet)
- Sintaxe de todos os .mjs/.cjs/.js (`npm run lint`), `bash -n` nos scripts, JSON/XML/YAML válidos.
- 39 testes unitários passam (`tests/unit`), incluindo 7 arquivos novos. Rodados contra o código ORIGINAL,
  19 dos 23 testes novos falham — ou seja, eles realmente pegam os bugs.
- Provedor Ollama e OpenAI-compatible testados contra servidores HTTP falsos (stream, erro, timeout, cancelamento).
- Rotas (memória, chat, configurações, arquivos, diagnóstico, pesquisa, tarefas, conversas, preview, CORS, admin):
  24 + 4 cenários exercitados chamando os handlers diretamente com um Express SIMULADO (stub local, não incluído).
- Correção do `sed` do `GERAR_APK.sh` testada de verdade (JDK 21 → detecta 21).

## NÃO verificado (seja cético)
- **Servidor Express real**: `npm install` não funciona aqui (sem rede). `tests/integration/*` (incluindo o novo
  `hardening.test.mjs`) não foram executados. O workflow agora roda `npm test` antes de compilar; se algo falhar, aparecerá lá.
- **Nenhum EXE, AppImage, DEB ou APK foi gerado.**
- **Electron ^37**: troquei do 33 porque o Electron 33 embute Node 20 e não tem `node:sqlite`. Não consegui
  baixar nem executar o Electron para confirmar. Se o electron-builder reclamar da versão, ajuste `devDependencies.electron`
  para qualquer Electron cujo Node seja ≥ 22.13.
- **Android**: o código Java (seletor de arquivos) foi revisado mas não compilado (sem javac/Android SDK aqui).
- `author.email` e `homepage` no package.json são placeholders — troque pelos seus.
- "Exportar" arquivo dentro do APK usa download por blob, que o WebView do Android não suporta; não alterado.
- A memória (`/api/memory`) é só um cadastro: o chat ainda não injeta as memórias nas respostas. Não alterado (seria recurso novo).

## Limpeza
Documentos legados movidos (não apagados) para `DOCUMENTACAO/arquivo-antigo/`. Um deles afirmava "0 bugs / 30 testes
aprovados", o que não era verdade.

## Revisão adicional (reempacotamento)
- Corrigida referência quebrada em `LEIA-PRIMEIRO.txt` (apontava para um relatório inexistente).
- 39/39 testes unitários passam (Node 22.23; `dotenv` substituído por stub apenas no teste).
- Sintaxe Express 5 das rotas revisada (`/mobile/*path` está correta); versões 2.2.1 consistentes em package.json, env.mjs, index.html, Gradle e scripts.
- Ainda NÃO executado: testes de integração com Express real (o registro npm estava bloqueado neste ambiente). Rode `cd CORE && npm install && npm test` na sua máquina ou deixe o workflow do GitHub fazer isso.

## Executor HTML (JARVES_EXECUTOR.html)
Verificado em Chromium real abrindo o arquivo por `file://`, com um Ollama FALSO (servidor HTTP de teste, nao o Ollama de verdade):
lista de modelos, chat com streaming, botao Parar, persistencia apos recarregar, historico no contexto, memoria, arquivos,
configuracoes (chave mascarada), tarefas, provedor mock, erro claro com Ollama desligado, diagnostico, abas sem erro de JS.
NAO verificado: Ollama real (confirme que aceita pedidos de `file://`; se nao, inicie com `OLLAMA_ORIGINS=*`), APIs externas
reais (podem bloquear CORS), Safari/Firefox. Sem pesquisa web e sem diagnostico de codigo do servidor neste modo.

## Executor HTML - rodada 2 (a partir de um print no Firefox/Linux)
Cenarios testados em Chromium com servidor falso: Ollama desligado, ligado sem CORS, ligado com CORS, e modo demonstracao.
Firefox nao esta instalado neste ambiente: o comportamento no Firefox NAO foi testado aqui (so visto no print enviado).
