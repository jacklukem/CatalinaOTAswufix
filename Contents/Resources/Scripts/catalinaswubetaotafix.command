#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke

printf '\e[96m;%s\a' "$color"
printf "$'\e[40m'OTA Software update beta fix by jackluke"
clear && printf '\e[3J'
echo "\n\nWelcome to the Catalina OTA Software update beta fix"
echo "\nCopying the SoftwareUpdate VirtualMachineFaker dynamic library"
echo "\nDone"
sudo mount -uw /
sudo cp ~/*/CatalinaOTAswufix.app/Contents/Resources/Scripts/SUVMMFaker.dylib /usr/lib/
sudo cp ~/*/CatalinaOTAswufix.app/Contents/Resources/Scripts/com.apple.softwareupdated.plist /System/Library/LaunchDaemons/
sudo chown root:wheel /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
echo "\nSwitching to Catalina Beta Update channel"
sudo /System/Library/PrivateFrameworks/Seeding.framework/Resources/seedutil enroll DeveloperSeed
echo "\nRelaunching softwareupdate service catalog"
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
sudo launchctl load /System/Library/LaunchDaemons/com.apple.softwareupdated.plist
echo "\nDone"
echo "\nRefreshing available Catalina OTA Beta updates"
echo "sudo softwareupdate --list (GUI mode)"
open /System/Library/PreferencePanes/SoftwareUpdate.prefPane
echo "\nDone"
echo "\nIn few seconds redirecting to the Catalina Software Update panel"
echo "\nPlease wait in the Software Update prefpane at least one minutes and Beta updates will automatically show up"
echo "\nWhen ready select a Catalina OTA Beta update, start to download it and after 3% of downloading then apply the OTA fix"