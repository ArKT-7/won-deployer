<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## 🧹 Uninstallation

### ❓ Why is Uninstallation Needed?

#### 🔹 Avoid Manual Partition Errors
#### If you plan to uninstall Windows, this guide will help you do so safely—without manually deleting partitions, which can lead to **human error**.

#### 🔹 Relock the Bootloader
#### When you’re ready to **relock your bootloader**, having a stock partition table is essential. This guide ensures your partitions are properly set, making relocking a smooth process.

### Prerequisites

- [```Android platform tools```](https://developer.android.com/studio/releases/platform-tools)
  
- [```Recovery Image```](https://github.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/releases/download/1.0/recovery.img)


## 📋 Prerequisites

Before you start, ensure you have:
- A **USB cable** to connect your **Xiaomi Pad 5** to your **other device**
- **any other device can be - android, windows, mac or linux**

> [!Warning]
> All your data will be erased! Back up now if needed.
>

## 🚀 Steps to Format Data and Set Stock Partition Layout

Follow these steps:

1. **Reboot the Nabu device into fastboot mode:**
   - Power off your Xiaomi Pad 5
   - Hold down **Power + Volume Down** buttons until the device enters fastboot mode.
   
3. **Connect to the Fastboot Tool on the Website:**
   - Open the [Nabu Fatboot Tool](https://arkt-7.github.io/nabu/) in the browser.
   - Click on the **Connect Fastboot** button.
   - Select your **Nabu device** from the list that appears and grant permissions if prompted (such as **allowing Android** if using an Android device).

4. **Format and Wipe Data:**
   - Scroll down to the **Format/Wipe Data** section.
   - Choose **Partition Layout - Stock**.
   - In the input box, type **format**.
   - Finally, click the **Wipe** button to start the formatting process.

> ✅ **Note:** Once completed, your Nabu device will have the default stock partition layout.

---

Enjoy using your freshly formatted Nabu device! 🎉 If you encounter any issues, refer to our support page for troubleshooting tips.


> [!NOTE]
> If you are rebooted into MIUI Recovery perform the following actions:
> 1. Select Wipe Data
> 2. Wipe All Data
> 3. After Data is wiped successfully, Click Back To Main Menu
> 4. Click Reboot
> 5. Reboot to System

## Done!
