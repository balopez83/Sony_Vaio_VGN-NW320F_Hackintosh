# Sony_Vaio_VGN-NW320F_Hackintosh
Dusting off the cobwebs of an old BIOS based Core2Duo Vaio and attempting to turn it into a usable Hackintosh

Initial support for macOS version 10.6.X Snow Leopard through 10.13.X.

If you see anything that could be added or changed don't hesitate to make a pull request.


## *** NOTICE ***
### Initial support of macOS on the Sony Vaio VGN-NW320F has been achieved. Should work on other VGN-NWxxxx models and possibly other similar speced Core 2 Duo computers as I am striving to make this EFI independent of full DSDT edits as was commonplace back when this computer was mainstream. This EFI is not for use yet as a daily driver though I suspect if you still have this computer its not being used as a daily driver anyway. 
### The GMA4500MHD graphics chipset is not nor will ever be supported.
### QE/CI (A.K.A. Acceleration) is not nor will ever be achieved. This means some tasks may result in screen glitches or slugishness due to VESA mode support only.

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
|     | SD, MagicGate, PCMCIA |



## Instruction Guides

### [Chapter 1) Quick Start Install]
### [Chapter 2) BootCamp Install]
### [Chapter 3) Quirks & Fixes]
### [Chapter 4) Additional Drivers]
### [Chapter 5) Booting Other OS's with OpenCore]
### [Chapter 6) Other Operating Systems]
### [Chapter 7) Other OS Quirks & Fixes]



## What works 

- macOS 10.6.X through 10.13.X
- Wi-Fi (10.8.X through 10.13.X)
- Graphics Resolution Set (ForceResolution QuirK)
- Fan
- USB
- Battery
- Trackpad (In macOS, not OC boot picker)
- Keyboard (In macOS, not OC boot picker)
- Audio



## What doesn't work

- Graphics Acceleration QE/CI. (Won't ever work)
- SDcard (Unlikely to work)
- MagicGate (Unlikely to ever work)
- HDMI
- Audio: Built-in Microphone
- Windows boot from OC/Clover
- FileVault
- Recovery
- Brightness Adjustment (Unlikely to ever work)
- Power Management
- Sleep / Wake
- FireWire
- PCMCIA
- VGA
- Keyboard/Mouse while in OpenCore boot picker. 



## Credits
