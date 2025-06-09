# Anti-Timeout Prevention Script

A PowerShell script that prevents your VDI session from timing out due to inactivity. This script will simulate a middle-mouse button click if inactivity is detected for more than 60 seconds.

> Ideal for long-running tasks or when stepping away from the keyboard.

### Disclaimer

Use responsibly. Always check with your IT/security policies before using this.

## Instructions
  1. Open your File Explorer
  2. Type 'startup' in the file path and click enter
> Your current directory should now be:```C:\Users\Your Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup```
  3. Create a shortcut in your startup folder
  4. When prompted to "Type the location of the item" paste the following ```C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden -command "$myshell=New-Object -com \"Wscript.Shell\";while(1){$myshell.SendKeys(\"{SCROLLLOCK}{SCROLLLOCK}\");Start-Sleep -Seconds 60}"```
  5. Give your shortcut a name (ex. powershell)
  6. Click Finish!
> Since you are setting this up for the first time, you may need to double-click the newly created shortcut to initialize the powershell script, or simply restart the VDI and you should be good to go since we put this in our startup folder.




