<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# 🚀 **Running Windows on the Xiaomi Pad 5**

---

## 📌 **Restoring the Device in EDL Mode**
> **Note:** This guide includes two methods to flash your device in EDL mode:
> - **Method 1: EDL Bypass Flashing** (free method with patched tools).  
> - **Method 2: Paid Flashing with HXRU Tool**.  

---

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
