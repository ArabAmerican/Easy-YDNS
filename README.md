# Simple IPv4 DDNS using YDNS (NOT COMPLETE, DO NOT USE)

This is a fork of the YDNS Bash Updater Script found here (https://github.com/ydns/bash-updater)

The purpose of this simple script is to check and update the IP stored in YDNS to the IP where this script is being run on, so that the hostname (example.ydns.eu) will always connect to the intended network IP. In other words, it's a DDNS using YDNS. 

The intent of this fork is to provide a more simplistic method for users who are unfamiliar with Linux to utilize YDNS by attempting to prevent possible errors that may arise. This script also only uses IPv4 in case of errors resulting from a lack of IPv6 support.

Before beginning, you must create an account on https://ydns.io/ and create a host

This script was tested to work on Windows 10 Home (20H2) using Windows Subsystem for Linux under Debian. The tutorial below will guide you through installing and creating a proper script to allow you to update YDNS.

If you are using Ubuntu, Linux Mint, Debian, or another common Linux distrobution, you may skip to step 3
## Steps for Windows 10 users

1) Download and extract the files from the .zip folder, and run the file "InstallLinuxSubsystem.cmd" 

	(Right-click and select "**Run as administrator**", otherwise error 740 will appear)

	Alternatively, you may run Command Prompt as an Administrator and paste the following line:

		DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux
		
	If done correctly, Command Prompt should ask you to restart. Restart and continue to step 2.
	
2) Download and Install Debian from the Microsoft Store

	https://www.microsoft.com/en-us/p/debian/9msvkqc78pk6
	
	When you run it for the first time, it will ask you to create a username and password. You can set this to whatever you like, but do not forget the password as you will need it later. If you see a terminal window with a line at something like "username@laptopname:~$" proceed to step 3.
	
## Using Terminal
## Crontab Setup

To run this script every 15 minutes using `crontab`, add the following line to your crontab list:

```bash
*/15 * * * * /path/to/script/updater.sh > /dev/null
```

Although this works on most all implementations of `crontab`, for more portability use this instead:

```bash
0,15,30,45 * * * * /path/to/script/updater.sh > /dev/null
````

**NOTE:** To gain access to the crontab list to edit and add entries, execute `crontab -e` at the terminal

## Further notes

The code is licensed under the GNU Public License, version 3.

## Contribution

If you like to contribute useful changes to the script, simply fork the project, apply your changes and make a pull request.
