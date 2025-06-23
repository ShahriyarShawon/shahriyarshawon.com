+++
title = "How to Set Up Printing for Brother MFC L2710DW on (Arch) Linux"
date = "2024-11-21T00:51:33-05:00"

tags = ["linux", "arch", "printer"]
+++

***As of 2024 there was a vulnerability found in CUPS so instead of running `systemctl enable cups.service` you should probably just
explicitly start it with `systemctl start cups.service` when you need to print.***


# Installation

### Find the packages for your distro if not on Arch

- [cups](https://repology.org/project/cups/versions)
- [ghostscript](https://repology.org/project/ghostscript/versions)

The driver will either need to be obtained via the manufacturer or check to see if your package repositories have it anywhere, AUR has the driver for my printer

```bash
# Install Cups
$ pacman -S cups

# Install GhostScript
$ pacman -S ghostscript

# Install Drivers for Brother MFC L2710DW
## The drivers on Arch is in the AUR
$ paru MFC-L2710DW

# Start Cups
$ systemctl start cups.service
```

# Configuration
- Navigate to `localhost:631` > Administration > Add Printer
- In `Connection` enter : `ipp://<PRINTER_IP>/ipp/port1`
- Select Driver (I ended up choosing the "IPP Everywhere" driver)

#### Note: The section mentioned in the Arch Wiki is slightly different now
