# =============================================================================
# Nom du script : creation_utilisateur.ps1
# Description   : Script permettant de créer un dossier utilisateur complet à l'endroit souhaité.
#                 Pour utiliser le script, il faut fournir les nom et prenom de l'utilisateur ainsi
#                 que l'emplacement ou creer le dossier de l'utilisateur et le chemin du dossier Template.
# Auteur        : Romain Perez
# Date          : 24.05.2026
# Utilisation   : .\creation_utilisateur.ps1 <Prenom> <Nom> <Destination> <Template>
# =============================================================================

# Variables
$firstName = $args[0]
$lastName = $args[1]
$destination = $args[2]
$template = "C:\Modules-CFC\M122\Sequence 6\Templates"
$charte = Join-Path $template "charte.pdf"
$checklist = Join-Path $template "checklist.xlsx"
$userFolder = Join-Path $destination "$($firstName)_$($lastName)"
$todayDate = Get-Date -Format "dd/MM/yyyy"

# ---------- Vérifications ----------

# Vérification des paramètres
if (-not $firstName -or -not $lastName -or -not $destination -or -not $template) {
    Write-Host "Utilisation : .\creation_utilisateur.ps1 <Prenom> <Nom> <Destination> <Template>"
    exit
}

# Vérifier si le dossier de destination existe
if (-not (Test-Path $destination -PathType Container)) {
    Write-Host "Le dossier $destination n'existe pas"
    exit
}

# Vérifier que le dossier Nom_Prenom n'existe pas
if (Test-Path $userFolder -PathType Container) {
    Write-Host "Le dossier $userFolder existe déjà"
    exit
}

# Vérifier si le dossier Templates existe
if (-not (Test-Path $template -PathType Container)) {
    Write-Host "Le dossier $template n'existe pas"
    exit
}

# Vérifier que $template contient bien charte.pdf
if (-not (Test-Path $charte -PathType Leaf)) {
    Write-Host "Le dossier $template ne contient pas le fichier charte.pdf"
    exit
}

# Vérifier que $template contient checklist.xlsx
if (-not (Test-Path $checklist -PathType Leaf)) {
    Write-Host "Le dossier $template ne contient pas le fichier checklist.xlsx"
    exit
}

# ---------- Actions du script ----------

# Créer les fichiers de logs
New-Item -Path "errors.txt" -ItemType File -Force | Out-Null
New-Item -Path "log.txt" -ItemType File -Force | Out-Null

# Créer l'arborescence dans Nom_Prenom
try {
    New-Item -Path $userFolder -ItemType Directory -ErrorAction Stop | Out-Null
    Add-Content -Path "log.txt" -Value "[$todayDate] Dossier $userFolder créé avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la création du dossier $userFolder"
}

try {
    New-Item -Path (Join-Path $userFolder "Documents") -ItemType Directory -ErrorAction Stop | Out-Null
    Add-Content -Path "log.txt" -Value "[$todayDate] Dossier $userFolder\Documents créé avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la création du dossier $userFolder\Documents"
}

try {
    New-Item -Path (Join-Path $userFolder "Projets") -ItemType Directory -ErrorAction Stop | Out-Null
    Add-Content -Path "log.txt" -Value "[$todayDate] Dossier $userFolder\Projets créé avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la création du dossier $userFolder\Projets"
}

try {
    New-Item -Path (Join-Path $userFolder "Archives") -ItemType Directory -ErrorAction Stop | Out-Null
    Add-Content -Path "log.txt" -Value "[$todayDate] Dossier $userFolder\Archives créé avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la création du dossier $userFolder\Archives"
}

# Créer le fichier bienvenue.txt s'il n'existe pas
$bienvenue = Join-Path $userFolder "bienvenue.txt"
try {
    New-Item -Path $bienvenue -ItemType File -ErrorAction Stop | Out-Null
    Add-Content -Path "log.txt" -Value "[$todayDate] Fichier $bienvenue créé avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la création du fichier $bienvenue"
}

# écrire le texte dans bienvenue.txt
try {
    Add-Content -Path $bienvenue -Value "Bonjour $firstName $lastName," -ErrorAction Stop
    Add-Content -Path "log.txt" -Value "[$todayDate] La ligne correctement écrite dans $bienvenue"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] La ligne n'as pas été écrite dans $bienvenue"
}

try {
    Add-Content -Path $bienvenue -Value "Bienvenue dans l'entreprise" -ErrorAction Stop
    Add-Content -Path "log.txt" -Value "[$todayDate] La ligne correctement écrite dans $bienvenue"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] La ligne n'as pas été écrite dans $bienvenue"
}

try {
    Add-Content -Path $bienvenue -Value "Ce dossier à été créé automatiquement le $todayDate" -ErrorAction Stop
    Add-Content -Path "log.txt" -Value "[$todayDate] La ligne correctement écrite dans $bienvenue"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] La ligne n'as pas été écrite dans $bienvenue"
}

# Copie de la charte et de la checklist

# ---------- Charte.pdf ----------
try {
    Copy-Item -Path $charte -Destination (Join-Path $userFolder "Documents") -ErrorAction Stop
    Add-Content -Path "log.txt" -Value "[$todayDate] Fichier $charte copié avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la copie du fichier $charte"
}

# ---------- Checklist.xlsx ----------
try {
    Copy-Item -Path $checklist -Destination (Join-Path $userFolder "Documents") -ErrorAction Stop
    Add-Content -Path "log.txt" -Value "[$todayDate] Fichier $checklist copié avec succès"
} catch {
    Add-Content -Path "errors.txt" -Value "[$todayDate] Erreur lors de la copie du fichier $checklist"
}

# |-------------------- FIN DU SCRIPT --------------------|
