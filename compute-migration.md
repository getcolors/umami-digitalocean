# Shared compute rollout

Installed package: `getcolors/umami` at published revision `b3aa56fbdbd062229cf336b1ff08ada720d5de27`.
The installed skill directories and root launchers were copied from a verified
Skills CLI installation of that revision. This remains a manual installation; no lockfile was invented.

The package now delegates compute, remote state and machine-key ownership to
colors-compute. Its shared and node state keys live beneath `<profile>/compute/`;
managed Kubernetes uses the library managed-cluster state. Existing application
state and persistent application data must be retained.

This is a payload/configuration refresh, not a resource or state migration.
No live provider calls, create/delete, private key reads, or state transfers
were performed. Legacy deployment state was not inspected. Before a real
operation, establish ownership and review an explicit migration from the old
compute state layout. The library refuses recognized legacy remote state;
do not remove that guard, discard old state, or treat a new empty state key as
proof that the existing deployment has no resources. Keep the committed destroy
guard and the deployment profile unchanged.

Validation: the actual copied green launcher completed `build` in
temporary directories with a sanitized environment and published dependencies.
Generated compute documents were present. Any rendered backend documents used
compute state keys and contained no credentials.
This proves offline rendering, not live credentials, migrated ownership, or
application health.

Outstanding live-operation prerequisites:

- Before any real operation, verify working operator or SSH-agent access for the existing external provider key, or set ssh-private-key-path to its matching identity. No identity path was guessed and no key mode was changed.
