param(
    [switch]$help
)

if($help){
    Write-Host "Checks if ./dump/imem_dut_dump.log is the same as ./dump/imem_gold_dump.log"
    exit 0
}

python3 ..\Scripts\parse_imem_dump.py

if((Get-FileHash "./dump/imem_dut_dump.log").Hash -eq (Get-FileHash "./dump/imem_gold_dump.log").Hash){
    Write-Host "Matching instr_mem dumps" -ForegroundColor Green
}else{
    Write-Host "Mismatched instr_mem dumps" -ForegroundColor Red
    exit -1
}