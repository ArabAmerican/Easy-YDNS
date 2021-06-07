# Simple IPv4 YDNS Bash Updater (NOT COMPLETE, DO NOT USE)

This is a fork of the YDNS Bash Updater Script found here (https://github.com/ydns/bash-updater)

The intent of this script is to use and provide a more simplistic method for users who are unfamiliar with Linux to utilize YDNS by attempting to prevent possible errors that may arise. This script also only uses IPv4 in case of errors resulting from a lack of IPv6 support.

## Tutorial for Windows 10

This script was tested to work on Windows 10 Home (20H2) using Windows Subsystem for Linux under Debian.

1) Download and extract the files from the .zip folder, and run the file "InstallLinuxSubsystem.cmd" 

	(Right-click and select "**Run as administrator**", otherwise error 740 will appear)

	Alternatively, you may run Command Prompt as an Administrator and paste the following line:

		DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux
		
	If done correctly, Command Prompt should ask you to restart. Restart and continue to step 2.
	
2)
	
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
