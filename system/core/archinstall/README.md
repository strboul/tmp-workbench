# archinstall

Install Arch Linux with the guided installer `archinstall`.

- https://wiki.archlinux.org/title/Archinstall

- https://github.com/archlinux/archinstall

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

+ `"ntp": true`: automatic time sync ([NTP](https://www.ntp.org/))

+ `"swap": true`: swap on ZRAM

## Notes

You gonna fill out the missing parts in the config.

+ Choose `btrfs` filesystem with subvolumes.

+ Encrypt disk with `dmcrypt` (or should use LUKS?)

+ Don't create a root user; instead, create a super-user with sudo privileges.
