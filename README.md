# Easy DDNS using YDNS

This is a fork of the YDNS Bash Updater Script found here (https://github.com/ydns/bash-updater)

The purpose of this simple script is to check and update the IP stored in YDNS to the IP where this script is being run on, so that the hostname (example.ydns.eu) will always connect to the intended network IP. 

In other words, it's a DDNS using YDNS. 

The intent of this fork is to provide a more simplistic method for users who are unfamiliar with Linux to utilize YDNS by attempting to prevent possible errors that may arise. This script also only uses IPv4 in case of errors resulting from a lack of IPv6 support. 

This script was tested to work on Linux Mint 20.1 and Windows 10 Home (20H2) using Windows Subsystem for Linux under Debian. The tutorial below will guide you through installing and creating a proper script to allow you to update YDNS.

If you are using a Linux distribution such as Ubuntu, Mint, Debian, etc., you may skip to step 3.
## Steps for Windows 10 users

1) Download and extract the files from the .zip folder, and run the file "InstallLinuxSubsystem.cmd" 

	(Right-click and select "**Run as administrator**", otherwise error 740 will appear)

	Alternatively, you may run Command Prompt as an Administrator and paste the following line:

		DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux
		
	If done correctly, Command Prompt should ask you to restart. Restart and continue to step 2.
	
2) Download and Install Debian from the Microsoft Store

	https://www.microsoft.com/en-us/p/debian/9msvkqc78pk6
	
	When you run it for the first time, it will ask you to create a username and password. You can set this to whatever you like, but do not forget the password as you will need it later. Once you see a terminal window with a line at something like "username@laptopname:~$" proceed to step 3.
	
## Using Terminal (for Linux & Windows 10)

3) Drag the files "setup.sh" and "YDNS.sh" from the extracted zip folder to the Desktop (or move it somewhere that you can reference later)
4) In terminal, set the directory to the location of the files you just moved. An example is listed below if the files are moved to the desktop.

		username@laptopname:~$ cd /mnt/c/users/**YourWindowsUsername**/Desktop
5) Then, run the setup script. This can be done by typing this into terminal:

		./setup.sh
	This will ask you for the password you made earlier, type that in and hit enter.
	
	If done correctly, a lot of messages will appear. Don't worry, this setup script is installing assigning necessary permissions, updating repositories, and installing cURL and DNSutils so that YDNS can function. After one minute, a message should appear.
	
		Done.
6) Next, we will open ydns.sh and modify some of the variables inside the script (you can open it with Notepad)
	As it states, go to http://ydns.io/user/api and locate the API username and secret.
		If you haven't created an account on YDNS yet, this is the time to do so.
	Copy the username and secret and replace it with PASTE_USERNAME & PASTE_SECRET respectively. It should look something like this once you paste them:
	
		username="fFDHGF4df46Fg35F" 
		#Enter your API Username here
		
		secret="gfdY563DSGryhETRe" 
		#Enter your API Secret here

7) Choose the hostname that you are using from your YDNS account and replace it with PASTE_LINK. It should look similar to this:

		host="githubexample.ydns.eu" 
		#Enter the name of the host address you'd like to update here

8) Save the file and run it in terminal

		./ydns.sh
		
Congratulations! You've made it to the end! Run the ydns.sh script everytime you'd like to update the IP address. 
