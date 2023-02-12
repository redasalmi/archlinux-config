### xfce:

```sh
  pacman -S xorg-server xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings numlockx

  nano /etc/lightdm/lightdm.conf
    [Seat:*]
    greeter-setup-script=/usr/bin/numlockx on

  systemctl enable lightdm.service
  reboot
```

### budgie:

```sh
  pacman -S budgie terminator

  nano /etc/lightdm/lightdm.conf
    [Seat:*]
    greeter-setup-script=/usr/bin/numlockx on

  systemctl enable lightdm.service
  reboot
```
