param(
    [Parameter(Mandatory=$true)]
    [string]$archivo
)

$basePath = "c:\Users\Aaron\Documents\GitHub\Ensamblador_Practica"
$nombre = [System.IO.Path]::GetFileNameWithoutExtension($archivo)
$asmFile = "$nombre.asm"

Write-Host "Compilando $asmFile..." -ForegroundColor Cyan
wsl bash -c "cd /mnt/c/Users/Aaron/Documents/GitHub/Ensamblador_Practica && nasm -f elf32 $asmFile -o $nombre.o && ld -m elf_i386 $nombre.o -o $nombre && ./$nombre"
Write-Host "Completado" -ForegroundColor Green
