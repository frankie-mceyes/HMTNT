# HMTNT
_How Many TOR Nodes Today?_

## BACKGROUND
Whoever works in the Cyber Threat Intelligence field, more precisely in the **DarkINT** area, is aware of how much darknets can be useful. At the same time, they are useful as much as they are dangerous, if abused by attackers.

You can use this script for multiple reasons:
1. Block any TOR related traffic incoming, providing its output as a blocklist to proxy/WAF/web server applications;
2. Build a self-hosted history of past TOR exit nodes;
3. Check whenever an IP address has started/stopped being an exit node;
4. You say it.

This script uses an [official TOR resource](https://check.torproject.org/) to fetch the current TOR exit nodes and saves them in a structured folder system, like the following:
- `[day 1]`
  - `[day 1 - time 1]`
  - `[day 1 - time 2]`
  - `[...]`
- `[day 2]`
  - `[day 2 - time 1]`
  - `[day 2 - time 2]`
  - `[...]`

## SUGGESTED PREPARATION
### Clone the repository
```bash
$ git clone https://github.com/frankie-mceyes/HMTNT
$ cd HMTNT
```
### Customize
⚠️ I strongly suggest to configure the WORKDIR with an absolute path, since my personal recommendation is to use the `crontab` to repeat the activity over time, in order to have a stable and continuous history of addresses. A relative path could lead to some issues, if executed inside a cronjob.
```bash
$ vim hmtnt.sh
```
Edit the following variable if needed:
```
WORKDIR="$HOME/HMTNT/$(date +%d_%m_%Y)"
                 ↳ This is the default repository folder, you can change only this if you want
```
## USAGE
### One-shot
The script is ready to use out of the box 📦
Just run it inside its folder, after given the execution permission.
```bash
$ chmod +x ./hmtnt.sh
$ ./hmtnt.sh
```
You'll see some new files and folders.
```bash
$ ls -l
drwxr-xr-x 2 mceyes users 4096 apr 13 14:48 13_04_2023                       ← New folder
-rwxr-xr-x 1 mceyes users  362 apr 13 14:37 hmtnt.sh

$ cd 13_04_2023
$ ls -l
-rw-r--r-- 1 mceyes users 23571 apr 13 14:48 13_04_2023-14.48                ← New list of TOR exit nodes
```

### Crontab
I strongly suggest to automate the check with the use of `crontab`.
```bash
$ crontab -e
```
Next, choose how frequently you want the check to be performed automatically.
Keep
```
30 * * * * $HOME/HMTNT/hmtnt.sh                               # The script will run every 30 minutes
             ↳ Remember to change the path, if you didn't clone the repository in the Home directory
```
### Disk usage
The script only keeps the IPv4 addresses through a REGEX. Right now, every created file in my enviroment has a size of about 23/24 KB.

Let's say the script is configured to run every hour without interruption, it would use approximately 17.30MB of disk space every month.
