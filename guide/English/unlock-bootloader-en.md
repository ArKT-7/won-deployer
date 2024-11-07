<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## 🔓 Unlocking the Bootloader: A Step-by-Step Guide for HyperOS/MIUI

### 📋 Prerequisites:

- [`📲 Mi Community App(only for HyperOS/MIUI 14)`](https://apkpure.net/xiaomi-community/com.mi.global.bbs/download).

- [`🔧 Mi Unlock Tool`](https://miuirom.xiaomi.com/rom/u1106245679/6.5.224.28/miflash_unlock-en-6.5.224.28.zip).

- [`🛠️ HyperSploit (bypass method)`](https://github.com/TheAirBlow/HyperSploit/releases/download/1.0.0/HyperSploit-Windows.exe).


> **[!NOTE]**  
> The waiting period in the Mi Unlock Tool may vary. Please be patient and wait until the process completes.

> **[!WARNING]**  
> During the waiting period, avoid resetting your device or logging out of your Xiaomi account.  
> **Data Backup**: Unlocking the bootloader will erase all data on your device. Ensure you have backed up any important data.

---

### 1. 🛠️ Enable Developer Options

- **For MIUI:**
  - Go to **Settings → About phone → MIUI version**.
  - Tap the MIUI version multiple times until developer options are enabled (you will see a popup message).

- **For HyperOS:**
  - Go to **Settings → My device → Detailed info and specs → OS version**.
  - Tap the OS version multiple times until developer options are enabled (you will see a popup message).

### 2. 🔓 Enable OEM Unlocking and USB Debugging
   - Go to **Settings → Additional settings → Developer options**.
   - Enable **OEM unlocking** and **USB debugging**.

### 3. 🔗 Bind Mi Account / Apply for Unlock

<details>
  <summary><strong>Standard Process (For MIUI 13 and below):</strong></summary>

  **3. Bind Mi Account:**
   - Go to **Settings > Additional settings > Developer options > Mi Unlock status**.
   - Click on **Add your Mi Account**. Once successfully added, a confirmation message "Added Successfully" will appear.

</details>

<details>
  <summary><strong>New Process (For HyperOS/MIUI 14):</strong></summary>
  
  <p>Select one of the following methods to proceed:</p>

  <!-- Time Trick Submenu -->
  <details>
    <summary><strong>Method 1: Using the Time Trick</strong></summary>
    
  > **If your device is the global version, you can apply for the bootloader unlock at a specific time.**

  - Xiaomi allows **2,000 devices to unlock daily**.
  - The reset time for this daily limit is **7 PM Moscow time**.

  **3. Apply to Unlock:**
   - Align your local time with **7 PM Moscow time** and be ready—timing is crucial.
   - Open the **Xiaomi Community app**, set it to Global, and sign in with the same account as on your device.
   - Go to the **"Me"** tab, click on **"Unlock bootloader,"** then click on **"Apply"**.
   - Once granted access, go to **Settings > Additional settings > Developer options > Mi Unlock status**.
   - Click on **Add your Mi Account**. After successful addition, you will see "Added Successfully."

  </details>

  <!-- HyperSploit Bypass Submenu -->
  <details>
    <summary><strong>Method 2: Using HyperSploit Bypass</strong></summary>
  
  **3. Apply to Unlock (HyperSploit):**
  - Run **HyperSploit-Windows.exe** as Administrator.
  - When prompted on your device, tap **OK** to allow USB debugging.
  - Follow the on-screen instructions in the HyperSploit window. When asked to bind your account:
    - Go to **Settings > Additional settings > Developer options > Mi Unlock status**.
    - Click on **Add your Mi Account**. Once added, HyperSploit will confirm with "Successfully binded."

  </details>

</details>

### 4. 🚀 Unlocking the Bootloader
   - Open the **Mi Flash Unlock Tool** and sign in with the same Mi account.
   - Put your device in **Fastboot Mode** and connect it to your PC.
   - Use the Mi Unlock Tool on your PC to unlock the bootloader.
   - If a waiting period error appears after 99% (likely 72 hours/3 days), close everything and wait until the period is over, then repeat this step.

---

### 🙏 Credits and Acknowledgements
This guide has been tested and verified by: [@ArKT_7](https://t.me/ArKT_7), [@I914900HX](https://t.me/I914900HX), [@Samponnporlsak](https://t.me/Samponnporlsak)
