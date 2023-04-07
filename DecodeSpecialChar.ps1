Param($File)

if (!$File)
{
        Write-Host "Tiene que indicar el archivo a cargar."
        return
}

$Encoded = Get-Content -Path $File

if (!$Encoded)
{
        Write-Host "Problema al abrir el archivo " $File
        return
}

$Length = $Encoded.length

for ($i = 0; $i -lt $Length -and $Encoded[$i] -ne '}'; $i++){}
for (; $Encoded[$i] -ne '$'; $i--)
{
        $Iex += $Encoded[$i]
}
$Iex += '$'
$Iex = $Iex.ToCharArray()
[array]::Reverse($Iex)
$Iex = -join($Iex)
$Encoded = $Encoded.Remove($Encoded.LastIndexOf($Iex), $Iex.Length)
$Encoded = $Encoded.Remove($Encoded.LastIndexOf($Iex), $Iex.Length)
$Length = $Encoded.length
$Second = $Length - 1
for (; $Encoded[$Second] -ne '"'; $Second--){}
$First = $Second - 1
for (; $Encoded[$First] -ne '"'; $First--){}
$Zero = $First - 1
for (; $Encoded[$Zero] -ne ';'; $Zero--){}
$ToExec = ""
for ($j = 0; $j -lt $Zero + 1; $j++)
{
        $ToExec += $Encoded[$j]
}
for (; $First -lt $Second + 1; $First++)
{
        $ToExec += $Encoded[$First]
}
if ($ToExec.LastIndexOf('|') -gt 0)
{
        $ToExec = $ToExec.Remove($ToExec.LastIndexOf('|'), 1)
}

$ToExec += "|&" + $Iex

Invoke-Expression $ToExec
