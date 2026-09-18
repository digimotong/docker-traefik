# Description

This is the docker-compose repo for silentmedia: the compose files for every app
installed on that server.

Originally based on the [Docker-Traefik](https://github.com/SimpleHomelab/Docker-Traefik) repo from [SimpleHomelab](https://github.com/SimpleHomelab).

## Repository Layout

- `docker-compose-silentmedia.yml` defines the shared `networks` and `secrets`;
  it declares no services of its own.
- `compose/silentmedia/` holds one compose file per app.
- `compose/archives/` holds retired app files, kept for reference only.
- `custom/Dockerfile-*` holds the build files for the few apps built from source.
- `.env` and `secrets/` are gitignored; `.env.example` and `secrets_example/` are
  the tracked templates. `.env` holds the host paths (`DOCKERDIR`, `APPDATADIR`,
  `MEDIADIR`, ...), the domain settings, and one key or password per app.
- Every app declares `profiles` (`all` plus category profiles such as `apps` or
  `media`), so an app only starts when its profile is enabled.

## Docker Compose Section Order Standard

All compose files should follow this standardized section ordering:

1. `container_name`
2. `image`
3. `build` (if needed)
4. `pull_policy` (if needed)
5. `networks`
6. `dns` (if needed)
7. `security_opt`
8. `restart`
9. `profiles`
10. `depends_on` (if needed)
11. `command`/`entrypoint`
12. `mem_limit` (if needed)
13. `ports`/`expose`
14. `volumes`
15. `user` (if needed)
16. `environment`
17. `secrets`
18. `healthcheck`
19. `labels`
20. `devices` (if needed)
21. `group_add` (if needed)
22. `deploy` (for resource limits)

Example structure:

```yaml
services:
  service-name:
    container_name: service-name
    image: repo/image:tag
    # build:
    networks:
      - network1
    security_opt:
      - no-new-privileges:true
    restart: unless-stopped
    profiles: ["category"]
    # depends_on: []
    command: []
    ports: []
    volumes: []
    # user: $PUID:$PGID
    environment: []
    secrets: []
    healthcheck: {}
    labels: []
    # devices: []
    # deploy: {}
```
