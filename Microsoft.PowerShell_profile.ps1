oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\emodipt-extend.omp.json" | Invoke-Expression
Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionViewStyle ListView
