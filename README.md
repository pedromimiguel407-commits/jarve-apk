# JARVES AI Android 2.3.0

O APK é um cliente WebView para o backend JARVES executado em um computador/servidor. O backend não é embutido no APK.

## Requisitos para compilar
- JDK 17+
- Gradle 8.x (compatível com Android Gradle Plugin 8.1.0)
- Android SDK Platform 34
- `ANDROID_HOME` ou `ANDROID_SDK_ROOT` apontando para o SDK

## Gerar APK
No Linux/macOS: `bash GERAR_APK.sh`
No Windows: abra esta pasta no Android Studio, aguarde a sincronização Gradle e execute `assembleDebug`.

Saída: `OUTPUT/JARVES-AI-2.3.0-debug.apk`.

## Executar
1. No PC, inicie o backend JARVES na porta 3000.
2. Conecte PC e celular à mesma rede Wi-Fi.
3. Instale o APK e informe no app o endereço `http://IP-DO-PC:3000`.
4. Não use `localhost` ou `127.0.0.1` no celular: esses endereços apontam para o próprio aparelho.

## Segurança
Não exponha a porta 3000 diretamente à internet. Em redes públicas, use HTTPS com certificado válido e controle de acesso.
