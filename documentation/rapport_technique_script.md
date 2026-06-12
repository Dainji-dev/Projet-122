# Table des matières

- [[#1. Introduction|Introduction]]
- [[#2. S'informer|S'informer]]
- [[#3. Planifier|Planifier]]
- [[#4. Décider|Décider]]
- [[#5. Réaliser|Réaliser]]
- [[#6. Contrôler|Contrôler]]
- [[#7. Évaluer|Évaluer]]
- [[#8. Conclusion|Conclusion]]

---
# 1. Introduction

Dans le cadre de cette activité, un script Bash a été développé afin d'automatiser la préparation de l'environnement de travail d'un nouvel utilisateur au sein d'une entreprise.

L'objectif est de réduire les tâches répétitives liées à la création de dossiers, à la génération de fichiers d'accueil et à la copie de documents nécessaires à l'intégration d'un collaborateur.

Ce document présente la réalisation du projet selon la méthode des 6 étapes :

- S'informer
    
- Planifier
    
- Décider
    
- Réaliser
    
- Contrôler
    
- Évaluer

---
# 2. S'informer

## 2.1 Cahier des charges

Le script Bash doit préparer automatiquement l'environnement de travail d'un nouvel utilisateur.

Le script doit :

- Créer un dossier personnel nommé `Nom_Prenom`.
    
- Créer les sous-dossiers :
    
    - Documents
        
    - Projets
        
    - Archives
        
- Générer un fichier `bienvenue.txt` contenant :
    

```txt
Bonjour Prénom Nom,
Bienvenue dans l'entreprise.
Ce dossier a été créé automatiquement le JJ.MM.AAAA.
```

- Copier les fichiers modèles :
    
    - charte.pdf
        
    - checklist.xlsx
        

depuis un dossier de modèles vers le dossier Documents de l'utilisateur.

- Vérifier que le dossier utilisateur n'existe pas déjà afin d'éviter tout écrasement de données.
    
- Générer un fichier de journalisation (log).
    
- Enregistrer les erreurs éventuelles dans ce fichier.
    
- Accepter les paramètres suivants :
    
    - Nom
        
    - Prénom
        
    - Chemin du dossier de destination
        
    - Chemin vers les fichiers modèles
        

## 2.2 Analyse du besoin

L'automatisation de cette tâche permet :

- d'assurer une structure identique pour chaque nouvel utilisateur ;
    
- de réduire les erreurs humaines ;
    
- d'accélérer la préparation des postes de travail ;
    
- de conserver une trace des opérations effectuées grâce aux fichiers de log.
    

---
# 3 Planifier

## 3.1 Description de l'algorithme en français

Le script suit les étapes suivantes :

1. Vérifier que les paramètres nécessaires ont été fournis.
    
2. Construire le nom du dossier utilisateur à partir du nom et du prénom.
    
3. Vérifier que le dossier de destination existe.
    
4. Vérifier que le dossier utilisateur n'existe pas déjà.
    
5. Vérifier que le dossier Templates existe.
    
6. Vérifier que les fichiers `charte.pdf` et `checklist.xlsx` sont présents dans le dossier Templates.
    
7. Créer les fichiers de journalisation `log.txt` et `errors.txt`.
    
8. Créer le dossier principal de l'utilisateur.
    
9. Créer les sous-dossiers `Documents`, `Projets` et `Archives`.
    
10. Générer le fichier `bienvenue.txt`.
    
11. Écrire le message d'accueil personnalisé dans le fichier `bienvenue.txt`.
    
12. Copier les fichiers modèles dans le dossier `Documents`.
    
13. Enregistrer les opérations réussies dans le fichier `log.txt`.
    
14. Enregistrer les éventuelles erreurs dans le fichier `errors.txt`.    

## 3.2 Éléments à produire

Pour réaliser cette activité, les éléments suivants doivent être créés :

- Diagramme de flux
    
- Script Bash
    
- Fichier de test
    
- Fichier log
    
- Rapport de projet
    
- Manuel utilisateur
    

---
# 4. Décider

## 4.1 Choix techniques

Les paramètres sont utilisés afin de rendre le script réutilisable pour plusieurs utilisateurs sans modification du code.

L'utilisation d'un fichier log permet de conserver une trace des opérations réalisées ainsi que des erreurs rencontrées.

## 4.2 Structure du fichier utilisateur

```text
Nom_Prenom/
├── Documents/
│   ├── charte.pdf
│   └── checklist.xlsx
├── Projets/
├── Archives/
└── bienvenue.txt
```

Cette organisation permet de séparer clairement les différents types de documents.

---
# 5. Réaliser

## 5.1 Diagramme de flux

[diagramme de flux](./diagramme/diagramme.drawio)

## 5.2 Script Bash

```bash
#!/bin/bash

# =============================================================================

# Nom du script : creation_utilisateur.sh

# Description : Script permettant de créer un dossier utilisateur complet à l'endroit souhaité.

# Pour utiliser le script, il faut fournir les nom et prenom de l'utilisateur ainsi

# que l'emplacement ou creer le dossier de l'utilisateur et le chemin du dossier Template.

# Auteur : Romain Perez

# Date : 24.05.2026

# Utilisation : ./creation_utilisateur.sh [Nom] [Prenom] [Destination] [Template]

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

echo "Utilisation : ./creation_utilisateur.sh <nom> <prenom> <destination> <template>"

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

if echo "Bonjour $lastName $firstName," >> "$userFolder/bienvenue.txt" 2>> errors.txt; then

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
```

## 5.3 Journalisation

Toutes les opérations importantes sont enregistrées dans un fichier log grâce à l'opérateur :

```bash
>>
```

Les erreurs sont enregistrées grâce à :

```bash
2>>
```

Cela permet de faciliter le diagnostic en cas de problème.

---
# 6. Contrôler

## 6.1 Cas de test réalisés

### Test 1 : Création d'un nouvel utilisateur

Résultat attendu :

- Création du dossier principal
    
- Création des sous-dossiers
    
- Génération du fichier bienvenue.txt
    
- Copie des fichiers modèles
    

Résultat obtenu :



### Test 2 : Dossier utilisateur déjà existant

Résultat attendu :

- Message d'erreur
    
- Arrêt du script
    

Résultat obtenu :

- Conforme
    

### Test 3 : Dossier templates inexistant

Résultat attendu :

- Erreur enregistrée dans le log
    

Résultat obtenu :

- Conforme
    

### Test 4 : Paramètres manquants

Résultat attendu :

- Affichage de l'aide d'utilisation
    

Résultat obtenu :

- Conforme
    

## 6.2 Exemple de fichier log

```text
Création du dossier Dupont_Jean
Création du dossier Documents
Création du dossier Projets
Création du dossier Archives
Copie de charte.pdf
Copie de checklist.xlsx

cp: impossible d'évaluer 'templates/charte.pdf': Aucun fichier ou dossier de ce type
```

---
# 7. Évaluer

Cette activité m'a permis de mettre en pratique les notions de scripting Bash et d'automatisation de tâches administratives.

Les points qui ont été faciles :

- La création de dossiers.
    
- La gestion des paramètres.
    
- La génération automatique de fichiers texte.
    

Les principales difficultés rencontrées :

- La gestion des erreurs.
    
- La mise en place de la journalisation.
    
- Les tests de validation dans différents scénarios.
    

Des améliorations pourraient être apportées :

- Vérification plus avancée des paramètres.
    
- Gestion de plusieurs utilisateurs dans un même fichier.
    
- Interface interactive pour saisir les informations.
    
- Génération automatique d'un rapport récapitulatif.

---
# 8. Conclusion

Le script développé répond aux exigences du cahier des charges et permet d'automatiser la préparation de l'environnement de travail d'un nouvel utilisateur.

L'utilisation d'un script Bash permet de gagner du temps, de limiter les erreurs humaines et d'assurer une structure homogène pour tous les collaborateurs. La mise en place de la journalisation facilite également le suivi des opérations et le diagnostic en cas de problème.

Ce projet a permis de renforcer les compétences en automatisation, en gestion des fichiers et en développement de scripts Bash.
