@echo off

echo "#### Before running this script, import the Group Policy backup (run LGPO\Restore.bat as admin) and turn off Tamper Protection if you want to disable Windows Defender"
echo #### Say "no" to all "reboot now?" -questions!
pause

echo #### Disabling 8dot3name (compatibility for DOS software with a performance penalty) creation and strip them...
fsutil behavior set disable8dot3 1
fsutil 8dot3name strip /s /f c:

echo #### Disabling hibernation and fast boot...
powercfg -h off

echo #### Setting Notification advanced preferences...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f

echo #### Disabling Bluetooth Swift Pair...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Bluetooth" /v QuickPair /t REG_DWORD /d 0 /f

echo #### Setting Privacy/General preferences...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications" /v EnableAccountNotifications /t REG_DWORD /d 0 /f

echo #### Disabling "Let Windows track app launches"...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_IrisRecommendations /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\EdgeUI" /v DisableMFUTracking /t REG_DWORD /d 1 /f
REM DisableMFUTracking maybe does not exist in Win11?

echo #### Disabling Speech, inking and typing data collection...
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v Value /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Input\Settings" /v InsightsEnabled /t REG_DWORD /d 0 /f

echo #### Turning off Malicious Software Removal Tool telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontReportInfectionInformation /t REG_DWORD /d 1 /f

echo #### Setting Edge Group Policy (not available in gpedit by default)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EnableMediaRouter /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowCastIconInToolbar /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v StartupBoostEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v NewTabPageHideDefaultTopSites /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AddressBarMicrosoftSearchInBingProviderEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AdsSettingForIntrusiveAdsSites /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundTemplateListUpdatesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BuiltInDnsClientEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ConfigureOnlineTextToSpeech /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ConfigureShare /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EdgeShoppingAssistantEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ExperimentationAndConfigurationServiceControl /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ForceSync /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v LocalProvidersEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v MediaRouterCastAllowAllIPs /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v NonRemovableProfileEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowOfficeShortcutInFavoritesBar /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SpeechRecognitionEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SyncDisabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 1 /t REG_SZ /d favorites /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 2 /t REG_SZ /d settings /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 3 /t REG_SZ /d passwords /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 4 /t REG_SZ /d addressesAndMore /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 5 /t REG_SZ /d extensions /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 6 /t REG_SZ /d history /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 7 /t REG_SZ /d openTabs /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\SyncTypesListDisabled" /v 8 /t REG_SZ /d collections /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TranslateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HubsSidebarEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BrowserSignin /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v QuickSearchShowMiniMenu /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TyposquattingCheckerEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v WebWidgetAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v EdgeCollectionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BrowserAddProfileEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v LocalBrowserDataShareEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ProactiveAuthWorkflowEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v LinkedAccountEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v GuidedSwitchEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SwitchSitesOnIEModeSiteListToWorkProfile /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SwitchIntranetSitesToWorkProfile /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ConfigureOnPremisesAccountAutoSignIn /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ResolveNavigationErrorsUseWebService /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AlternateErrorPagesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TabServicesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowHistoryThumbnails /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SearchSuggestEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SearchFiltersEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenPuaEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenDnsRequestsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DiagnosticData /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v UrlDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v NewTabPagePrerenderEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TextPredictionEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SpellcheckEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v DefaultShareAdditionalOSRegionSetting /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BackgroundModeEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PerformanceDetectorEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AccessibilityImageLabelsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SeamlessWebToBrowserSignInEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AADWebSSOAllowed /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AADWebSiteSSOUsingThisProfileEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v GuidedSwitchEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SpotlightExperiencesAndRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PromotionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BingAdsSuppression /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ConfigureFriendlyURLFormat /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v BlockThirdPartyCookies /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v QuickViewOfficeFilesEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v VisualSearchEnabled /t REG_DWORD /d 0 /f

echo #### Disabling Connected User Experiences and Telemetry...
sc stop DiagTrack
sc config DiagTrack start=disabled
sc stop dmwappushservice
sc config dmwappushservice start=disabled

echo #### Disabling Windows Error Reporting Service...
sc stop WerSvc
sc config WerSvc start=disabled

echo #### Disabling telemetry and feedback related scheduled tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\PcaPatchDbTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable

REM #### These are disabled because I'm unsure what these actually do, should be related to preinstalled apps
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v FeatureManagementEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SlideshowEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContentEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RemediationRequired /t REG_DWORD /d 0 /f

echo #### Uninstalling OneDrive...
taskkill /f /im OneDrive.exe
"%localappdata%\Microsoft\OneDrive\23.081.0416.0001\OneDriveSetup.exe" /uninstall

