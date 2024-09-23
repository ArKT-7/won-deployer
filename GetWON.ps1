<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flash .img files by ArKt</title>
    <script src="dist/fastboot.mjs" type="module"></script>
    <script src="download.js" type="module"></script>
    <style>
        .progress-container {
            width: 100%;
            height: 20px;
            background-color: #f3f3f3;
            border-radius: 5px;
            overflow: hidden;
            display: none; /* Initially hidden */
        }
        .progress-bar {
            height: 100%;
            width: 0%;
            background-color: #4caf50;
            transition: width 0.5s;
        }
    </style>
</head>
<body>
    <div>
        <p>Status: <span class="status-field">Not connected in Fastboot</span></p>
        <button class="connect-button">Connect device Fastboot</button>
    </div>
    
    <hr />

    <div>
        <form class="command-form">
            <label for="command">Command without fastboot:</label>
            <input type="text" name="command" class="command-input" />
            <input type="submit" value="Send" />
        </form>
        <button class="reboot-button">Reboot Device</button>
        <button class="reboot-bootloader-button">Reboot to Bootloader</button>
        <button class="reboot-recovery-button">Reboot to Recovery</button>
        <button class="reboot-fastbootd-button">Reboot to FastbootD</button>
        <p>Result:</p>
        <pre class="result-field"></pre>
    </div>

    <hr />

    <div>
        <form class="boot-form">
            <label for="boot-file">Boot image:</label>
            <input type="file" name="boot-file" class="boot-file" />
            <select name="boot-type" class="boot-type">
                <option value="">Select Boot Type</option>
                <option value="twrp-nabu">Twrp Recovery Nabu</option>
                <option value="win-uefi-nabu">Windows UEFI Boot Nabu</option>
                <option value="twrp-mod-nabu">Twrp Modded Recovery Nabu</option>
                <option value="orangefox-mod-nabu">OrangeFox Modded Recovery Nabu</option>
            </select>
            <input type="submit" value="Boot" />
        </form>
    </div>

    <hr />

    <div>
        <form class="flash-form">
            <label for="flash-file">Flash image:</label>
            <input type="file" name="flash-file" class="flash-file" />
            <br />
            <label for="flash-partition">Partition:</label>
            <input type="text" name="flash-partition" class="flash-partition" />
            <input type="submit" value="Flash" />
        </form>
        <button class="flash-boot-button">Flash Boot</button>
        <button class="flash-boot-a-button">Flash Boot A</button>
        <button class="flash-boot-b-button">Flash Boot B</button>
    </div>

    <hr />

    <div>
        <p>Status: <span class="factory-status-field"></span></p>
        <div class="progress-container">
            <div class="progress-bar"></div>
        </div>
        <button class="reconnect-button" style="display: none;"><h3>Reconnect device</h3></button>
        <br />
        <form class="factory-form">
            <label for="factory-file">Flash custom factory images zip:</label>
            <br />
            <input type="file" name="factory-file" class="factory-file" />
            <br />
            <input type="submit" value="Flash selected zip" />
        </form>
        <br />
    </div>

    <script type="module">
        import * as fastboot from "./dist/fastboot.mjs";
        import { BlobStore } from "./download.js";

        let device = new fastboot.FastbootDevice();
        window.device = device;
        let blobStore = new BlobStore();

        fastboot.setDebugLevel(2);

        async function connectDevice() {
            let statusField = document.querySelector(".status-field");
            statusField.textContent = "Connecting...";

            try {
                await device.connect();
            } catch (error) {
                statusField.textContent = `Failed to connect to device: ${error.message}`;
                return;
            }

            let product = await device.getVariable("product");
            let slot = await device.getVariable("current-slot");
            let serial = await device.getVariable("serialno");
            
            let deviceName = "";
            if (product === "nabu") {
                deviceName = "Device name - Xiaomi Pad 5";
            } else if (product === "dm3q") {
                deviceName = "Device name - Samsung S23 Ultra";
            }

            let status = `Connected to - ${product} <br /> Current slot - ${slot} <br /> (serial: ${serial})`;
            if (deviceName) {
                status += `<br />${deviceName}`;
            }

            statusField.innerHTML = status;
        }

        async function sendFormCommand(event) {
            event.preventDefault();
            let inputField = document.querySelector(".command-input");
            let command = inputField.value;
            let result = (await device.runCommand(command)).text;
            document.querySelector(".result-field").textContent = result;
            inputField.value = "";
        }

        async function rebootDevice() {
            let command = "reboot";
            let result = (await device.runCommand(command)).text;
            document.querySelector(".result-field").textContent = result;
        }

        async function rebootToBootloader() {
            let command = "reboot-bootloader";
            let result = (await device.runCommand(command)).text;
            document.querySelector(".result-field").textContent = result;
        }

        async function rebootToRecovery() {
            let command = "reboot-recovery";
            let result = (await device.runCommand(command)).text;
            document.querySelector(".result-field").textContent = result;
        }

        async function rebootToFastbootD() {
            let command = "reboot-fastboot";
            let result = (await device.runCommand(command)).text;
            document.querySelector(".result-field").textContent = result;
        }

        async function bootFormFile(event) {
            event.preventDefault();
            let fileField = document.querySelector(".boot-file");
            let bootTypeSelect = document.querySelector(".boot-type");
            let selectedBootType = bootTypeSelect.value;

            let file;
            if (fileField.files.length > 0) {
                file = fileField.files[0];
            } else {
                file = await downloadBootImage(getImagePath(selectedBootType));
            }

            if (!file) {
                alert("Please select a file or choose a boot type!");
                return;
            }

            await device.bootBlob(file);
            fileField.value = "";
            bootTypeSelect.selectedIndex = 0; // Reset selection
        }

        // Function to determine image path based on selected type
        function getImagePath(selectedBootType) {
            switch (selectedBootType) {
                case "twrp-nabu":
                    return "https://media.githubusercontent.com/media/ArKT-7/nabu/main/bin/twrp-nabu.img";
                case "win-uefi-nabu":
                    return "https://media.githubusercontent.com/media/ArKT-7/nabu/main/bin/uefi-nabu.img";
                case "twrp-mod-nabu":
                    return "https://media.githubusercontent.com/media/ArKT-7/nabu/main/bin/twrp-modded-nabu.img";
                case "orangefox-mod-nabu":
                    return "https://media.githubusercontent.com/media/ArKT-7/nabu/main/bin/orangefox-modded-nabu.img";
                default:
                    return null;
            }
        }

        // Function to download the boot image with progress
        async function downloadBootImage(imagePath) {
            const progressBarContainer = document.querySelector('.progress-container');
            const progressBar = document.querySelector('.progress-bar');
            progressBarContainer.style.display = 'block'; // Show the progress bar

            try {
                const response = await fetch(imagePath);
                if (!response.ok) throw new Error("Failed to download boot image");

                const contentLength = response.headers.get('Content-Length');
                const total = parseInt(contentLength, 10);
                let loaded = 0;

                const reader = response.body.getReader();
                const chunks = [];

                while (true) {
                    const { done, value } = await reader.read();
                    if (done) break;
                    chunks.push(value);
                    loaded += value.length;
                    progressBar.style.width = `${(loaded / total) * 100}%`; // Update progress
                }

                const blob = new Blob(chunks);
                const file = new File([blob], imagePath.split("/").pop(), { type: "image/img" });
                progressBarContainer.style.display = 'none'; // Hide the progress bar
                return file; // Return the downloaded file
            } catch (error) {
                progress
                console.error("Error downloading boot image:", error);
                alert("Error downloading boot image. Please try again.");
                progressBarContainer.style.display = 'none'; // Hide the progress bar
                return null; // Return null in case of an error
            }
        }

        async function flashImage(event) {
            event.preventDefault();
            let fileField = document.querySelector(".flash-file");
            let partitionField = document.querySelector(".flash-partition");

            let file;
            if (fileField.files.length > 0) {
                file = fileField.files[0];
            } else {
                alert("Please select a flash image file!");
                return;
            }

            let partition = partitionField.value;
            if (!partition) {
                alert("Please specify a partition to flash!");
                return;
            }

            await device.flashBlob(file, partition);
            fileField.value = "";
            partitionField.value = "";
        }

        async function flashSelectedZip(event) {
            event.preventDefault();
            let fileField = document.querySelector(".factory-file");

            let file;
            if (fileField.files.length > 0) {
                file = fileField.files[0];
            } else {
                alert("Please select a factory zip file!");
                return;
            }

            const progressBarContainer = document.querySelector('.progress-container');
            const progressBar = document.querySelector('.progress-bar');
            progressBarContainer.style.display = 'block'; // Show the progress bar

            try {
                await device.flashFactoryZip(file);
                alert("Flash completed successfully!");
            } catch (error) {
                console.error("Error flashing factory zip:", error);
                alert("Error flashing factory zip. Please try again.");
            } finally {
                progressBarContainer.style.display = 'none'; // Hide the progress bar
            }

            fileField.value = "";
        }

        document.querySelector(".connect-button").addEventListener("click", connectDevice);
        document.querySelector(".command-form").addEventListener("submit", sendFormCommand);
        document.querySelector(".reboot-button").addEventListener("click", rebootDevice);
        document.querySelector(".reboot-bootloader-button").addEventListener("click", rebootToBootloader);
        document.querySelector(".reboot-recovery-button").addEventListener("click", rebootToRecovery);
        document.querySelector(".reboot-fastbootd-button").addEventListener("click", rebootToFastbootD);
        document.querySelector(".boot-form").addEventListener("submit", bootFormFile);
        document.querySelector(".flash-form").addEventListener("submit", flashImage);
        document.querySelector(".factory-form").addEventListener("submit", flashSelectedZip);
    </script>
</body>
</html>
