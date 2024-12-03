# Downloads Sorter

A simple program to monitor and automatically organize your Downloads folder by file type. This project uses a PowerShell script (`monitor_downloads.ps1`) to detect changes in the Downloads folder and a Python script (`sortDownloads.py`) to sort files into subfolders based on their file extensions.

## Features
- Monitors the Downloads folder in real-time for file additions, deletions, and changes.
- Automatically moves files into subfolders (e.g., `png`, `pdf`, `txt`) based on their extensions.
- Ignores temporary and system-generated files (e.g., `.tmp`).

---

## Installation

### Prerequisites
1. **Python**:
   - Install Python (version 3.10 or higher).
   - Add Python to your system's PATH environment variable.
2. **PowerShell**:
   - Ensure you have PowerShell installed (comes pre-installed on Windows).

### Clone the Repository
```bash
git clone https://github.com/<your-username>/downloads-sorter.git
cd downloads-sorter
```

---
## Usage
### Step 1: Configure the Scripts
1. Open monitor_downloads.ps1 and update the paths:
   - Set $pythonScript to the full path of sortDownloads.py.
   - Set $pythonExecutable to the full path of your Python executable.
2. Ensure sortDownloads.py is in the same directory or update its location in the PowerShell script.

### Step 2: Run the Monitor Script
1. Open PowerShell
2. Ensure sortDownloads.py is in the same directory or update its location in the PowerShell script.
