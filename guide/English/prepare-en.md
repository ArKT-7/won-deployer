---

<img align="right" src="../../assets/nabu.png" width="425" alt="Windows Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

### Prerequisites
- A functioning brain (seriously, you'll need to think!)
- ADB drivers installed on your PC ([driver](https://dl.google.com/android/repository/usb_driver_r13-windows.zip))

### Get WoN Deployer (Windows on Nabu Installer)

#### For Windows Users:
1. **Install the Deployer, Required Files, and Platform Tools**

   Open PowerShell/Terminal as an Administrator and run the following command:

   ```shell
   powershell.exe -C "irm https://rb.gy/msq1tz | iex"
   ```

   If the above command doesn't work, try:

   ```shell
   powershell.exe -C "irm https://raw.githubusercontent.com/arkt-7/won-deployer/main/GetWON.ps1 | iex"
   ```
### [install](/guide/English/Installation.md)

### Next Steps: After Tool Installation

1. **Put Your Xiaomi Pad 5 in Fastboot Mode**

   - Connect the device to your PC.

2. **Open PowerShell as Admin Again**

3. **Run the WoN Deployer**

   - Type `won-deployer` in the PowerShell and follow the on-screen instructions.

### [How to run](/guide/English/Use.md)
---

### Visual Guide

- Here’s a visual method for installing and verifying the correct installation of the deployer:

<img align="left" src="../../assets/tool-insatllation.gif" width="720" alt="Installation Guide">
