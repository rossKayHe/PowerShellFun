﻿
Add-Type -AssemblyName System.Windows.Forms

    $X = [System.Windows.Forms.Cursor]::Position.X
    $Y = [System.Windows.Forms.Cursor]::Position.Y

    Write-Host  $X $Y

