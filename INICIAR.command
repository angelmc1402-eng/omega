#!/bin/sh
cd "$(dirname "$0")" || exit 1
printf 'Omega - Abre http://localhost:8000 en tu navegador.\nPara detener el servidor, pulsa Ctrl+C.\n'
python3 -m http.server 8000 --bind 127.0.0.1
