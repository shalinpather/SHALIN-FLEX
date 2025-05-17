# Set-Theme.ps1
# Sets the default colour scheme in the Windows Terminal settings to the
# preferred scheme that matches the system colour theme (light or dark).

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [String]
    [ValidateScript({
        ($_.ToLower() -eq 'light') -or ($_.ToLower() -eq 'dark')
        },
        ErrorMessage = "Please enter `"light`" or `"dark`"."
    )]
    $Theme
)

$ErrorActionPreference = 'Stop'

$SettingsPath = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$Settings = Get-Content -Path $SettingsPath | ConvertFrom-Json
$ColourScheme = $Theme.ToLower() -eq 'light' ? 'One Half Light Fixed' : 'One Half Dark'

$Settings.profiles.defaults.colorScheme = $ColourScheme
$Settings | ConvertTo-Json -Depth 5 | Set-Content -Path $SettingsPath