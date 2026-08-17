# umami-digitalocean

Desired state for [https://umami.bigconfig.online](https://umami.bigconfig.online):
Umami v2.14.0 and PostgreSQL 17 on one Amsterdam DigitalOcean Droplet.

```sh
./green build
./green create --dry-run
./green create
```

Credentials listed in `colors.yml` live only in ignored `.envrc.private`.
Never set `COLORS_PAR_PROFILE`. OpenTofu discovers the `ams3` default VPC during
apply and does not create or configure a VPC. `compute-prevent-destroy: true`
protects the Droplet and persistent state.

## Operations

```sh
ssh root@SERVER 'cd /opt/umami && docker compose ps'
ssh root@SERVER 'cd /opt/umami && docker compose logs --tail=200 umami postgres caddy'
ssh root@SERVER 'systemctl list-timers umami-backup.timer'
curl https://umami.bigconfig.online/api/heartbeat
```

## Backup, restore and disaster recovery

The scheduled timer executes `/usr/local/sbin/umami-backup` to take a `pg_dump`,
compress it, and upload the archive to Cloudflare R2 (`umami-backup`).
Single-node operation provides restart durability but no high availability.
Droplet or regional failure causes downtime; backup RPO is up to one day and
restoration is manual.
