# Vue + Docker (Everything in Containers, Data on Your Drive)

## Quick Start
```bash
cd vue-docker
docker compose up --build
```

- Frontend: http://localhost:5173
- Mock API: http://localhost:3001/notes

### Day-to-Day
- Start (detached): `docker compose up -d`
- Stop: `docker compose down`
- Shell: `docker compose exec frontend sh`

### Backup
```bash
mkdir -p backups
tar -czf backups/vue-$(date +%F).tar.gz app data
```
