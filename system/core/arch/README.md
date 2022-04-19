# Arch Linux Installation

My notes of Arch Linux installation.

This document should be followed on top of
the official
[Installation Guide](https://wiki.archlinux.org/title/installation_guide) and
the resources:

- https://wiki.archlinux.org/title/User:Soloturn/Quick_Installation_guide_UEFI#Format_disk_and_mount_partitions

## Prerequisite

- Secure boot disabled at BIOS.

- Change SATA Operation mode from `RAID` to `AHCI`. If dual-booting with
  Windows, follow
  [this step](https://support.thinkcritical.com/kb/articles/switch-windows-10-from-raid-ide-to-ahci)
  to continue using Win 10/11.

## Network

Connect to Wi-Fi:

```sh
iwctl station list
iwctl station wlan0 get-networks
iwctl station wlan0 connect <ESSID>
```

Check the connection:

```sh
ping archlinux.org -c 1
```

## Disk

### 1. Create partitions

Create partitions with `fdisk`:

```sh
fdisk /dev/sda
```

- For EFI, command `g` to change the label to use GPT.

- Command `F` to list and check the free unpartitioned space.

- Command `n` to create new partition. Select the number for the new partition.

1) EFI system partition

(No need to create a EFI partition if you are dual-booting)

- Type last sector: `+500M`

- Command `t` and choose `1` to change the partition type to `EFI system`.

2) Root partition

- Type last sector: e.g. `+200GB`, or leave it empty to use the full available
  space

No swap partition is required.

- In the end, command `w` to save and quit.

### 2. Format partitions

```sh
mkfs.fat -F32 /dev/sda1  # EFI
mkfs.ext4 /dev/sda2  # root
```

### 3. Encrypt filesystem

TODO

### 4. Mount partitions

```sh
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
```

## Package

Install essential packages:

```sh
pacstrap /mnt base base-devel linux linux-firmware intel-ucode dhcpcd iwd vim
```

## Persistent mounts

Generate the fstab to make the mounts persistent:

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

## System

Chroot into the system (cannot run without the pacstrap step above):

```sh
arch-chroot /mnt
```

Set up user:

```sh
useradd --create-home --groups wheel $user # create user with the home directory
passwd $user # password
echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel # add user to sudoers
```

## Bootloader

Use `systemd-boot`:

```sh
bootctl --path=/boot install
```

Create a boot entry:

```sh
disk_uuid="$(blkid -s PARTUUID -o value /dev/sda2)" # change if root part different
echo """
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=PARTUUID="$disk_uuid" rw
""" > /boot/loader/entries/arch.conf
```

## Finish

Enable internet connection for the next boot:

```sh
systemctl enable dhcpcd iwd
```

Quit chroot with `ctrl+d` and reboot:

```sh
umount -R /mnt
reboot now
```

and continue with the post-installation.

## Post-installation

xfce4 installation:

```sh
sudo pacman -S xorg-server xorg-xinit xfce4
startxfce4
```
