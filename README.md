# Windows 11 debloat
Yet another Windows 11 debloating script. For 24H2.

There's a lot of personalization here, so you might not like what it does.
However, this gets rid of almost all of the unnecessary crap MS bundles with Windows nowadays.

Currently this does not turn of all Recall and AI functions, as MS has yet to enable them in my machines.
They might still be insider-only at the time of writing.

Published on GitHub just so I have an easier access to this on computers I set up. But feel free to use and do whatever you want with it.

Public domain.

---

LGPO is the Local Group Policy Object Utility, used here for backing up and restoring the group policy settings. It can be downloaded with the Microsoft Security Compliance Toolkit.

https://techcommunity.microsoft.com/blog/microsoft-security-baselines/lgpo-exe---local-group-policy-object-utility-v1-0/701045

---

To see what the LGPO backup contains, see the User policy.txt and Machine policy.txt files.

You can also set these by hand and skip running LGPO.exe.

---

## Usage

To run PS scripts, you need to enable it first, so it might be easier to just open them in notepad and copy&paste the commands to PowerShell.

If you want to disable Windows Defender, first turn off Tamper Protection from Settings. Windows Defender uses quite a bit of system resources and slows down everything, but there is an obvious security risk disabling it.
Don't do it if you don't know what might happen.

First of all download LGPO.zip from the below link and unzip LGPO.exe to the LGPO folder (LGPO\LGPO.exe).  
https://www.microsoft.com/en-us/download/details.aspx?id=55319

Steps:
1. Run LGPO\Restore.bat as admin
2. Run script.bat as admin
3. Run Remove bloatware.ps1 as admin
4. And maybe run Disable sounds.ps1 and Disable mouse acceleration.ps1 as well.

---