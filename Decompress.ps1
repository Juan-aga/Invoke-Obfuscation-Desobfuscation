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

if ($Pos -gt 0)
{
        $Decompressed = $Compressed.Remove($Pos, $Compressed.length - $Pos)
}
else
{
        $Decompressed = $Compressed.Remove( 0, $Compressed.IndexOf('('))
}

Invoke-Expression $Decompressed
