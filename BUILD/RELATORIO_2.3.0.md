# JARVES AI 2.3.0 "Sol" — Relatório de correções e novidades (01/11/2026)

## Novidades
- **Aba Gerador (motor Sol 6.1, 100% grátis/offline):** descreve → plano → arquivos → pré-visualização → baixar. Gera **imagens** (SVG + PNG: céu, sol/lua, estrelas, montanhas, mar, cidade, floresta; cada texto gera uma arte diferente), **jogos HTML** (cobrinha, pong, velha, memória), **sites** (index.html + style.css + script.js), **apps** (tarefas, calculadora). Botões: baixar arquivo, **baixar tudo (.zip)**, **salvar em "Arquivos e código"** (conecta o HTML à pasta/armazenamento). Opção "IA do Ollama" gera HTML livre com o modelo, com queda automática para o motor base.
- **APK fundido:** o app (IA base + Gerador + chat) vai **dentro do APK** (`assets/jarves.html`) e funciona offline, sem servidor. Ponte Android salva zip/png/html em *Downloads/JARVES*. O Ollama do PC pode ser usado pela rede (Configurações → `http://IP-DO-PC:11434`).
- IA base, provedor `auto`, `think:false` e remoção de limites (da versão 2.2.2) mantidos.

## Bugs/erros corrigidos
1. Respostas vazias do qwen3.5 (raciocínio consumia os tokens) → `think:false`, 8192+ tokens.
2. Ficava preso no modo "mock" → padrão `auto`, migração automática.
3. Sem IA com Ollama desligado → IA base + queda automática com aviso.
4. APK exigia servidor e URL digitada, e não baixava arquivos → app embutido + ponte de download.
5. Downloads por `<a download>` não funcionam no WebView → `AndroidBridge.saveFile`.
6. Motor de teste/limites antigos (mensagem 100k, upload 8–10 MB) → removidos (512 MB).
7. Restos inúteis removidos (relatórios/HTML antigos, BUILD_STATUS, node_modules, data).
8. Versão unificada em 2.3.0 (app, APK versionCode 5, service worker, docs).
9. Fonte única do motor base (`executor/base-engine.js` copiado para o frontend no build).

## Testes
74 testes automáticos passando (69 originais adaptados + 5 novos). Aba Gerador testada em jsdom (abre, gera imagem e site).

## NÃO verificado / limites honestos
- **O APK NÃO foi compilado aqui** (o servidor não alcança o Android SDK/Gradle do Google). O projeto está pronto: no GitHub rode o workflow *Native builds* (job android-apk) ou, num PC com JDK 17 + Android SDK 34, `bash ANDROID_APK/GERAR_APK.sh` → `OUTPUT/JARVES-AI-2.3.0-debug.apk`. O código Java novo não foi compilado nem rodado num celular.
- **Instalador .exe único** também não (precisa Wine 32-bit); entregue a pasta Windows com `JARVES AI.exe` (não executada num Windows real). No Windows: `PC_WINDOWS/GERAR_EXE.bat`.
- "Codex 6.1 Sol" aqui é um motor próprio de templates procedurais: **não** é um modelo de IA nem gera fotos realistas; imagens são arte vetorial. Para geração livre use a opção "IA do Ollama".
- Menu redesenhado e pesquisa na web continuam não implementados.
- A aba Gerador só foi testada em simulador (jsdom), não em navegador real.
- "Permitir tudo": limites do app removidos; o que o modelo recusa é do próprio modelo.

## Erros possíveis no futuro
- Ollama pelo arquivo HTML solto: precisa `OLLAMA_ORIGINS=*`.
- IndexedDB bloqueado (janela privada) → dados não persistem (aviso no Diagnóstico).
- Celular e PC em redes diferentes → Ollama inacessível; o app cai na IA base.
- Modelo grande + `num_ctx` 16384 pode faltar RAM → usar qualidade "low".
- SVG em PNG depende do suporte do navegador; se falhar, baixar o .svg.
