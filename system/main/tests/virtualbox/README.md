# VirtualBox

## Mount VirtualBox shared folders

1. Settings > Shared Folders > Machine Folders

1. Select Folder Path on host > folder name `shared` > uncheck `Read-only` and
   `Auto-mount`, and check `Make Permanent`

1. Get in the VM > command `mkdir ~/shared` > command `sudo mount -t vboxsf
   shared ~/shared`

1. The shared folder should now be working.

:bulb: To make the mount folder persistent between the reboots, you need to modify
the `/etc/fstab`. Otherwise, re-run the `mount` command.
