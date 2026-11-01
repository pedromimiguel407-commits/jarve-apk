# Gerar EXE, AppImage e APK na nuvem

Este pacote inclui `.github/workflows/build.yml`. O GitHub Actions usa runners nativos separados para Windows, Linux e Android, evitando tentar compilar EXE em Linux ou APK sem Android SDK.

## Passos
1. Crie um repositório GitHub vazio.
2. Envie o conteúdo desta pasta para a raiz do repositório.
3. No GitHub, abra **Actions** e habilite workflows se solicitado.
4. Use **JARVES AI - Native builds** > **Run workflow** ou crie uma tag `v2.3.0`.
5. Quando os três jobs terminarem com sucesso, abra a execução e baixe os três artefatos:
   - `JARVES-Windows-EXE`
   - `JARVES-Linux-AppImage-DEB`
   - `JARVES-Android-APK`

O workflow compila em ambientes nativos e publica os binários como artefatos da execução. A execução ainda precisa ser disparada pelo proprietário do repositório; este pacote não afirma que os artefatos já foram compilados.
