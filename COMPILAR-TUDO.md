# JARVES AI 2.3.0 — Compilação por plataforma

Os instaladores devem ser gerados em seus ambientes nativos. O código-fonte e os scripts estão incluídos; um script não é o mesmo que um binário compilado.

## Windows EXE
1. Windows 10/11 x64, Node.js 22+ e npm.
2. Extraia o ZIP completo.
3. Execute `PC_WINDOWS/GERAR_EXE.bat`.
4. Saída esperada: `CORE/dist/JARVES AI Setup 2.3.0.exe` (o nome final pode variar conforme electron-builder).

## Linux AppImage e DEB
1. Linux x64, Node.js 22+ e npm.
2. Execute `bash PC_LINUX/gerar-appimage-deb.sh`.
3. Saída: `CORE/dist/*.AppImage` e `CORE/dist/*.deb`.

## Android APK
1. Instale JDK 17+, Gradle 8.x e Android SDK Platform 34.
2. Configure `ANDROID_HOME` ou `ANDROID_SDK_ROOT`.
3. Execute `bash ANDROID_APK/GERAR_APK.sh`, ou abra `ANDROID_APK` no Android Studio e execute `assembleDebug`.
4. Saída: `ANDROID_APK/OUTPUT/JARVES-AI-2.3.0-debug.apk`.

## Celular sem APK
Inicie o backend no PC e abra no celular, na mesma rede Wi-Fi, `http://IP-DO-PC:3000`. O PWA pode ser instalado pelo menu do navegador quando servido por HTTPS ou localhost.

## IA
- Ollama: instale Ollama separadamente, baixe um modelo e configure-o em Configurações > Modelos.
- Provedor externo: cadastre uma chave válida obtida no site oficial do provedor.
- O JARVES não cria API keys de terceiros e não inclui modelos grandes no instalador.

## Diagnóstico
Execute `bash BUILD/VERIFICAR_CORE.sh` na raiz do pacote. A suíte funcional completa requer `npm install --include=dev` e `npm test` dentro de `CORE`.
