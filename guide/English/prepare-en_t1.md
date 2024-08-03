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
2. **Checking if insatlled properly**

   Close the PowerShell/Terminal you have open earlier:

   Open PowerShell/Terminal as an Administrator again and run the following command:

   ```shell
   won-deployer -h
   ```
   If installed properly then it gives an output else error so do installation again
   
### [Next step: How to use](/guide/English/prepare-en_t2.md)

### Visual Guide

- Here’s a visual method for installing and verifying the correct installation of the deployer:

<img align="left" src="../../assets/tool-insatllation.gif" width="720" alt="Installation Guide">
