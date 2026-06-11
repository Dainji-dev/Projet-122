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
template="/home/romain/Modules-CFC/M122/Séquence 6/Templates"
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
if mkdir "$userFolder" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder" >> errors.txt
fi

if mkdir "$userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Documents créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Documents" >> errors.txt
fi

if mkdir "$userFolder/Projets" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Projets créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Projets" >> errors.txt
fi

if mkdir "$userFolder/Archives" 2>> errors.txt; then
    echo "[$todayDate] Dossier $userFolder/Archives créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du dossier $userFolder/Archives" >> errors.txt
fi


# Créer le fichier bienvenue.txt s'il n'existe pas
if touch "$userFolder/bienvenue.txt" 2>> errors.txt; then
    echo "[$todayDate] Fichier $userFolder/bienvenue.txt créé avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la création du fichier $userFolder/bienvenue.txt" >> errors.txt
fi


# écrire le texte dans bienvenue.txt 
if echo "Bonjour $firstName $lastName," >> "$userFolder/bienvenue.txt" 2>> errors.txt; then
    echo "[$todayDate] La ligne correctement écrite dans $userFolder/bienvenue.txt" >> log.txt
else
    echo "[$todayDate] La ligne n'as pas été écrite dans $userFolder/bienvenue.txt" >> errors.txt
fi

if echo "Bienvenue dans l'entreprise" >> "$userFolder/bienvenue.txt" 2>> errors.txt; then
    echo "[$todayDate] La ligne correctement écrite dans $userFolder/bienvenue.txt" >> log.txt
else
    echo "[$todayDate] La ligne n'as pas été écrite dans $userFolder/bienvenue.txt" >> errors.txt
fi

if echo "Ce dossier à été créé automatiquement le $todayDate" >> "$userFolder/bienvenue.txt" 2>> errors.txt; then
    echo "[$todayDate] La ligne correctement écrite dans $userFolder/bienvenue.txt" >> log.txt
else
    echo "[$todayDate] La ligne n'as pas été écrite dans $userFolder/bienvenue.txt" >> errors.txt
fi

# Copie de la charte et de la checklist

# ---------- Charte.pdf ----------
if cp "$charte" "$userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Fichier $charte copié avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la copie du fichier $charte" >> errors.txt
fi

# ---------- Checklist.xlsx ----------
if cp "$checklist" "$userFolder/Documents" 2>> errors.txt; then
    echo "[$todayDate] Fichier $checklist copié avec succès" >> log.txt
else
    echo "[$todayDate] Erreur lors de la copie du fichier $checklist" >> errors.txt
fi

# |-------------------- FIN DU SCRIPT --------------------|