<img align="right" src="https://raw.githubusercontent.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/main/nabu.png" width="425" alt="Windows 11 Running On A Xiaomi Pad 5">

# Running Windows on the Xiaomi Pad 5

## Uninstallation

### Why is this needed?

If you want to uninstall windows this is used instead of deleting partitions manually to avoid human error + writing a whole dedicated guide to just uninstalling.

If you want to relock your bootloader you'll need your partition table to be stock.

### Prerequisites

- [```Android platform tools```](https://developer.android.com/studio/releases/platform-tools)
  
- [```Recovery Image```](https://github.com/erdilS/Port-Windows-11-Xiaomi-Pad-5/releases/download/1.0/recovery.img)

# 🛠️ Nabu Device Formatter Guide

Welcome to the **Nabu Device Formatter Guide**! This guide will walk you through using our website tool to **format data** and set up a **stock partition layout** on your Nabu device.

## 📋 Prerequisites

Before you start, ensure you have:
- A **USB cable** to connect your Nabu device to your computer or Android device
- **any other device can be - android, windows, mac or linux** (USB OTG support required)
- **google chrome browser**

> ⚠️ **Important:** Please back up any important data on your device, as this process will erase all data.

## 🚀 Steps to Format Data and Set Stock Partition Layout

Follow these steps:

1. **Reboot the Nabu device into fastboot mode:**
   - Hold down **Power + Volume Down** buttons until the device enters fastboot mode.

2. **Connect to the Fastboot Tool on the Website:**
   - Open the [Nabu Formatting Tool](https://arkt-7.github.io/nabu/) in a browser.
   - Click on the **Connect Fastboot** button.
   - Select your **Nabu device** from the list that appears and grant permissions if prompted (such as **allowing Android** if using an Android device).

3. **Format and Wipe Data:**
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
