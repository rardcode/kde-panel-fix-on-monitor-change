# 🖥️ KDE Panel Fix on Monitor Change (udev-based solution)

# !! PROBLEM FIXED in Kde 6.4.2 o 6.3.3 !!

https://blogs.kde.org/2025/07/05/this-week-in-plasma-chugging-along/

[...]*Fixed a similar weird bug that could, under certain circumstances, cause your Plasma panels to disappear after the screen they’re displayed on turns off and back on again.*[...]

## ❓ The Problem

On KDE Plasma (e.g. on openSUSE), when changing monitor configuration — docking/undocking a laptop, plugging/unplugging an external screen — the desktop panel:

- Disappears or resets to default
- Loses user widgets and configuration
- Jumps to the wrong monitor
- Sometimes appears only after reboot or Plasma Shell restart

This is often caused by how Plasma tracks screen IDs in combination with the auto-loading behavior of `kscreen`.

## ✅ The Solution

A reliable workaround is to **trigger a user-level script via a system-wide `udev` rule** every time a monitor is plugged or unplugged.

This solution consists of:

1. A **udev rule** that reacts to monitor events
2. A **root-level script** that identifies the active user session
3. A **user-level script** that safely restarts Plasma shell or reconfigures the panel

Put:
- `98-hdmi-monitor.rules` in `/etc/udev/rules.d/`
- `on-monitor-change.sh` in `/usr/local/bin/`
- `restart-plasma.sh` in `/home/your_user/.local.bin`

1. Change USER_NAME env in `on-monitor-change.sh` script.
2. Reload udev rules:
```
udevadm control --reload
```
