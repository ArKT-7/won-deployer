<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## 🔓 Unlocking the Bootloader: A Step-by-Step Guide for HyperOS/MIUI

### 📋 Prerequisites:

- [`📲 Mi Community App(only for HyperOS/MIUI 14)`](https://apkpure.net/xiaomi-community/com.mi.global.bbs/download).

- [`🔧 Mi Unlock Tool`](https://miuirom.xiaomi.com/rom/u1106245679/6.5.224.28/miflash_unlock-en-6.5.224.28.zip).

- [`🛠️ HyperSploit (bypass method)`](https://github.com/TheAirBlow/HyperSploit/releases/download/1.0.0/HyperSploit-Windows.exe).


>[!WARNING]
>
> Backup Data: Unlocking the bootloader will erase all data on your device. Make sure to back up important data before proceeding.

---

### 1. 🛠️ Enable Developer Options

- **For HyperOS:**
  - Go to **Settings → My device → Detailed info and specs → OS version**.
  - Tap the OS version multiple times until developer options are enabled (you will see a popup message).

- **For MIUI:**
  - Go to **Settings → About phone → MIUI version**.
  - Tap the MIUI version multiple times until developer options are enabled (you will see a popup message).
    
>

### 2. 🔓 Enable OEM Unlocking and USB Debugging
 
   - Go to **Settings → Additional settings → Developer options**.
   - Enable **OEM unlocking** and **USB debugging**.
     
>

### 3. 🔗 Bind Mi Account / Apply for Unlock

>[!NOTE]
>
> ▶️ Click to Expand the menu.

>

### New Process (For HyperOS/MIUI 14): ⬇️

<details>
   <summary><strong>Method 1: Using HyperSploit Bypass (Recommended) ▶️</strong></summary>
    
>

  > **this will Bypass the daily quota limit while appling in the Mi Community app.**

  **```3. Apply to Unlock (HyperSploit):```**
  - Run **HyperSploit-Windows.exe** as Administrator.
  - When prompted on your device, tap **OK** to allow USB debugging.
  - Follow the on-screen instructions in the **HyperSploit** window. When asked to **attempt to bind account** :
    - Go to **Settings → Additional settings → Developer options → Mi Unlock status**.
    - Click on **Add account and device**, Once added, HyperSploit will confirm with **Successfully binded**
  > 
  > **Important: If the HyperSploit window says **Successfully binded**, but your device does not show it, you can still continue. This means the process worked ✅**

  </details>
  
  <details>
    <summary><strong>Method 2: Using the Time Trick ▶️</strong></summary>
    
>
    
  > **If your device is the global version, you can apply for the bootloader unlock at a specific time.**

  - Xiaomi allows **2,000 devices to unlock daily**.
  - The reset time for this daily limit is **7 PM Moscow time**.

  **```3. Apply to Unlock:```**
   - Align your local time with **7 PM Moscow time** and be ready—timing is crucial.
   - Open the **Xiaomi Community app**, set it to Global, and sign in with the same account as on your device.
   - Go to the **"Me"** tab, click on **"Unlock bootloader,"** then click on **"Apply"**.
   - Once granted access, go to **Settings → Additional settings → Developer options → Mi Unlock status**.
   - Click on **Add account and device**, After successful addition, you will see **Added Successfully**.

  </details>
  
</details>

<details>
  <summary><strong>Standard Process (For MIUI 13 and below): ▶️</strong></summary>
  
>

 **```3. Bind Mi Account:```**
   - Go to Settings > Additional settings > Developer options > Mi Unlock status.
   - Click on "Add your Mi Account." After successful addition, you will see "Added Successfully."

</details>

### 4. 🚀 Unlocking the Bootloader
   - Open the **Mi Flash Unlock Tool** and sign in with the same Mi account.
   - Put your device in **Fastboot Mode** and connect it to your PC.
   - Use the Mi Unlock Tool on your PC to unlock the bootloader.
   - If a waiting period error appears `likely 168 hrs/7 days`, close everything, wait until the period ends, then repeat this step.
>[!NOTE]
>
> Waiting period in Mi unlock Tool May be different so wait till.
>
> During the waiting period, do not reset your device or log out of your Xiaomi account.


---
## Support My Work

#### If you find my projects helpful, consider supporting my work! Your contributions will help me keep developing and sharing useful resources.

<p align="left">
  <a href="https://www.buymeacoffee.com/ArKT" target="_blank">
    <img src="https://github.com/ArKT-7/Temp-files/blob/main/assets/buymecoffee.png" alt="Buy Me A Coffee" style="height: 60px !important; width: 217px !important;">
  </a>
  <a href="https://www.paypal.me/arkt7" target="_blank">
    <img src="https://github.com/ArKT-7/Temp-files/blob/main/assets/Paypal.png" alt="Donate with PayPal" style="height: 60px !important; width: 217px !important;">
  </a>
</p>

### Credits & Acknowledgements
#### This guide has been tested and verified by :
- **Telegram:** [@ArKT_7](https://t.me/ArKT_7)  **GitHub:** [@ArKT-7](https://github.com/ArKT-7)

#### Special Thanks to :

- [TheAirBlow](https://github.com/TheAirBlow/)  **GitHub:** [HyperSploit](https://github.com/TheAirBlow/HyperSploit/)
