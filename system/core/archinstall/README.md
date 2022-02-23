# archinstall

Install Arch Linux with the guided installer `archinstall`.

- https://wiki.archlinux.org/title/Archinstall

- https://github.com/archlinux/archinstall

Apply JSON config file:

```bash
archinstall --config https://raw.githubusercontent.com/strboul/tmp-workbench/master/system/core/archinstall/config.json
```

Dry run to generate the configuration file and exit:

```bash
archinstall --dry-run

# then check:
ls -l /var/log/archinstall
```

## Notes

+ You gonna fill out the missing parts in the config.

+ `"ntp": true`: automatic time sync (ntp)

+ `"swap": true`: swap on ZRAM

+ disk layouts: choose `btrfs` with subvolumes.
