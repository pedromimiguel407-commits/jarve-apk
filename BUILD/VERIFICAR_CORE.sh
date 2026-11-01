#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
CORE="$ROOT/CORE"
command -v node >/dev/null || { echo 'Node.js ausente'; exit 1; }
NODE_MAJOR="$(node -p 'Number(process.versions.node.split(".")[0])')"
(( NODE_MAJOR >= 22 )) || { echo 'Requer Node.js 22+'; exit 1; }
node -e "const p=require('$CORE/package.json'); if(p.version!=='2.3.0') process.exit(1); if(!p.devDependencies.electron || !p.devDependencies['electron-builder']) process.exit(1); console.log('package.json: OK')"
find "$CORE" -type f \( -name '*.mjs' -o -name '*.cjs' -o -name '*.js' \) -print0 |
  while IFS= read -r -d '' f; do node --check "$f" >/dev/null; done
echo 'Sintaxe JavaScript: OK'
test -f "$ROOT/ANDROID_APK/app/src/main/java/com/jerver/ai/MainActivity.java"
test -f "$ROOT/ANDROID_APK/app/src/main/AndroidManifest.xml"
echo 'Fontes Android: OK'
test -x "$ROOT/PC_LINUX/iniciar-jarves.sh"
test -x "$ROOT/PC_LINUX/gerar-appimage-deb.sh"
test -x "$ROOT/ANDROID_APK/GERAR_APK.sh"
echo 'Scripts Linux/Android: OK'
echo 'Verificacao estatica concluida. Para testes funcionais: cd CORE && npm install --include=dev && npm test'
