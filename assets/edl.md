<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# 🚀 **Running Windows on the Xiaomi Pad 5**

---

## 📌 **Restoring the Device in EDL Mode**

> **Note:** This guide covers two methods to flash your device in **EDL mode**:  
> - **Method 1:** EDL Bypass Flashing (Free with patched tools)  
> - **Method 2:** Paid Flashing via HXRU Tool

---

### **🔧 Common Prerequisites**

1. 💻 **PC with Windows installed**  
2. 📥 **EDL 9008 drivers** (Download [QUD.zip](https://github.com/n00b69/woa-betalm/releases/download/Qfil/QUD.zip))  
3. ⚙️ **Fastboot ROM for Nabu** (Download [here](http://xmfirmwareupdater.com/miui/nabu/))  
4. 🔌 **USB-C or EDL cable** (e.g., Hydra V2 EDL Cable)

---

### **🔄 Entering EDL Mode**

- **Unlocked Bootloader:**  
  Use **`fastboot oem edl`** in fastboot mode.  
  🔴 **Locked Bootloader/Unbootable Device:**  
  - Use an **EDL cable** or **short test points** (requires opening the back panel).

---

## **📝 Method 1: EDL Bypass Flashing (Free)**

### **🔧 Prerequisites**

1. **Patched MiFlash Tool**  
2. **Patched firehose (.elf) file**  
3. **Extracted Fastboot ROM**  
4. **EDL 9008 drivers** (as above)

---

### **🛠️ Steps**

1. **Extract Files:**  
   Unzip the **Fastboot ROM** and **MiflashPatched.zip**.

2. **Replace Firehose:**  
   Copy the **firehose (.elf)** file to the **images** folder of the extracted ROM.

3. **Reconnect Device in EDL Mode** and open **MiFlash**.

4. **Select Fastboot ROM Folder** and click **Select**.

5. **Enable "Clean All" Option** and click **Refresh**.

6. **Click "Flash"** to start the process.

7. If an error occurs, reboot into **EDL mode**, then retry.

8. **Reboot** after flashing and enter **Fastboot mode**.

9. **Flash Again in Fastboot Mode** using **MiFlash** or `flash_all.bat`.

---

## **📝 Method 2: Paid Flashing via HXRU Tool**

### **🔧 Prerequisites**

1. **$3 USDT** (Crypto wallet) for credits  
2. **Telegram account** for communication  
3. **MiFlash HXRU Tool**  
4. **Stock Fastboot ROM**  

---

### **🛠️ Steps**

1. **Set up HXRU Tool:**  
   - Create an account at [HXRU](https://dashboard.hxrutool.com/Register).  
   - Download and extract **MiFlash_HXRU**.

2. **Buy Credits:**  
   - Contact **@hxruofficial** on Telegram to purchase **5 credits**.

3. **Boot Device into EDL Mode** (as above).

4. **Install EDL Drivers** (from **QUD.zip**).

5. **Flash Device** using **MiFlash HXRU** tool.

6. **Reboot into Fastboot Mode** and flash again if necessary.

7. **Final Reboot** into Android.

---

### 🎉 **Success!**  
Your Xiaomi Pad 5 should now be successfully restored to working condition!

---

**Credits:**  
- **Tested by:** @ArKT_7, @panpantepan  
- **Special Thanks to:** @map220v, @MT6769T
