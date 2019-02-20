# psexec-sudo
**Overview**

Pseudo "sudo" prompt for Windows using psexec64.

*Installation*
**Download Sysinternals psexec**
https://docs.microsoft.com/en-us/sysinternals/downloads/psexec

Place sudo.cmd and psexec64.exe into %PATH%, execute by running in run prompt. The script will verify administrative credentials, and then will run psexec64.exe with the switches -s and -i.
***
     -s         Run the remote process in the System account.
     -i         Run the program so that it interacts with the desktop of the
                specified session on the remote system. If no session is
                specified the process runs in the console session.
***
psexec is incredibly useful for diagnosing, troubleshooting, and verifying any remote administration tasks that require administrative or alternate credentials.

Additional references:
* https://forums.ivanti.com/s/article/How-To-Test-SYSTEM-Account-Permissions
* https://www.itprotoday.com/compute-engines/psexec
