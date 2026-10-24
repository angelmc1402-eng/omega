@echo off
cd /d "%~dp0"
echo Omega - Abre http://localhost:8000 en tu navegador.
echo Para detener el servidor, pulsa Ctrl+C.
py -3 -m http.server 8000 --bind 127.0.0.1
if errorlevel 1 (
  echo Instala Python 3 o prueba: python -m http.server 8000 --bind 127.0.0.1
  pause
)
