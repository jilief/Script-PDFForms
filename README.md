# Script PowerShell pour Modifier les Champs d'un PDF

Ce script PowerShell permet de modifier les champs d'un formulaire PDF en utilisant la bibliothèque `iTextSharp`. Il peut également aplatir le PDF pour rendre les champs non modifiables.

## Fonctionnalités

- Modifier les champs d'un formulaire PDF avec des valeurs spécifiques.
- Générer un nouveau fichier PDF contenant les modifications.
- Option pour aplatir le formulaire, empêchant les modifications futures.

## Pré-requis

Avant d'utiliser ce script, assurez-vous d'avoir les éléments suivants :
1. **PowerShell** (version 5.1 ou supérieure).
2. **DLL iTextSharp** : Téléchargez `itextsharp.dll` (compatible avec votre version .NET).
3. Un fichier PDF d'entrée avec des champs de formulaire modifiables.

## Installation

1. Téléchargez ou clonez ce repository sur votre machine.
2. Débloquez la DLL si nécessaire avec la commande suivante :
   ```powershell
   Unblock-File -Path .\itextsharp.dll
3. Choisissez le PDF avec champs nommés à modifier
    
## Utilisation 

Exemple de commande : 
  ```powershell
.\SetPDFFields.ps1 -PdfPath "C:\Documents\Formulaire.pdf" -OutputPath "C:\Documents\Formulaire_output.pdf" -Fields @{ "Nom" = "John Doe"; "Date" = "01/01/2025" } -Flatten $True


