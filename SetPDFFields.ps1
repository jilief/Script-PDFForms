param(
    [string]$PdfPath,
    [string]$OutputPath,
    [hashtable]$Fields,
    [bool]$Flatten
)

# Débloquer la DLL si nécessaire
$dllPath = Join-Path $PSScriptRoot "itextsharp.dll"
Unblock-File -Path $dllPath

$dllBytes = [System.IO.File]::ReadAllBytes($dllPath)
[System.Reflection.Assembly]::Load($dllBytes)

try {
    # Lecture du PDF
    $reader = New-Object iTextSharp.text.pdf.PdfReader($PdfPath)

    # Création du nouveau PDF
    $stamper = New-Object iTextSharp.text.pdf.PdfStamper($reader, [System.IO.File]::Create($OutputPath))

    # Modification des champs
    foreach ($key in $Fields.Keys) {
        $value = $Fields[$key]
        $stamper.AcroFields.SetField($key, $value)
        Write-Host "Champ '$key' modifié avec la valeur '$value'"
    }

    # Permet de rendre le PDF non modifiable
    $stamper.FormFlattening = $Flatten

    $stamper.Close()
    $reader.Close()

    Write-Host "Succès : Champs modifiés et fichier généré à '$OutputPath'"
}
catch {
    Write-Host "Erreur : $_"
}
