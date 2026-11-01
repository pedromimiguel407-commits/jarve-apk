# Arquitetura JARVES AI

- CORE/frontend: interface web responsiva/PWA.
- CORE/backend: API HTTP local e persistencia.
- CORE/ai: adaptadores de provedores Ollama e OpenAI-compatible.
- PC Windows/Linux: iniciam o mesmo backend; Electron pode empacotar o desktop.
- Celular PWA e APK: clientes do backend via rede local ou HTTPS.

## Portas
- Backend compartilhado: 3000.
- Electron desktop: 3210 em loopback.
- Ollama: 11434 em loopback.

## Dados
Banco e uploads sao gravados em CORE/data. O arquivo .env e criado a partir de .env.example na primeira inicializacao.
