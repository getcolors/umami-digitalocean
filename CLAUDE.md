# CLAUDE.md

## Repository

Desired state for `umami-digitalocean`: Umami web analytics and PostgreSQL 17
on one DigitalOcean Droplet in Amsterdam, published at
`https://umami.bigconfig.online` through Cloudflare and Caddy. Behavior lives in
`../umami`.

Tracked source is `colors.yml`, toolchain and documentation, the installed
Package Skill, lockfile, and a root launcher copied from its payload.
`.colors/` is generated private state and `.envrc.private` contains credentials;
never read, edit or commit either.

## Commands

```sh
./green build
./green create --dry-run
./green create
./green delete
```

Build and dry-run require no credentials. Never export `COLORS_PAR_PROFILE`.
Keep `compute-prevent-destroy: true`; deletion requires separate authorization
and a one-run `COLORS_PAR_COMPUTE_PREVENT_DESTROY=false` override.

The root `green` is a copy, not a symlink. After a Package Skill update run
`npx skills update -p -y` and copy
`.agents/skills/package-umami-green/green` over it. Never hand-edit its SHA.

## Verification

Real create performs HTTPS heartbeat health check, synthetic event ingestion
via beacon API, and backup script execution. Operational checks are documented
in README.md. Umami port 3000 and PostgreSQL port 5432 must remain private.

## Git

Work on the current branch. Do not commit or push unless explicitly authorized.
