# Description

This is the docker-compose repo of all the apps installed on silentmedia.


## Docker Compose Section Order Standard

All compose files should follow this standardized section ordering:

1. `container_name`
2. `image`
3. `networks`
4. `dns` (if needed)
5. `security_opt`
6. `restart`
7. `profiles` 
8. `depends_on` (if needed)
9. `command`/`entrypoint`
10. `ports`/`expose`
11. `volumes`
12. `user` (if needed)
13. `environment`
14. `secrets`
15. `healthcheck`
16. `labels`
17. `devices` (if needed)
18. `group_add` (if needed)
19. `deploy` (for resource limits)

Example structure:
```yaml
services:
  service-name:
    container_name: service-name
    image: repo/image:tag
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
