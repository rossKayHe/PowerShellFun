Import-Module "C:\Users\rossj\OneDrive\Documents\Clicker.psm1"
Import-Module "C:\Users\rossj\OneDrive\Documents\GetCursorPositionColor.psm1"

function toBank{
    param ($load)
    # To Bank
    $X = 742
    $Y = 967
    
    Write-Host "R:" (Get-ScreenColor -X $X -Y $Y).Red
    Write-Host "G:" (Get-ScreenColor -X $X -Y $Y).Green 
    Write-Host "B:" (Get-ScreenColor -X $X -Y $Y).Blue

    [Windows.Forms.Cursor]::Position = "$X,$Y" 

    Do {Start-Sleep -seconds 2} Until ((Get-ScreenColor -X $X -Y $Y).Green -eq 81 -and (Get-ScreenColor -X $X -Y $Y).Red -eq 102 -and (Get-ScreenColor -X $X -Y $Y).Blue -eq 18)
    #Start-Process -FilePath py -ArgumentList "walkhere.py"

    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 10
    #>
    # Door
    $X = 1063 
    $Y = 728
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 8


    $X = 471
    $Y = 991
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 8
    # Ladder
    $X = 82
    $Y = 745
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 12
    $Duration = (Get-Date) - $LoadDate
    Write-Host $Duration.totalminutes " minutes"
    # Bank
    [Windows.Forms.Cursor]::Position = "614,175"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint(614,175)
    Start-Sleep -Seconds 26
    # Dump to Bank
    Write-Host $(Get-Date -Format "dddd MM/dd/yyyy HH:mm:ss K")
    [Windows.Forms.Cursor]::Position = "893,831"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint(893,831)
    Start-Sleep -Seconds 1
    fromBank $load
}

function fromBank {
    param ($load = 0)

    $LoadDate= Get-Date
    # Run back
    [Clicker]::LeftClickAtPoint(1483,149)
    
    # fixed stop
    $X = 1340 
    $Y = 780
    (Get-ScreenColor -X $X -Y $Y).Green
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    Do {Start-Sleep -seconds 2} Until ((Get-ScreenColor -X $X -Y $Y).Green -eq 73)
    [Clicker]::LeftClickAtPoint($X,$Y)
    #&py addydown.py
    Start-Sleep -Seconds 8
    
    # Ladder
    $X = 525 
    $Y = 865
    (Get-ScreenColor -X $X -Y $Y).Green
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    Do {Start-Sleep -seconds 2} Until ((Get-ScreenColor -X $X -Y $Y).Green -eq 66)
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 10
    $X = 1294 
    $Y = 384
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 8
    # door
    $X = 1029 
    $Y = 244
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint($X,$Y)
    Start-Sleep -Seconds 6
    

    # mining spot
    $X = 644 
    $Y = 232
    Write-Host "R:" (Get-ScreenColor -X $X -Y $Y).Red
    Write-Host "G:" (Get-ScreenColor -X $X -Y $Y).Green
    Write-Host "B:" (Get-ScreenColor -X $X -Y $Y).Blue
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    #Start-Process -FilePath py -ArgumentList "walkhere.py"

    do {
    Start-Sleep -Seconds 2} until ((Get-ScreenColor -X $X -Y $Y).Green -eq 83 -and (Get-ScreenColor -X $X -Y $Y).Red -eq 106 -and (Get-ScreenColor -X $X -Y $Y).Blue -eq 18)
    [Clicker]::LeftClickAtPoint($X,$Y)
    
    Start-Sleep -Seconds 5
    $X = 960 
    $Y = 500
    [Windows.Forms.Cursor]::Position = "$X,$Y"
    Start-Sleep -Seconds 1
    [Clicker]::LeftClickAtPoint($X,$Y)
    
    Start-Sleep -Seconds 4
    
    # Turn off run
    [Clicker]::LeftClickAtPoint(1483,149)
    &py addyspot.py
    mine
}

function WorldSwitch {
    & py C:\Users\rossj\OneDrive\Documents\WorldSwitch.py
    Do {Start-Sleep -Seconds .5} Until (
        $(Get-Process | Where-Object -FilterScript {$_.CommandLine -eq 'C:\Users\rossj\OneDrive\Documents\WorldSwitch.py'}) -eq $null) 
    #write-host "switched"
    [System.Windows.Forms.SendKeys]::SendWait("{ESC}")
    Start-Sleep -Seconds 1
}

function mine {

    Write-Host "Load: " $load
    # NAddy
    $X = 815 
    $Y = 500
    Write-Host "N Addy: " (Get-ScreenColor -X $X -Y $Y).Green 
    If ((Get-ScreenColor -X $X -Y $Y).Green -eq 97){
        [Windows.Forms.Cursor]::Position = "$X,$Y"
        Start-Sleep 1
        [Clicker]::LeftClickAtPoint($X,$Y)
        [Windows.Forms.Cursor]::Position = "$($X + $(Get-Random -Maximum 50 -Minimum 20)),$Y"
        do {Start-Sleep -seconds 1} until ((Get-ScreenColor -X $X -Y $Y).Green -ne 97)
    }
    If ((Get-ScreenColor -X $X -Y $Y).Green -eq 82){
        [Windows.Forms.Cursor]::Position = "$X,$Y"
        Start-Sleep 1
        [Clicker]::LeftClickAtPoint($X,$Y)
        [Windows.Forms.Cursor]::Position = "$($X + $(Get-Random -Maximum 50 -Minimum 20)),$Y"
        do {Start-Sleep -seconds 1} until ((Get-ScreenColor -X $X -Y $Y).Green -ne 82 -or (Get-ScreenColor -X 1598 -Y 978).Red -ne 62)
    }

    if ((Get-ScreenColor -X 1348 -Y 604).Red -eq 0) {return}
    &py mlevel.py
    if ((Get-ScreenColor -X 1598 -Y 978).Red -ne 62) {
        $load = $load + 1
        Write-Host "Load: " $load (get-date)
        toBank $load
    }

    # SAddy
    $X = 823
    $Y = 560
    Write-Host "S Addy: " (Get-ScreenColor -X $X -Y $Y).Green 
    If ((Get-ScreenColor -X $X -Y $Y).Green -eq 93){
        [Windows.Forms.Cursor]::Position = "$X,$Y"
        Start-Sleep 1
        [Clicker]::LeftClickAtPoint($X,$Y); 
        [Windows.Forms.Cursor]::Position = "$($X+50),$Y"
        do {Start-Sleep -seconds 1} until ((Get-ScreenColor -X $X -Y $Y).Green -ne 93)
    }
    &py dropSEm.py

    if ((Get-ScreenColor -X 1348 -Y 604).Red -eq 0) {return}

    if ((Get-ScreenColor -X 1598 -Y 978).Red -ne 62) {
        $load = $load + 1
        Write-Host "Load: " $load $(get-date)
        toBank $load
    }

    WorldSwitch
    if ($(Get-Date) -ge $stop) {return}
    mine
}

$stop = (get-date).AddHours(6)
[long] $load = 0 
$LoadDate= Get-Date
cd  "C:\Users\rossj\OneDrive\Documents"

mine