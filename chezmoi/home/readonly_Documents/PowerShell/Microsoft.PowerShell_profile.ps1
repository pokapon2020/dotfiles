# Start mitmweb
# C:\WINDOWS\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Program Files/mitmproxy\bin\run.ps1" mitmweb

function Get-CheetSheet {
  # 日付表示
  # https://learn.microsoft.com/ja-jp/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.4
  # Get-Date -Year 2024 -Month 7 -Day 30 -Format 'yyyy-MM-dd(dddd)'
  # Get-Date -UnixTimeSeconds 1577836800
  #
  # XML->CSV
  # S1_0001.xml (計画一覧) のcsv 化（SAG_PLN_INFO の第一階層のみ）
  # Select-XML -Path ".\S1_0001.xml" -XPath "SBD-MSG/SAG_PLN_INFO"|Select-Object -ExpandProperty Node | Select-Object -Property SEQ,PLN_TYPE,SNS_TYPE,RECPT_NUM,AREA,AREA_MNG_NO,SNSSY_CD,ENT_MNG_NO|Export-Csv -Delimiter ',' -Path .\S1_0001.xml.csv -NoTypeInfo
  # VM 取得
  # Get-VM -Name 'Windows11.JERA02','Windows11.TEPSYS02'
  # Zip 解凍
  # Expand-Archive -Path ""
  # Hello.
}

function Start-NewTerminal {
  param (
    [Parameter(ValueFromPipeline=$true)]
    [string]$command 
  )
  process {
    [string]$process = "alacritty"  
    [string[]]$processArgs = @()

    $processArgs += "--command"
    $processArgs += $command

    $processOptions = @{
      FilePath = $process
      ArgumentList = $processArgs
    }    
    Start-Process @processOptions
  }
}

# 文字化け対策
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
# Git Bash のツールをパスに追加
$Env:PATH += ";C:\Users\toriyabe\AppData\Local\Programs\Git\usr\bin;"
$Env:PATH += ";C:\Users\toriyabe\AppData\Local\Microsoft\WinGet\Packages\Docker.DockerCLI_Microsoft.Winget.Source_8wekyb3d8bbwe\docker;"

# fzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
$Env:FZF_DEFAULT_OPTS="--height 50% --layout=reverse"

# Starship config
Invoke-Expression (&starship init powershell)
# zoxide config
Invoke-Expression (& { (zoxide init powershell | Out-String) })

