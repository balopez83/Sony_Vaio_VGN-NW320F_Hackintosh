# Sony_Vaio_VGN-NW_Hackintosh
Dusting off the cobwebs of an old BIOS based Core2Duo Vaio and attempting to turn it into a usable Hackintosh

If you see anything that could be added or changed don't hesitate to make a pull request.


## *** NOTICE ***
### Initial support of macOS on the Sony Vaio VGN-NW series computers has been achieved. Should work on all VGN-NW models and possibly other similar speced Core 2 Duo computers with some minor adjustments to the EFI. 
### The GMA4500MHD graphics chipset is not nor will ever be supported and as such there is not QE/CI (A.K.A. Acceleration) support. This means some tasks may result in screen glitches or slugishness due to VESA mode support only.

![High Sierra](https://github.com/balopez83/Sony_Vaio_VGN-NW320F_Hackintosh/blob/main/Screenshots/Sony-Vaio_VGN-NW320F_High-Sierra.png)

## Sony Vaio VGN-NW320F Specifications:

| Model: | VGN-NW320F |
|---|----------|
|CPU| Core 2 Duo T9900 Dual Core (Upgraded) 3.02 Ghz |
|GPU| GMA 4500MHD |
|RAM| 8 GB (Upgraded) |
|SSD| 512GB SATA (Upgraded) |
|WiFi| Atheros 9285 PCIe A/B/G/N |
|Batt| 5,200 mAH |
|USB| 3x USB 2.0, FireWire |
|Other| VGA, HDMI, Ethernet |
|     | SD, MagicGate, PCMCIA, DVD R/W |

## Current State Of Support:

- Mac OS X 10.0 - 10.3 are PowerPC based and cannot be installed
- [ ] macOS 10.4 Tiger (End of Life)
- [X] macOS 10.5 Leopard (End of Life - Lacks WiFi, Keyboard, & TrackPad Support)
- [X] macOS 10.6 Snow Leopard (End of Life - Lacks WiFi Support)
- [X] macOS 10.7 Lion (End of Life - Lacks WiFi Support)
- [X] macOS 10.8 Mountain Lion (End of Life)
- [X] macOS 10.9 Mavericks (End of Life)
- [X] macOS 10.10 Yosemite (End of Life)
- [X] macOS 10.11 El Capitan (End of Life)
- [X] macOS 10.12 Sierra (End of Life)
- [X] macOS 10.13 High Sierra (End of Life - Best Support)
- [X] macOS 10.14 Mojave (End of Life - Best Support)
- [X] macOS 10.15 Catalina (End of Life - Best Support & Recommended)
- [X] macOS 11 Big Sur (End of Life - Not Recommended w/o QE/CI, Computer is Very SLOW)
- [ ] macOS 12 Monterey (Not Recommended w/o QE/CI Computer, is Very SLOW)
- [ ] macOS 13 Ventura (Not Recommended w/o QE/CI Computer, is Very SLOW)
- [ ] macOS 14 Sonoma (Not Recommended w/o QE/CI Computer, is Very SLOW)
- [ ] macOS 15 ????



## Instruction Guides

### [Chapter 1) Quick Start Install]
### [Chapter 2) BootCamp Install]
### [Chapter 3) Quirks & Fixes]
### [Chapter 4) Additional Drivers]
### [Chapter 5) Booting Other OS's with OpenCore]
### [Chapter 6) Other Operating Systems]
### [Chapter 7) Other OS Quirks & Fixes]



## What works 

- macOS Installer (See above for supported versions)
- macOS (See above for supported versions)
- Wi-Fi (10.8.x through 11.x.x)
- Graphics set to proper resolution of 1366x768 (ForceResolution QuirK)
- Fan
- USB
- Battery
- Trackpad (In macOS, not OC boot picker)
- Keyboard
- Audio
- MagicGate Data Card (SDcard)
- Windows Dual Boot
- FileVault
- Recovery
- Power Management (Partialy Working: CPU and peripheral only)
- FireWire
- DVD/CD Read & Write (If OpenCore launched first you can boot from a CD/DVD as well)




## What doesn't work

- Graphics Acceleration QE/CI. (Won't ever work)
- HDMI (Requires QE/CI; Won't ever work)
- Brightness Adjustment (Requires QE/CI; Won't ever work)
- Graphics Power Management (Requires QE/CI; Won't ever work)
- Sleep / Wake (Requires QE/CI: Won't ever work)
- PCMCIA (Untested)
- VGA (Requires QE/CI; Won't ever work)



## Credits
All OpenCore & Clover contributors as well as the many people that have contributed to the various patches, tweaks, and discoveries that have made this possible. 
