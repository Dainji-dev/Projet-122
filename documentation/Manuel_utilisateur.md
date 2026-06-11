

**Module :** M122  
**Auteur :** Romain Perez  
**Date :** 24.05.2026  
**Version :** 1.0

---

## Table des matières

1. [Introduction](#1-introduction)
2. [Prérequis](#2-pr%C3%A9requis)
3. [Installation](#3-installation)
4. [Utilisation](#4-utilisation)
5. [Paramètres](#5-param%C3%A8tres)
6. [Exemples d'utilisation](#6-exemples-dutilisation)
7. [Résultats attendus](#7-r%C3%A9sultats-attendus)
8. [Journalisation](#8-journalisation)
9. [Messages d'erreur](#9-messages-derreur)
10. [Résolution des problèmes](#10-r%C3%A9solution-des-probl%C3%A8mes)

---

## 1. Introduction

`creation_utilisateur.sh` est un script Bash qui automatise la création de l'environnement de travail d'un nouvel employé au sein d'une entreprise.

En une seule commande, le script :

- crée l'arborescence de dossiers personnels de l'utilisateur ;
- génère un fichier de bienvenue personnalisé ;
- copie les fichiers modèles nécessaires à l'intégration ;
- journalise toutes les opérations effectuées.

Ce script est destiné aux administrateurs système chargés de préparer les postes de travail des nouveaux collaborateurs.

---

## 2. Prérequis

Avant d'utiliser ce script, vérifier les points suivants :

|Prérequis|Détail|
|---|---|
|Système d'exploitation|Linux (toute distribution avec Bash)|
|Version Bash|4.0 ou supérieure|
|Droits|Droits d'écriture sur le dossier de destination|
|Fichiers modèles|`charte.pdf` et `checklist.xlsx` présents dans le dossier Templates|

### Vérifier la version de Bash

```bash
bash --version
```

### Vérifier les droits sur le dossier de destination

```bash
ls -la /chemin/vers/destination
```

---

## 3. Installation

### Télécharger le script

Cloner le dépôt GitHub ou télécharger directement le fichier :

```bash
git clone https://github.com/Dainji-dev/Projet-122.git
cd Projet-122/scripts
```

### Rendre le script exécutable

Avant la première utilisation, il faut donner les droits d'exécution au script :

```bash
chmod +x creation_utilisateur.sh
```

### Préparer le dossier Templates

Le dossier Templates doit obligatoirement contenir les deux fichiers suivants :

```
Templates/
├── charte.pdf
└── checklist.xlsx
```

---

## 4. Utilisation

### Syntaxe

```bash
./creation_utilisateur.sh [Prénom] [Nom] [Destination] [Templates]
```

> ⚠️ L'ordre des paramètres est important. Respecter impérativement la syntaxe ci-dessus.

---

## 5. Paramètres

|Position|Paramètre|Description|Exemple|
|---|---|---|---|
|`$1`|Prénom|Prénom du nouvel utilisateur|`Jean`|
|`$2`|Nom|Nom du nouvel utilisateur|`Dupont`|
|`$3`|Destination|Chemin absolu du dossier où créer l'environnement|`/home/employes`|
|`$4`|Templates|Chemin absolu du dossier contenant les fichiers modèles|`/home/admin/Templates`|

> ℹ️ Si un paramètre contient des espaces, l'entourer de guillemets : `"Jean Pierre"`

---

## 6. Exemples d'utilisation

### Exemple standard

```bash
./creation_utilisateur.sh Jean Dupont /home/employes /home/admin/Templates
```

Crée le dossier `/home/employes/Jean_Dupont` avec toute l'arborescence.

### Exemple avec un prénom composé

```bash
./creation_utilisateur.sh "Jean-Pierre" Dupont /home/employes /home/admin/Templates
```

### Exemple avec des chemins différents

```bash
./creation_utilisateur.sh Marie Martin /srv/users /opt/modeles/Templates
```

---

## 7. Résultats attendus

Après une exécution réussie, l'arborescence suivante est créée dans le dossier de destination :

```
Jean_Dupont/
├── Documents/
│   ├── charte.pdf
│   └── checklist.xlsx
├── Projets/
├── Archives/
└── bienvenue.txt
```

### Contenu du fichier `bienvenue.txt`

```
Bonjour Jean Dupont,
Bienvenue dans l'entreprise.
Ce dossier a été créé automatiquement le JJ/MM/AAAA.
```

---

## 8. Journalisation

Le script génère deux fichiers de log dans le **répertoire depuis lequel il est lancé** :

|Fichier|Contenu|
|---|---|
|`log.txt`|Toutes les opérations réussies avec horodatage|
|`errors.txt`|Toutes les erreurs rencontrées avec horodatage|

### Exemple de `log.txt`

```
[24/05/2026] Dossier /home/employes/Jean_Dupont créé avec succès
[24/05/2026] Dossier /home/employes/Jean_Dupont/Documents créé avec succès
[24/05/2026] Dossier /home/employes/Jean_Dupont/Projets créé avec succès
[24/05/2026] Dossier /home/employes/Jean_Dupont/Archives créé avec succès
[24/05/2026] Fichier /home/employes/Jean_Dupont/bienvenue.txt créé avec succès
[24/05/2026] La ligne correctement écrite dans /home/employes/Jean_Dupont/bienvenue.txt
[24/05/2026] Fichier /home/admin/Templates/charte.pdf copié avec succès
[24/05/2026] Fichier /home/admin/Templates/checklist.xlsx copié avec succès
```

### Exemple de `errors.txt`

```
[24/05/2026] Erreur lors de la copie du fichier /home/admin/Templates/charte.pdf
```

> ℹ️ Si aucune erreur n'est survenue, `errors.txt` sera vide.

---

## 9. Messages d'erreur

|Message|Cause|Solution|
|---|---|---|
|`Utilisation : ./creation_utilisateur.sh <prénom> <nom> <destination> <template>`|Un ou plusieurs paramètres manquants|Vérifier que les 4 paramètres sont fournis|
|`Le dossier [destination] n'existe pas`|Le chemin de destination est incorrect ou inexistant|Créer le dossier ou corriger le chemin|
|`Le dossier [userFolder] existe déjà`|Un dossier avec ce nom existe déjà à destination|Vérifier si l'utilisateur existe déjà ou choisir un autre nom|
|`Le dossier [template] n'existe pas`|Le chemin du dossier Templates est incorrect|Vérifier le chemin fourni en `$4`|
|`Le dossier [template] ne contient pas le fichier charte.pdf`|`charte.pdf` absent du dossier Templates|Ajouter `charte.pdf` dans le dossier Templates|
|`Le dossier [template] ne contient pas le fichier checklist.xlsx`|`checklist.xlsx` absent du dossier Templates|Ajouter `checklist.xlsx` dans le dossier Templates|

---

## 10. Résolution des problèmes

### Le script ne se lance pas

```bash
bash: ./creation_utilisateur.sh: Permission denied
```

**Solution :** Le script n'est pas exécutable.

```bash
chmod +x creation_utilisateur.sh
```

---

### Le script s'arrête immédiatement sans message

**Cause possible :** Un paramètre contient un espace sans guillemets.

**Solution :** Entourer les paramètres contenant des espaces de guillemets :

```bash
./creation_utilisateur.sh "Jean Pierre" Dupont /home/employes /home/admin/Templates
```

---

### Les fichiers modèles ne sont pas copiés

**Cause possible :** `charte.pdf` ou `checklist.xlsx` absent du dossier Templates.

**Solution :** Vérifier le contenu du dossier Templates :

```bash
ls /home/admin/Templates
```

Les deux fichiers doivent être présents. Consulter `errors.txt` pour plus de détails sur l'erreur.