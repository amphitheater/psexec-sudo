# psexec-sudo
**Overview**

Quick pseudo "sudo" prompt for Windows using psexec64, allowing access to the `NT AUTHORITY\SYSTEM` account.

*Installation & Usage*

**Download Sysinternals psexec**

https://docs.microsoft.com/en-us/sysinternals/downloads/psexec

Place `sudo.cmd` and `psexec64.exe` into your `%PATH%`, execute with run prompt.

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

**Images**
![Run](https://i.imgur.com/HUwVHes.png)

![Prompt](https://i.imgur.com/waeiZNU.png)

Additional references:
* https://forums.ivanti.com/s/article/How-To-Test-SYSTEM-Account-Permissions
* https://www.itprotoday.com/compute-engines/psexec
