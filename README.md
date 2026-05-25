# server-stats

A simple Bash script to monitor basic performance statistics of any Linux server.

## Description

`server-stats.sh` is a lightweight monitoring tool written in pure Bash. It runs on any Linux distribution without requiring external dependencies, providing a quick overview of system resource usage.

## Features

The script reports:

- **CPU usage** — total CPU utilization percentage
- **Memory usage** — used vs available RAM with percentage
- **Disk usage** — total, used, and free space on the root filesystem
- **Top 5 processes by CPU** — most CPU-intensive processes
- **Top 5 processes by memory** — most memory-intensive processes
- **System info** — OS version, uptime, load average, logged-in users

## Requirements

- Linux system (tested on Ubuntu 24.04.4)
- Bash 4.0 or newer
- Standard utilities: `top`, `free`, `df`, `ps`, `awk`, `grep`, `uptime`, `who`

All required tools are pre-installed on virtually any Linux distribution.

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/server-stats.git
cd server-stats
```

Make the script executable:

```bash
chmod +x server-stats.sh
```

## Usage

Run the script:

```bash
./server-stats.sh
```

No arguments needed.

## Example output

```
===CPU USAGE===
CPU usage: 4.70%

===MEMORY===
Available Ram: 65.20%
Used Ram: 29.80%

===DISK USAGE===
Total: 100G | Used: 45G | Free: 55G | Use%: 46%

===TOP 5 PROCESS BY CPU USAGE===
    PID USER         %CPU %MEM COMMAND
   1523 jacopo        5.2  3.4 firefox
   2104 jacopo        2.1  1.8 code
    ...

===OTHER INFO===
OS: Ubuntu 22.04.3 LTS
UPTIME: up 2 hours, 15 minutes
LOAD AVERAGE (1m, 5m, 15m): 0.15 0.23 0.18
LOGGED USERS: 2
```

## How it works

The script uses standard Linux utilities and parses their output with `awk`:

- CPU is calculated as `100 - idle` from `top -bn1`
- Memory percentages come from `free -m`
- Disk info is extracted from `df -h /`
- Processes are sorted with `ps --sort=-%cpu` and `--sort=-%mem`
- System info is collected from `/etc/os-release`, `/proc/loadavg`, `uptime`, and `who`

## Possible improvements

- Add network statistics (interfaces, bandwidth)
- Save output to a log file for historical tracking
- Send alerts when thresholds are exceeded (e.g., disk > 90%)
- Support for multiple disk mount points
- Add failed SSH login attempts counter

## Author

Built by Jacopo as part of an IT learning journey.

## License

This project is released under the MIT License — feel free to use, modify, and share.
