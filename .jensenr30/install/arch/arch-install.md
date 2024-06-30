# Basic Arch Install
Do yourself a favor and
```
pacman -Sy archinstall
```
or you can...

## Install arch manually:

Follow the [installation guide](https://wiki.archlinux.org/title/Installation_guide).

Boot into your installation medium

[Partition your disk](https://wiki.archlinux.org/title/Installation_guide#Partition_the_disks).

Format the partitions, mount, etc., chroot:
```
fdisk /dev/sdx
mkfs.ext4 /dev/main_partition
mkswap /dev/swap_partition
mkfs.fat -F 32 /dev/efi_system_partition
mount -m /dev/main_partition /mnt
mount --mkdir /dev/efi_system_partition /mnt/boot
swapon /dev/swap_partition
pacstrap -K /mnt base base-devel linux-lts linux-firmware vi vim sudo
genfstab -U /mnt >> /mnt/etc/fstab

```
Copied verbatim from the [configuration](https://wiki.archlinux.org/title/Installation_guide#Configure_the_system) section of the arch installation guide:
```
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
# Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "computer_name" > /etc/hostname
passwd
visudo /etc/sudoers
# uncomment the %wheel to make the wheel group admin then add your user to the wheel group:
useradd -m -G wheel ryan # -m = --create-home
usermod -a -G uucp,tty,video ryan
passwd ryan
sudo pacman -S dhcpcd

reboot
```

## Networking
TODO: DHCP

TODO: DNS

### Static IP
```
ip link  # get MAC address from your preferred network adapter
```
```
systemctl enable --now systemd-networkd
sudo vim /etc/systemd/network/20-wired.network
```

in that file, write the following:
```
[Match]
Name=[12-digit hexadecimal MAC address from 'ip link']

[Network]
Address=192.168.0.200/24
Gateway=192.168.0.1
DNS=192.168.0.1
```
then run:
```
systemctl restart systemd-networkd
```




umount -R /mnt
reboot



## Pacman config
```
sudo vim /etc/pacman.conf
```
in the `[options]` section, add or uncomment these:
```
Color
ParallelDownloads = 5
```
uncomment the `multilib` section in `/etc/pacman.conf`


sudo vim /etc/makepkg.conf
and add 'MAKEFLAGS="--jobs=$(nproc)"' to the file so that when you compile, you will use multiple cores.


UNTESTED: edit `/etc/makepkg.conf` and add / uncomment for and set `MAKEFLAGS="-j10"` to compile with 10 CPU cores.

## SSH
```
pacman -S openssh
vim /etc/ssh/sshd_config
systemctl enable --now sshd.service
```

## Mount Drives:
sudo mount -m /dev/foo /media/bar

## AUR
```
./yay.sh
```

## Finally
Look at the other install scripts in this directory and run as needed.
