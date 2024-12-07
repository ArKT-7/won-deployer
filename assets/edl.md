<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# 🚀 **Running Windows on the Xiaomi Pad 5**

## 📌 **Restoring the Device in EDL Mode**

> **Note:** This guide provides two methods for restoring your device in **EDL mode**:  
> - **Method 1: EDL Bypass Flashing** (a free method using patched tools).  
> - **Method 2: Paid Flashing using the HXRU Tool** (required in case bypass not work after flashing).


### **🔧 Common Prerequisites**
Before proceeding with either method, ensure the following are ready:  
1. 💻 **PC with Windows installed.**  
2. 📥 **EDL 9008 drivers installed.**  
   - Download and extract [QUD.zip](https://github.com/n00b69/woa-betalm/releases/download/Qfil/QUD.zip).  
   - Install drivers via **Device Manager** if your device shows **QUSB_BULK_CID** with a ⚠️ warning.  
3. ⚙️ **Fastboot ROM for Nabu (Xiaomi Pad 5).**  
   - Download the latest ROM [here](http://xmfirmwareupdater.com/miui/nabu/).  
4. 🔌 **USB-C cable or EDL cable** (e.g., **Hydra V2 EDL Cable**).  

---

### **🔄 Entering EDL Mode**
Use one of these methods to boot into EDL mode:  

- **Unlocked Bootloader:**  
  Run the following command in fastboot mode:  
  ```bash
  fastboot oem edl

- **Locked Bootloader or Unbootable Device:**  
- Use an **EDL cable**. Insert the cable into your device and press the button as instructed.  
- Alternatively, **short test points** (requires opening the back panel).

## **Method 1: EDL Bypass Flashing** (Free Method)
> This method uses patched tools to bypass EDL authentication.

### **🔧 Prerequisites**
1. **Patched MiFlash Tool**.  
2. **Patched firehose (.elf) file** for your device.  
3. **Fastboot ROM** (extracted).

---

### **📝 Steps**
1. **Extract Files:**  
   - Unzip the Fastboot ROM and the **MiflashPatched.zip**.

2. **Replace Firehose:**  
   - Copy the patched firehose `.elf` file into the ROM's `images` folder, replacing the existing file.

3. **Connect Device:**  
   - Reboot your device into EDL mode and connect it to your PC.

4. **Open Patched MiFlash Tool:**  
   - Launch **XiaoMiFlash.exe** from the **MiflashPatched** folder.

5. **Select ROM:**  
   - Click **Select** in MiFlash and choose the folder containing the extracted ROM.

6. **Tick Clean All:**  
   - Ensure only the **Clean All** option is selected.

7. **Start Flashing:**  
   - Click **Refresh** to detect your device.  
   - Click **Flash** to start the process.

8. **Handle Errors:**  
   - If an error occurs, reboot into EDL mode, click **Refresh**, and retry.

9. **Reboot Device:**  
   - After flashing, reboot the device using the **Power** button.

10. **Flash Again in Fastboot Mode:**  
    - If the device enters fastboot mode, flash again using MiFlash or the `flash_all.bat` script.

11. **Complete the Process:**  
    - Your Nabu should automatically boot into Android.


## **Method 2: Paid Flashing via HXRU Tool**

### **🔧 Prerequisites**
1. **Crypto wallet** with **$3 USDT** for purchasing credits.  
2. **Telegram account** for communication.  
3. **MiFlash HXRU Auth Tool** [Download link](https://hxrutool.com).  
4. **Stock fastboot ROM** [Download link](http://xmfirmwareupdater.com/miui/nabu/).  

---

### **📝 Steps**
1. **Set up HXRU Tool:**
   - Create an account at [HXRU](https://dashboard.hxrutool.com/Register).
   - Download **MiFlash HXRU Auth Tool** from the website.
   - Extract the file, and open the **MiFlash_HXRU.rar**.
   - Open **PASS123.rar** with password `123`.  
   - Extract **MiFlash_HXRU.zip** to a folder.

2. **Buy Credits:**
   - Contact **@hxruofficial** on Telegram to buy credits.
   - You will need **5 credits** to flash your device, which costs **$3**.

3. **Boot into EDL Mode:**
   - Follow the **Unlock Bootloader** or **Locked Bootloader** procedure (see Method 1).

4. **Install EDL Drivers:**  
   - If the device shows **QUSB_BULK_CID** in Device Manager, install the **EDL drivers** from the extracted folder.  

5. **Flash Device:**
   - Open **XiaoMiFlash.exe** and select the **stock fastboot ROM** folder.
   - Click **Select** and choose the ROM folder.
   - Press **Flash** to start the process.

6. **Reboot to Fastboot:**  
   - After flashing, reboot to fastboot mode and use **MiFlash** or `flash_all.bat` to flash again.
   - Ensure only **Clean All** is selected.

7. **Reboot Device:**  
   - After flashing, reboot the device by holding the **Power** button for 14 seconds.
