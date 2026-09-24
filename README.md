<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=800&size=40&duration=2500&pause=1000&color=FF0043&center=true&vCenter=true&width=600&height=80&lines=R3dJh0n" alt="R3dJh0n banner" />

<br/>

![Docker](https://img.shields.io/badge/Docker-required-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20Windows-blue?style=for-the-badge)
![Arch](https://img.shields.io/badge/Arch-x86__64%20%7C%20ARM64-informational?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Lab%20%2F%20Testing-yellow?style=for-the-badge)

</div>

<br/>

## 📌 Descripción

Laboratorio de pruebas containerizado, listo para levantar en segundos con Docker Compose. Incluye un portal web y un servidor SSH preconfigurados para prácticas y entornos de aprendizaje.

<div align="center">
  <img src="scripts/imagen.gif" alt="Descripción de la imagen" width="500"/>
</div>

---

## 🚀 Requisitos y Compatibilidad

Este laboratorio se puede instalar y ejecutar en **cualquier dispositivo y sistema operativo**:

| Sistema Operativo | Soporte |
|---|:---:|
| 🐧 Linux | ✅ |
| 🍎 macOS | ✅ |
| 🪟 Windows (Docker Desktop / WSL2) | ✅ |

> **Único requisito:** Tener [Docker](https://docs.docker.com/get-docker/) y Docker Compose instalados.

---

## ⚡ Inicio Rápido

```bash
# Clonar el repositorio y ejecutar el script de inicio
bash scripts/start.sh
```

---

## 🔑 Servicios y Credenciales

| Servicio | Dirección / Comando | Usuario | Contraseña |
|---|---|:---:|:---:|
| 🌐 **Web Portal** | `http://localhost:8080` | — | — |
| 🔐 **SSH Server** | `ssh guest@localhost -p 2222` | `guest` | `123456` |

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

<div align="center">

> ⚠️ **Aviso:** Diseñado únicamente para entornos locales de pruebas y laboratorios de aprendizaje.

</div>