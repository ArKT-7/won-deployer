<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# 🚀 **Running Windows on the Xiaomi Pad 5**

---

## 📌 **Restoring the Device in EDL Mode**

> **Note:** This guide provides two methods for restoring your device in **EDL mode**:  
> - **Method 1:** **EDL Bypass Flashing** (Free method using patched tools).  
> - **Method 2:** **Paid Flashing via HXRU Tool**.

---

### **🔧 Common Prerequisites**

Before proceeding with either method, ensure the following requirements are met:

1. 💻 **PC with Windows installed.**  
2. 📥 **EDL 9008 drivers installed.**  
   - Download and extract the [QUD.zip](https://github.com/n00b69/woa-betalm/releases/download/Qfil/QUD.zip).  
   - Install the drivers via **Device Manager** if your device shows **QUSB_BULK_CID** with a ⚠️ warning.
3. ⚙️ **Fastboot ROM for Nabu (Xiaomi Pad 5).**  
   - Download the latest ROM from [here](http://xmfirmwareupdater.com/miui/nabu/).
4. 🔌 **USB-C cable** or **EDL cable** (e.g., **Hydra V2 EDL Cable**).

---

### **🔄 Entering EDL Mode**

To proceed with the flashing, you need to boot your device into **EDL mode**. Use one of the following methods:

- **If the Bootloader is Unlocked:**  
  Run the following command in **fastboot mode**:  
  **`fastboot oem edl`**

- **If the Bootloader is Locked or the Device is Unbootable:**  
  - **Option 1:** Use an **EDL cable** (e.g., **Hydra V2 EDL Cable**). Insert the cable into your device and press the button as instructed.  
  - **Option 2:** **Short the test points** (requires opening the back panel of the device).  

---

## **📝 Method 1: EDL Bypass Flashing (Free Method)**

### **🔧 Prerequisites for Method 1**
1. **Patched MiFlash Tool.**  
2. **Patched firehose (.elf) file** for your device.  
3. **Extracted Fastboot ROM** (for Nabu).  
4. **EDL 9008 drivers installed** (as mentioned in Common Prerequisites).

---

### **🛠️ Steps to Follow:**

1. **Extract the Files:**  
   - Unzip both the **Fastboot ROM** and the **MiflashPatched.zip** file.

2. **Replace the Firehose File:**  
   - Copy the **patched firehose (.elf)** file into the **images** folder of the extracted **Fastboot ROM** and replace the existing one.

3. **Reconnect the Device:**  
   - Reboot your device into **EDL mode** and connect it to the PC.

4. **Open the Patched MiFlash Tool:**  
   - Launch **XiaoMiFlash.exe** from the **MiflashPatched** folder.

5. **Select the Fastboot ROM Folder:**  
   - Click on **Select** in the MiFlash tool and choose the folder where the **Fastboot ROM** is extracted.

6. **Enable Clean All Option:**  
   - Ensure that only the **Clean All** option is checked at the bottom of the tool.

7. **Start the Flashing Process:**  
   - Click **Refresh** to detect your device.  
   - Click **Flash** to begin the flashing process.

8. **Handle Possible Errors:**  
   - If an error occurs, reboot the device into **EDL mode**, click **Refresh** again, and then click **Flash** to retry.

9. **Reboot the Device:**  
   - After the flashing completes, reboot the device by holding the **Power** button.

10. **Flash Again in Fastboot Mode:**  
    - If your device enters **fastboot mode**, follow these steps:  
      - Select **Clean All** in the MiFlash tool and click **Refresh**.  
      - Click **Flash** to start the process again.

11. **Completion:**  
    - After flashing, your device will automatically boot into **Android**.

---

## **📝 Method 2: Paid Flashing with HXRU Tool**

### **🔧 Prerequisites for Method 2**
1. **Crypto wallet** with **$3 USDT** (to purchase credits for the HXRU tool).  
2. **Telegram account** for communication.  
3. **MiFlash HXRU Auth Tool** (download from [here](https://hxrutool.com)).  
4. **Stock fastboot ROM** (download from [here](http://xmfirmwareupdater.com/miui/nabu/)).

---

### **🛠️ Steps to Follow:**

1. **Set up the HXRU Tool:**
   - Create an account at [HXRU](https://dashboard.hxrutool.com/Register).
   - Download **MiFlash HXRU Auth Tool** from the website.
   - Extract the **MiFlash_HXRU.rar** file.
   - Open **PASS123.rar** using the password `123` and extract **MiFlash_HXRU.zip** to a folder.

2. **Buy Credits:**  
   - Contact **@hxruofficial** on Telegram to purchase **5 credits** (for about **$3**).

3. **Boot the Device into EDL Mode:**  
   - Use one of the methods outlined in the **EDL Mode** section.

4. **Install EDL Drivers:**  
   - If the device shows **QUSB_BULK_CID** in Device Manager, install the **EDL drivers** from the **QUD.zip** folder.

5. **Flash the Device:**  
   - Open **XiaoMiFlash.exe** and select the **Fastboot ROM** folder.
   - Click **Select** and choose the folder.
   - Press **Flash** to begin the flashing process.

6. **Reboot the Device to Fastboot Mode:**  
   - After flashing, reboot to **fastboot mode** and flash again using **MiFlash** or the `flash_all.bat` script.

7. **Final Reboot:**  
   - After completing the process, reboot your device using the **Power** button, and it should boot into **Android**.

---

**🎉 Congratulations!**  
Your Xiaomi Pad 5 should now be successfully restored, either through **EDL Bypass Flashing** or **Paid Flashing with HXRU Tool**.

---

### **Credits:**
- **Tested by:** @ArKT_7, @panpantepan (Telegram)  
- **Special Thanks to:** @map220v, @MT6769T (Telegram)
