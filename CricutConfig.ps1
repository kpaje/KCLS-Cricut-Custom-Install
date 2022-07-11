#Creates a Cricut shortcut in public desktop and moves appdata to program files, so that the program is accesible by patrons


#Our security policy blocks any scripts from running on patron computers
#This must be performed first while logged into an admin account on a patron computer
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force


#Installs Cricut program
Start-Process ".\CricutDesignSpace-Install-v7.11.156.exe" -argumentlist "/passive /norestart" -wait


Copy-Item -Path "$env:LOCALAPPDATA\Programs\Cricut Design Space" -Destination "C:\Program Files" -recurse -Force

#Set Source path and Shortcut target path
$SourceFilePath = "C:\Program Files\Cricut Design Space\Cricut Design Space.exe"
$ShortcutPath = "$env:Public\Desktop\Cricut Design Space.lnk"

#Create the shortcut
$WScriptObj = New-Object -ComObject ("WScript.Shell")
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath)

#Save newly created shortcut to target destination
$shortcut.TargetPath = $SourceFilePath
$shortcut.Save()


#When the policy is set to Bypass, it means ANYONE can run scripts
#sets script policy back to Restricted
Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser -Force