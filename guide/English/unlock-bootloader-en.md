<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## Unlocking the Bootloader: A Detailed Step-by-Step Guide for HyperOS/MIUI

### Prerequisites:
- [```Mi Community App(only for HyperOS/MIUI 14)```](https://apkpure.net/xiaomi-community/com.mi.global.bbs/download).

- [`Mi Unlock Tool`](https://miuirom.xiaomi.com/rom/u1106245679/6.5.224.28/miflash_unlock-en-6.5.224.28.zip).

- [`HyperSploit - (bypass method)`](https://github.com/TheAirBlow/HyperSploit/releases/download/1.0.0/HyperSploit-Windows.exe).
>

>[!NOTE]
>
> Waiting period in Mi unlock Tool May be different so wait till.

>[!WARNING]
>
> During the waiting period, do not reset your device or log out of your Xiaomi account.
>
> Backup Data: Unlocking the bootloader will erase all data on your device. Make sure to back up important data before proceeding.

### 1. Enable Developer Options:

   **for MIUI:**
   - Go to Settings → About phone → MIUI version.
   - Tap the MIUI version multiple times until developer options are enabled(you will se a popup down).

   **for HyperOS:**
   - Go to Settings → My device → Detailed info and specs → OS version.
   - Tap the OS version multiple times until developer options are enabled(you will se a popup down).


### 2. Enable OEM Unlocking and USB Debugging:
   - Go to Settings → Additional settings → Developer options.
   - Enable OEM unlocking and USB debugging.

### 3. Bind Mi Account:/Apply to unlock

<details>
<summary><b><strong>Standard Process (For those who is on Miui-13 or less):</strong></b></summary>

 **```3. Bind Mi Account:```**
   - Go to Settings > Additional settings > Developer options > Mi Unlock status.
   - Click on "Add your Mi Account." After successful addition, you will see "Added Successfully."

  </summary>
</details>

<details>

<details>
  <summary><strong>New Process (Only for HyperOS/MIUI-14):</strong></summary>
  
  <p>Select one of the following methods to proceed:</p>

  <!-- Time Trick Submenu -->
  <details>
    <summary><strong>Method 1: Using the Time Trick</strong></summary>
   
>

> If your device is the global version, you can apply for the bootloader unlock at a specific time.

   **Time Trick:**
   - Xiaomi allows 2,000 devices to be apply unlock daily.
   - The reset time for this daily limit is 7 PM Moscow time.

 **```3. Apply to unlock:```**
   - Match your time with 7 PM Moscow time and be ready if you were not fast this will not work.
   - Open Xiaomi Community app, set it to Global, and sign in with the same account as on your device.
   - Go to the "Me" tab, click on "Unlock bootloader," then click on "Apply".
   - Once granted access, go to Settings > Additional settings > Developer options > Mi Unlock status.
   - Click on "Add your Mi Account." After successful addition, you will see "Added Successfully."

  </summary>

  </details>

  <!-- HyperSploit Bypass Submenu -->
  <details>
    <summary><strong>Method 2: Using HyperSploit Bypass</strong></summary>
    
    <ul>
      <li>Download and install <a href="https://github.com/TheAirBlow/HyperSploit/releases/download/1.0.0/HyperSploit-Windows.exe">HyperSploit</a>.</li>
      <li>Run HyperSploit as Administrator.</li>
      <li>Connect your device to the PC in **Developer Mode** with USB Debugging enabled.</li>
      <li>Follow the instructions provided by HyperSploit to complete the bypass and unlock the bootloader.</li>
    </ul>

  </details>

</details>


### 4. Unlocking the Bootloader:
   - Open the Mi Flash Unlock Tool and sign in with the same Mi account.
   - Put your device in Fastboot Mode and connect it to your PC.
   - Use the Mi Unlock Tool on your PC to unlock the bootloader.
   - If it shows a waiting period error after 99%, likely 72 hours/3 days, close everything and wait until the period is over, then repeat step 4.


#### Credits and Acknowledgements:
This guide has been tested by: [@ArKT-7](https://github.com/ArKT-7), [@ArKT_7](https://t.me/ArKT_7), [@I914900HX](https://t.me/I914900HX), [@Samponnporlsak](https://t.me/Samponnporlsak)
