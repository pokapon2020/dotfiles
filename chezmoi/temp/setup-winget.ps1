# wingetインストール
$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
# Invoke-WebRequest -Uri "https://aka.ms/getwinget" -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
# Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
https://www.winhelponline.com/apps/Microsoft.VCLibs.140.00.UWPDesktop_14.0.33728.0_x64__8wekyb3d8bbwe.Appx
# Invoke-WebRequest -Uri "https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx" -OutFile Microsoft.UI.Xaml.2.8.x64.appx
# Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.VCLibs.140.00.UWPDesktop_14.0.33728.0_x64__8wekyb3d8bbwe.appx
# Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle


https://blog.engineer-memo.com/2024/09/05/windows-server-2022-%e3%82%92%e3%82%b3%e3%83%b3%e3%82%bd%e3%83%bc%e3%83%ab%e7%ab%af%e6%9c%ab%e3%81%a8%e3%81%97%e3%81%a6%e4%bd%bf%e7%94%a8%e3%81%99%e3%82%8b%e9%9a%9b%e3%81%ab%e5%b0%8e%e5%85%a5%e3%81%97/

https://zenn.dev/nobokko/articles/idea_winget_wsb

https://qiita.com/tkhr68000/items/f1e247e6a65a196b25d7