Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.Copilot*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Clipchamp.Clipchamp*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.BingNews*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.BingSearch*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.BingWeather*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.GetHelp*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.MicrosoftOfficeHub*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.MicrosoftSolitaireCollection*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.MicrosoftStickyNotes*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.PowerAutomateDesktop*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.Todos*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.WindowsAlarms*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.WindowsCamera*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.WindowsFeedbackHub*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.XboxIdentityProvider*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.XboxSpeechToTextOverlay*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftCorporationII.QuickAssist*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftWindows.CrossDevice*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.OutlookForWindows*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.YourPhone*'} | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftWindows.Client.WebExperience*'} | Remove-AppxPackage -AllUsers

# The below ones need an EOL hack to uninstall, so skipping for now. But they're useless as well.
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftWindows.Client.Photon*'} | Remove-AppxPackage -AllUsers
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftWindows.Client.AIX*'} | Remove-AppxPackage -AllUsers
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*MicrosoftWindows.Client.CoPilot*'} | Remove-AppxPackage -AllUsers
#Get-AppxPackage -AllUsers | Where-Object {$_.Name -Like '*Microsoft.Windows.Ai.Copilot.Provider*'} | Remove-AppxPackage -AllUsers
