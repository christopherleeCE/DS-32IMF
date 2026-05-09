param(
    [switch]$build,
    [switch]$deploy
)

$OldPath = Get-Location
Set-Location "C:\Users\Chris\Documents\Quartus\Quartus Projects\new_capstone"

if($build){
    & 'C:\Users\Chris\Documents\Quartus\DS-32IMF\Scripts\build_quartus.ps1' new_capstone 
}if($deploy){
    & 'C:\Users\Chris\Documents\Quartus\DS-32IMF\Scripts\deploy_fpga.ps1' new_capstone -y
}

Set-Location $OldPath
