# Description

This is the docker-compose repo of all the apps installed on silentmedia.

Originally based on the [Docker-Traefik](https://github.com/SimpleHomelab/Docker-Traefik) repo from [SimpleHomelab](https://github.com/SimpleHomelab).

## Docker Compose Section Order Standard
<details>
<summary>All compose files should follow this standardized section ordering</summary>

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
12. `ports`/`expose`
13. `volumes`
14. `user` (if needed)
15. `environment`
16. `secrets`
17. `healthcheck`
18. `labels`
19. `devices` (if needed)
20. `group_add` (if needed)
21. `deploy` (for resource limits)
</details>

<details>
<summary>Example structure</summary>

```yaml
services:
  service-name:
    container_name: service-name
    image: repo/image:tag
    # build:
    networks:
      - network1
    # dns: []
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
</details>
