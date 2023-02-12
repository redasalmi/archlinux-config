### Set the keyboard layout:

```sh
  loadkeys fr-latin1
```

### Update the system clock:

```sh
  timedatectl set-ntp true
  timedatectl status
```

### Partition the disks:

```sh
  /dev/sda1 => 550M  => EFI partition     # boot
  /dev/sda2 => 4G    => linux swap        # swap
  /dev/sda3 => 60G   => linux partition   # root
  /dev/sda4 => 100G   => linux partition   # home
```

### Format the partitions:

```sh
  mkfs.fat -F32 /dev/sda1
  mkswap /dev/sda2
  swapon /dev/sda2
  mkfs.ext4 /dev/sda3
  mkfs.ext4 /dev/sda4
```

### Mount the file system:

```sh
  mount /dev/sda3 /mnt
  mkdir /mnt/home
  mount /dev/sda4 /mnt/home
```

### Installation:

```sh
  pacstrap /mnt base base-devel linux linux-firmware nano
  genfstab -U /mnt >> /mnt/etc/fstab
  arch-chroot /mnt

  ln -sf /usr/share/zoneinfo/Africa/Algiers /etc/localtime
  hwclock --systohc

  nano /etc/locale.gen
    Uncomment en_US.UTF-8 UTF-8

  locale-gen

  nano /etc/locale.conf
    LANG=en_US.UTF-8

  nano /etc/vconsole.conf
    KEYMAP=fr-latin1
```

### Network configuration:

```sh
  nano /etc/hostname
    myhostname

  nano /etc/hosts
    127.0.0.1     localhost
    ::1           localhost
    127.0.1.1     myhostname.localdomain myhostname

  pacman -S networkmanager
  systemctl enable NetworkManager.service
```

### Root password:

```sh
  passwd
```

### Boot loader:

```sh
  pacman -S grub efibootmgr os-prober
  mkdir /boot/EFI
  mount /dev/sda1 /boot/EFI
  grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
  grub-mkconfig -o /boot/grub/grub.cfg
```

### CPU microcode:

```sh
  pacman -S intel-ucode  # intel cpu only
  pacman -S amd-ucode    # amd cpu only
```

### Reboot:

```sh
  exit
  umount -R /mnt
  reboot
```

### Zsh setup:

```sh
  pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions
  chsh -s /usr/bin/zsh
```

### Users and groups:

```sh
  useradd -m -g users -G wheel -s /usr/bin/zsh username
  passwd username
  EDITOR=nano visudo
    Uncomment this line: %wheel ALL=(ALL) ALL
```

### Install a Desktop Environment:

- [Desktop Environments](./desktop-environments.md)

### Install Useful packages:

- [Packages](./packages.md)
