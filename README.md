# Test_Infra 🧪

Entorno de laboratorio portátil en contenedor Docker para prácticas de infraestructura y pruebas de seguridad en redes.

## 🚀 Requisitos y Compatibilidad

Este laboratorio se puede instalar y ejecutar en **cualquier dispositivo y sistema operativo** (Linux, macOS, Windows con Docker Desktop / WSL2, arquitectura Intel/AMD o ARM como Apple Silicon M1/M2/M3 y Raspberry Pi).

**Único requisito:** Tener [Docker](https://docs.docker.com/get-docker/) y Docker Compose instalados.

---

## ⚡ Inicio Rápido

```bash
# Clone el repositorio y ejecute el script de inicio
bash scripts/start.sh
```

---

## 🔑 Servicios y Credenciales

| Servicio | Dirección / Comando | Usuarios disponibles | Contraseñas |
|---|---|---|---|
| **Web Portal** | `http://localhost:8080` | `root`<br>`admin`<br>`guest` | `toor`<br>`Admin1234`<br>`123456` |
| **SSH Server** | `ssh guest@localhost -p 2222`<br>`ssh root@localhost -p 2222` | `root`<br>`admin`<br>`guest` | `toor`<br>`Admin1234`<br>`123456` |

---

## 📁 Archivos y Estructura del Proyecto

```
Test_Infra/
├── docker-compose.yml       # Mapeo de puertos (8080 web, 2222 SSH)
├── scripts/
│   └── start.sh             # Script automatizado de inicio
└── server/
    ├── Dockerfile           # Configuración de la imagen base (Debian)
    ├── banner.txt           # Banner de bienvenida al conectar por SSH
    ├── guest_files/         # Archivos iniciales para el usuario guest
    │   └── Info/
    │       └── Instruction.md
    ├── entrypoint.sh        # Script de inicio de servicios (Nginx + SSHd)
    └── web/
        └── index.html       # Interfaz del portal web de login
```

---

## 🛠️ Comandos Útiles

```bash
# Ver logs en tiempo real
docker compose logs -f

# Detener el contenedor
docker compose down

# Reconstruir el contenedor tras hacer cambios
docker compose up --build -d
```

---

> ⚠️ **Aviso:** Diseñado únicamente para entornos locales de pruebas y laboratorios de aprendizaje.
