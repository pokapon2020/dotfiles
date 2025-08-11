Write-Output ("Hello {0}." -f $Env:USERNAME)

$SetupFilesDir="~\Downloads\SetupFiles"

if ( -not (Test-Path -Path $SetupFilesDir)) {
  New-Item -Path $SetupFilesDir -ItemType Directory
}
if ( -not (Test-Path -Path $PROFILE)) {
  New-Item -Path $PROFILE -ItemType File -Force
}

# sakura editor
$URLSakura="https://github.com/sakura-editor/sakura/releases/download/v2.4.2/sakura-tag-v2.4.2-build4203-a3e63915b-Win32-Release-Installer.zip"
$DestSakura=Join-Path -Path $SetupFilesDir -ChildPath sakura.zip
# PlemolJP
$URLFonts="https://github.com/yuru7/PlemolJP/releases/download/v2.0.3/PlemolJP_NF_v2.0.3.zip"
$DestFonts=Join-Path -Path $SetupFilesDir -ChildPath plemol.zip

$bitsJobObj = Start-BitsTransfer -Source $URLSakura -Destination $DestSakura -TransferType Download -Suspend
$result = Add-BitsFile -BitsJob $bitsJobObj -Source $URLFonts -Destination $DestFonts
$result = Resume-BitsTransfer -BitsJob $bitsJobObj

switch ($bitsJobObj.JobState) {
  'Transferred' {
    Complete-BitsTransfer -BitsJob $bitsJobObj
    break
  }
  'Error' {
    throw 'Error downloading'
  }
}

Expand-Archive -Path $DestFonts -DestinationPath $SetupFilesDir -Force

$installList = Get-ChildItem -Path(
'HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
'HKLM:SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
) | ForEach-Object { Get-ItemProperty -Path $_.PsPath } | Where-Object { $_.DisplayName -like "SAKURA Editor*" }
#) | ForEach-Object { Get-ItemProperty -Path $_.PsPath | Select-Object DisplayName, DisplayVersion, Publisher }

if ($installList -eq $null) {
  Write-Host "sakura is not installed."
  Expand-Archive -Path $DestSakura -DestinationPath $SetupFilesDir -Force
  Get-ChildItem -Path $SetupFilesDir -Filter 'sakura_install*.exe' | ForEach-Object { Start-Process $_.FullName -Wait }
} else {
  Write-Host "sakura is already installed."
}

winget install `
 Microsoft.PowerToys `
 Microsoft.WindowsTerminal `
 Microsoft.VisualStudioCode `
 Microsoft.VisualStudio.2022.Community `
 7Zip.7Zip `
 Git.Git `
 WinMerge.WinMerge `
 Google.Chrome `
 Neovim.Neovim `
 Starship.Starship `
 lsd-rs.lsd `
 twpayne.chezmoi `
 Volta.Volta `
 Docker.DockerDesktop `
 --source winget
