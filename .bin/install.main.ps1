Write-Host "Hello."

#lsd
#bat
#fzf

Install-Module -Name PSFzf -Scope CurrentUser
Install-Module -Name ZLocation -Scope CurrentUser

Copy-Item `
-Path ((Resolve-Path "..\.config\powershell").Path + "\Microsoft.PowerShell_profile.ps1") `
-Destination $PROFILE `
-Force

New-Item `
-Value ((Resolve-Path "..\.config").Path) `
-Path $Env:USERPROFILE `
-Name ".config" `
-ItemType SymbolicLink
