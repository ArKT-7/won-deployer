---

<img align="right" src="../../assets/nabu.png" width="425" alt="Windows Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## How to run

### Prerequisites
- A functioning brain (seriously, you'll need to think!)
- [```ADB drivers installed on your PC```](https://dl.google.com/android/repository/usb_driver_r13-windows.zip)
- [```Tool installed : How to install Tool```](/guide/English/Installation.md)
- [```ARM Windows ESD```](https://worproject.com/esd) (Select - Version:  ```11``` Build:  ```22631.2861``` Architecture:  ```ARM64``` Edition:  ```CLIENT``` Language:  ```select your language```)
    
- [```Drivers```](https://github.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/releases/tag/Drivers)

---

1. **Put Your Xiaomi Pad 5 in Fastboot Mode**

   - Connect the device to your PC.

2. **Open PowerShell/terminal as Administrator**

3. **Run the WoN Deployer**

   - Type `won-deployer` in the PowerShell and follow the on-screen instructions.
    ```shell
   won-deployer
   ```
3. **Enter windows ESD or WIM file path**

   - `Paste path here` in the PowerShell when asked for path.
  `Enter the path of Windows ESD (Copy as path)::`

---

>[!NOTE]
> If you faced any error please run the below command and share the screenshot to [@ArKT_7](https://telegram.me/ArKT_7) or to [Offcial Group](https://telegram.me/nabuwoa)

### re-run program with detailed log output

   1. Close the PowerShell/Terminal you have open earlier

   2. Open PowerShell/Terminal as an Administrator again and run the following command:

   ```shell
   won-deployer --debug
   ```
---

### [Previous step: How to install](/guide/English/Installation.md)

### Visual Guide

- Here’s a visual method for running the tool and installing windows on nabu:

Coming soon....
