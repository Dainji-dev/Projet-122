#!/bin/bash
# =============================================================================
# Nom du script : creation_utilisateur.sh
# Description   : Script permettant de créer un dossier utilisateur complet à l'endroit souhaité.
#                 Pour utiliser le script, il faut fournir les nom et prenom de l'utilisateur ainsi
#                 que l'emplacement ou creer le dossier de l'utilisateur et le chemin du dossier Template.
# Auteur        : Romain Perez
# Date          : 24.05.2026
# Utilisation   : ./creation_utilisateur.sh [Nom] [Prenom] [Destination] [Template]
# =============================================================================


# Variables
firstName="$1"
lastName="$2"
destination="$3"
template="$4"
charte="$template/charte.pdf"
checklist="$template/checklist.xlsx"
userFolder="$destination/${firstName}_${lastName}"
todayDate=$(date '+%d/%m/%Y')

# ---------- Vérifications ----------

# Vérification des paramètres
if [ -z "$firstName" ] || [ -z "$lastName" ] || [ -z "$destination" ] || [ -z "$template" ]; then
    echo "Utilisation : ./creation_utilisateur.sh <prénom> <nom> <destination> <template>"
    
    exit
fi

# Vérifier si le dossier de destination existe
if [ ! -d "$destination" ]; then
    echo "Le dossier $destination n'existe pas"
    
    exit
fi

# Vérifier que le dossier Nom_Prenom n'existe pas
if [ -d "$userFolder" ]; then
    echo "Le dossier $userFolder existe déjà"
    
    exit
fi

# Vérifier si le dossier Templates existe
if [ ! -d "$template" ]; then
    echo "Le dossier $template n'existe pas"
    
    exit
fi

#Vérifier que $template contient bien charte.pdf
if [ ! -f "$charte" ]; then
    echo "Le dossier $template ne contient pas le fichier charte.pdf"
    
    exit
fi

#Vérifier que $template contient checklist.xlsx
if [ ! -f "$checklist" ]; then
    echo "Le dossier $template ne contient pas le fichier checklist.xlsx"
    
    exit
fi

# ---------- Actions du script ----------

# Créer les fichiers de logs
touch errors.txt
touch log.txt


# Créer l'arborescence dans Nom_Prenom
if echo "Création du dossier $userFolder" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder" >> errors.txt
fi

if echo "Création du dossier $userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Documents créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Documents" >> errors.txt
fi

if echo "Création du dossier $userFolder/Projets" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Projets créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Projets" >> errors.txt
fi

if echo "Création du dossier $userFolder/Archives" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Archives créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Archives" >> errors.txt
fi


# Créer le fichier bienvenue.txt s'il n'existe pas
if echo "Création du fichier $userFolder/bienvenue.txt" 2>> errors.txt; then
    echo "[$todayDate] Fichier $userFolder/bienvenue.txt créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du fichier $userFolder/bienvenue.txt" >> errors.txt
fi


# écrire le texte dans bienvenue.txt 
echo "écriture du texte de bienvenue dans le dossier $userFolder/bienvenue.txt"

# Copie de la charte et de la checklist

# ---------- Charte.pdf ----------
if echo "Copie de $charte vers $userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Fichier $charte copié avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la copie du fichier $charte" >> errors.txt
fi

# ---------- Checklist.xlsx ----------
if echo "Copie de $checklist vers $userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Fichier $checklist copié avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la copie du fichier $checklist" >> errors.txt
fi

# |-------------------- FIN DU SCRIPT --------------------|