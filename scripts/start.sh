#!/bin/bash
# ─────────────────────────────────────────────────────────────
#  start.sh — Instala dependencias y levanta el lab
# ─────────────────────────────────────────────────────────────

set -e
cd "$(dirname "$0")"   # siempre corre desde la raíz del repo

# ── 1. Verificar Docker ───────────────────────────────────────
if ! command -v docker &>/dev/null; then
  echo "[!] Docker no está instalado."
  echo "    Instálalo con: https://docs.docker.com/engine/install/"
  exit 1
fi

if ! docker compose version &>/dev/null; then
  echo "[!] Docker Compose no está disponible."
  echo "    Asegúrate de tener Docker Desktop o el plugin compose."
  exit 1
fi

echo "✔ Docker OK  →  $(docker --version)"
echo "✔ Compose OK →  $(docker compose version)"
echo ""

# ── 2. Levantar el contenedor ─────────────────────────────────
echo "[*] Construyendo y levantando el servidor..."
docker compose up --build -d

echo ""
echo "┌────────────────────────────────────────────┐"
echo "│  ✅  Lab levantado                          │"
echo "│                                            │"
echo "│  🌐  http://localhost:8080                  │"
echo "│  🌐  ssh guest@localhost:2222 123456        │"
echo "│                                            │"
echo "│  Comandos útiles:                          │"
echo "│    docker compose logs -f   → ver logs     │"
echo "│    docker compose down      → apagar        │"
echo "└────────────────────────────────────────────┘"