echo #### Uninstalling Remote Desktop Connection...
mstsc /uninstall

echo #### Removing unnecessary optional features...
dism /Online /Disable-Feature /FeatureName:WorkFolders-Client /NoRestart
dism /Online /Remove-Capability /CapabilityName:VBSCRIPT /NoRestart
dism /Online /Remove-Capability /CapabilityName:App.StepsRecorder /NoRestart
dism /Online /Remove-Capability /CapabilityName:Browser.InternetExplorer /NoRestart
dism /Online /Remove-Capability /CapabilityName:MathRecognizer /NoRestart
dism /Online /Remove-Capability /CapabilityName:Microsoft.Windows.PowerShell.ISE /NoRestart
dism /Online /Remove-Capability /CapabilityName:OpenSSH.Client /NoRestart
dism /Online /Remove-Capability /CapabilityName:Hello.Face.20134 /NoRestart

REM These possibly require non-N Windows to work from GP
echo #### Disabling Copilot from Start menu, online search and search history collection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsAADCloudSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsMSACloudSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v SafeSearchMode /t REG_DWORD /d 0 /f

echo #### Installing Media Feature Pack (For N editions)...
dism /Online /Add-Capability /CapabilityName:Media.MediaFeaturePack /NoRestart
dism /Online /Disable-Feature /FeatureName:WindowsMediaPlayer /NoRestart

echo #### Disabling additional Copilot features and Recall
dism /Online /Disable-Feature /FeatureName:Recall /NoRestart
del /s /f /q %LocalAppData%\CoreAIPlatform*
reg load HKU\TEMP "$env:LOCALAPPDATA\Packages\Microsoft.WindowsNotepad_8wekyb3d8bbwe\Settings\settings.dat"
regedit /s "%~dp0notepad.reg"
sleep 1
reg unload HKU\TEMP
del C:\Windows\InboxApps\*Copilot*
del "C:\Program Files (x86)\Microsoft\Edge\*copilot_provider_msix" /s
del "C:\Program Files (x86)\Microsoft\EdgeCore\*copilot_provider_msix" /s
del "C:\Program Files (x86)\Microsoft\EdgeWebView\*copilot_provider_msix" /s

REM #####################
REM Personalization below
REM #####################

echo #### Disabling Xbox related services and tasks...
sc stop XboxGipSvc
sc config XboxGipSvc start=disabled
sc stop XblAuthManager
sc config XblAuthManager start=disabled
sc stop XblGameSave
sc config XblGameSave start=disabled
sc stop XboxNetApiSvc
sc config XboxNetApiSvc start=disabled
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f

echo #### Disabling Windows Insider Service...
sc stop wisvc
sc config wisvc start=disabled

echo #### Setting Typing preferences...
reg add "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /v EnableSpellchecking /t REG_DWORD /d 0 /f
REM reg add "HKCU\SOFTWARE\Microsoft\TabletTip\1.7" /v EnableAutocorrection /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Input\Settings" /v EnableHwkbTextPrediction /t REG_DWORD /d 0 /f
REM reg add "HKCU\Software\Microsoft\Input\Settings" /v MultilingualEnabled /t REG_DWORD /d 0 /f

echo #### Setting Taskbar preferences...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" /v TaskbarEndTask /t REG_DWORD /d 1 /f

REM echo #### Setting Start menu pinned folders...
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderDocuments" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderDownloads" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderFileExplorer" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderMusic" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderNetwork" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderPersonalFolder" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderPictures" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderSettings" /v Value /t REG_DWORD /d 1 /f
REM reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\Default\Start\AllowPinnedFolderVideos" /v Value /t REG_DWORD /d 1 /f

echo #### Setting Explorer preferences...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRunAsDifferentUserInStart /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v FullPath /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideDrivesWithNoMedia /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v UseCompactMode /t REG_DWORD /d 1 /f

echo #### Disabling Spotlight lock screen...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f

echo #### Disabling language switch hotkey...
reg add "HKCU\Keyboard Layout\Toggle" /v "Language Hotkey" /t REG_SZ /d 3 /f
reg add "HKCU\Keyboard Layout\Toggle" /v Hotkey /t REG_SZ /d 3 /f
reg add "HKCU\Keyboard Layout\Toggle" /v "Layout Hotkey" /t REG_SZ /d 3 /f

echo #### Disabling animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f

echo ####
echo Done, rebooting now.
echo Press CTRL+C to skip reboot.
echo ####
echo You might still want to do the following:
echo 1. Change region and time zone
echo 2. Install AV1 Video Extension, Web Media Extensions, VP9 Video Extensions, etc
echo 3. Install updates
echo ####
pause
shutdown /r /t 0 /f
