#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"
command -v java >/dev/null || { echo 'Instale JDK 17.' >&2; exit 1; }
JAVA_MAJOR="$(java -version 2>&1 | sed -n '1s/.*version "\([0-9]*\).*/\1/p')"
[[ -n "$JAVA_MAJOR" && "$JAVA_MAJOR" -ge 17 ]] || { echo 'JDK 17 ou superior é necessário.' >&2; exit 1; }
command -v gradle >/dev/null || { echo 'Gradle 8.x não encontrado. Instale Gradle 8.0+ ou abra o projeto no Android Studio.' >&2; exit 2; }
gradle --version | grep -q 'Gradle 8' || { echo 'Este projeto requer Gradle 8.x.' >&2; exit 2; }
SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-}}"
[[ -n "$SDK" && -d "$SDK/platforms/android-34" ]] || { echo 'Instale Android SDK Platform 34 e configure ANDROID_HOME.' >&2; exit 3; }
(cd ../CORE && node scripts/build-executor.mjs)   # embute o app no APK (assets/jarves.html)
gradle --no-daemon --stacktrace assembleDebug
mkdir -p "$ROOT/OUTPUT"
cp app/build/outputs/apk/debug/app-debug.apk "$ROOT/OUTPUT/JARVES-AI-2.3.0-debug.apk"
echo "APK criado em $ROOT/OUTPUT/JARVES-AI-2.3.0-debug.apk"
