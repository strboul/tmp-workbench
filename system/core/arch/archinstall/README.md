# archinstall

Install Arch Linux with the guided installer `archinstall`.

- https://github.com/archlinux/archinstall

- https://wiki.archlinux.org/title/Archinstall

## Install

Update keyring first if the Arch Linux ISO isn't the most up to date version:

```sh
pacman -S archlinux-keyring
```

With the config file:

```sh
archinstall --config \
  https://raw.githubusercontent.com/strboul/tmp-workbench/master/system/core/arch/archinstall/config.json
```

Test with dry run to generate the configuration file and exit:

```sh
archinstall --dry-run

# then check:
ls -l /var/log/archinstall
```

The [config.json](config.json) file descriptions:

| key          | description                                       |
|:-------------|:--------------------------------------------------|
| `ntp`        | automatic time sync ([NTP](https://www.ntp.org/)) |
| `swap`       | swap on ZRAM                                      |

:point_right: Fill out the missing parts in the config :point_left:

### Steps

**0)** Partition:

  + Desired filesystem type for the partition: `btrfs`

  + End sector is written like `x.0GB`

**1)** Choose `btrfs` filesystem and `N` to subvolumes with a default structure.

**2)** Enter disk encryption password. Encrypts the disk with `dmcrypt` (or should
use LUKS?)

**3)** `systemd-bootctl`, **use this**, or `grub-install`, not recommended but
  VirtualBox does not work even though EFI is enabled.

**4)** Enter desired hostname for the installation.

**5)** **Don't create root user**; instead, create a super-user with sudo privileges.

### Troubleshooting

If the installation failed halfway through, you need to start over.

If you have a problem with the partition:

```sh
df
# /dev/sda ...

fdisk /dev/sda
# Partition number (1,2, default 2): 2
# Command:
# w  write table to disk and exit
#
```

### Post-installation

+ Do not chroot to perform post-installation configuration (`n`).

+ If the installation completed without any errors, command `reboot now`.
