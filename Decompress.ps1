Param($File)

if (!$File)
{
        Write-Host "Tiene que indicar el archivo a cargar."
        return
}

$Compressed = Get-Content -Path $File

if (!$Compressed)
{
        Write-Host "Problema al abrir el archivo " $File
        return
}

$Pos =  $Compressed.LastIndexOf('|')

$Decompressed = $Compressed.Remove($Pos, $Compressed.length - $Pos)

Invoke-Expression $Decompressed
