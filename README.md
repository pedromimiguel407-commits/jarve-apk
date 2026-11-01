# JARVES AI — Core 2.3.0

Aplicação principal compartilhada por Windows, Linux, PWA e Android.

## Requisitos
- Node.js 22 LTS ou superior
- npm
- Ollama local (opcional) ou provedor OpenAI-compatible configurado

## Execução manual
1. Copie `.env.example` para `.env`.
2. Instale dependências: `npm install --include=dev`.
3. Execute `npm start`.
4. Abra `http://localhost:3000`.

Para iniciar sem terminal, use `PC_WINDOWS/INICIAR_JARVES.bat` ou `PC_LINUX/iniciar-jarves.sh` na raiz do pacote.

## Compilar desktop
- Windows: execute `PC_WINDOWS/GERAR_EXE.bat` em Windows 10/11 x64.
- Linux: execute `bash PC_LINUX/gerar-appimage-deb.sh` em Linux x64.

## Android
Abra `ANDROID_APK` no Android Studio ou execute `bash ANDROID_APK/GERAR_APK.sh` após instalar JDK 17+, Gradle 8.x e Android SDK Platform 34.

O cliente Android e PWA conectam ao servidor. Eles não carregam o modelo de IA dentro do próprio app.

## Seguranca (2.3.0)
- `HOST=0.0.0.0` expoe a API a toda a rede local (necessario para o celular). Nao exponha a porta na internet.
- Para habilitar `/api/diagnostics/fix` e `/backup` defina `ADMIN_TOKEN` no `.env` e envie o header `x-admin-token`. Sem token essas rotas ficam desativadas.
- `RESEARCH_ENABLED=true` liga a pesquisa web (desligada por padrao).
- Faca backup de `data/jarves.db` JUNTO com `data/.jarves-secret`, senao a API key salva precisa ser cadastrada de novo.

## Testes
`npm test` (Node 22.13+). `npm run lint` verifica a sintaxe de todos os arquivos.

## GitHub Actions
Envie o CONTEUDO da pasta `JARVES_AI_2.3.0` para a RAIZ do repositorio (o workflow espera `CORE/` e `ANDROID_APK/` na raiz).
