# psexec-sudo
**Overview**

Pseudo "sudo" prompt for Windows using psexec64, allowing access to the `NT AUTHORITY\SYSTEM` account.

*Installation & Usage*

1. Download Sysinternals psexec
https://docs.microsoft.com/en-us/sysinternals/downloads/psexec

2. Place `sudo.cmd` and `psexec64.exe` into your `%PATH%`, execute with run prompt.

The script will verify administrative credentials, and then will run psexec64.exe with the switches `-s` `-i` and `cmd.exe`.
***
     -s         Run the remote process in the System account.
     -i         Run the program so that it interacts with the desktop of the
                specified session on the remote system. If no session is
                specified the process runs in the console session.
***

psexec is incredibly useful for diagnosing, troubleshooting, and verifying any remote administration tasks that require administrative or alternate credentials.
This is typically how tasks are run from Task Scheduler or remote admin tools, which will allow you to diagnose steps in scripts such as:
* Access to folders/files
* File paths are interpreted correctly (as you are launching from `%SYSTEMROOT%\System32`)
* Correct location of certain logs - for example, for Office installs run from a default Windows account context will store logs in `%LOCALAPPDATA%\Temp`, but will store in `%SYSTEMROOT%\Temp` when run from the SYSTEM context.
* Additional note: `SYSTEM` does not have any rights to access the network. When network access is required, it will use `DOMAIN\ComputerName$`. Therefore, the necessary permissions for something like a software install share would be to include the `Domain Computers` group. See reference below regarding %ComputerName% credential.

**Images**

![Run](https://i.imgur.com/HUwVHes.png)

![Prompt](https://i.imgur.com/waeiZNU.png)

Additional references:
* https://forums.ivanti.com/s/article/How-To-Test-SYSTEM-Account-Permissions
* https://www.itprotoday.com/compute-engines/psexec
* https://docs.microsoft.com/en-us/windows/desktop/Services/localsystem-account
* https://docs.microsoft.com/en-us/previous-versions/system-center/configuration-manager-2007/bb680595(v=technet.10)
