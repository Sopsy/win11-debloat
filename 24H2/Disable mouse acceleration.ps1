$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")
$RegMouse = $RegConnect.OpenSubKey("Control Panel\Mouse",$true)

$RegMouse.SetValue("MouseSpeed","0")
$RegMouse.SetValue("MouseThreshold1","0")
$RegMouse.SetValue("MouseThreshold2","0")

$RegMouse.Close()
$RegConnect.Close()

$code = @'
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
 public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, int[] pvParam, uint fWinIni);
'@

Add-Type $code -name Win32 -NameSpace System
[System.Win32]::SystemParametersInfo(4,0,@(0,0,0),2)