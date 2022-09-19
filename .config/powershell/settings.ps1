# Starship
Invoke-Expression (&starship init powershell)

# PSFzfの読み込みとAlias有効化
Import-Module PSFzf
Enable-PsFzfAliases
# ZLocationの読み込み
Import-Module ZLocation

Set-Alias l ls
function ll { ls -lF }
function la { ls -AlF }
function lla { ls -la }

Set-Alias vi nvim
#Remove-Item alias:curl
Set-Alias curl curl.exe

Remove-Item alias:ls
Set-Alias ls lsd.exe

Set-PSReadlineOption -AddToHistoryHandler {
    param ($command)
    switch -regex ($command) {
        "SKIPHISTORY" {return $false}
        "^[a-z]$" {return $false}
        "exit" {return $false}
    }
    return $true
}

Set-PSReadLineOption -WordDelimiters ";:,.[]{}()/\|^&*-=+'`" !?@#$%&_<>「」（）『』『』［］、，。：；／"
