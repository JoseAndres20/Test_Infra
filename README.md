# Test_Infra

Lab personal para practicar conceptos básicos de seguridad en redes.

Levanta un servidor en un contenedor Docker con:
- Portal web (login) en el puerto 8080
- Acceso SSH en el puerto 2222

## Inicio rápido

```bash
bash scripts/start.sh
```

| Servicio | Acceso |
|----------|--------|
| Web | http://localhost:8080 |
| SSH | `ssh root@localhost -p 2222` |

Contraseña SSH: `toor`

## Estructura

```
server/
├── Dockerfile       # imagen del servidor
├── banner.txt       # banner de bienvenida SSH
├── entrypoint.sh    # arranca nginx + SSH
└── web/
    └── index.html   # portal login
```

---
> ⚠️ Solo para uso local. No exponer a internet.
