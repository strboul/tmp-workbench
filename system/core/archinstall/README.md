# archinstall

Install Arch Linux with the guided installer `archinstall`.

- Github: https://github.com/archlinux/archinstall

- Arch wiki: https://wiki.archlinux.org/title/Archinstall

## Config file

```sh
archinstall --config https://raw.githubusercontent.com/strboul/tmp-workbench/master/system/core/archinstall/config.json
```

Dry run to generate the configuration file and exit:

```sh
archinstall --dry-run

# then check:
ls -l /var/log/archinstall
```

| key: value     | description                                          |
|:---------------|:-----------------------------------------------------|
| `"ntp": true`  | automatic time sync ([NTP](https://www.ntp.org/))    |
| `"swap": true` | swap on ZRAM                                         |

:point_right: **You fill out the missing parts in the config.** :point_left:

+ Partition: 

    + Desired filesystem type for the partition: `btrfs`

    + End sector is written like `x.0GB`

+ Choose `btrfs` filesystem and `Y` to subvolumes with a default structure.

+ Enter disk encryption password.
  Encrypts the disk with `dmcrypt` (or should use LUKS?)

+ **Don't create root user**; instead, create a super-user with sudo privileges.

After installation finished;

+ Do not chroot to perform post-installation configuration (`n`).

+ If the installation completed without any errors, command `reboot now`.
