# README

# 🖥️ M122 — Automatisation de la création d'environnement utilisateur

Script Bash développé dans le cadre du module M122 pour automatiser la préparation de l'environnement de travail d'un nouvel employé.

---

## 📋 Contexte

Dans une équipe informatique, la création manuelle des dossiers et fichiers pour chaque nouvel employé est une tâche répétitive et source d'erreurs. Ce script automatise entièrement ce processus afin de garantir une structure identique pour tous les collaborateurs.

## 🎯 Problème résolu

Sans automatisation, l'administrateur système doit :
- Créer manuellement les dossiers pour chaque utilisateur
- Copier les fichiers modèles (charte, checklist) à la main
- Rédiger le fichier de bienvenue sans se tromper

Ce script réalise tout cela en une seule commande.

---

## ⚙️ Fonctionnement

Le script `creation_utilisateur.sh` effectue les opérations suivantes :

1. Vérifie que tous les paramètres sont fournis
2. Vérifie que le dossier de destination existe
3. Vérifie que le dossier utilisateur n'existe pas déjà (évite l'écrasement)
4. Vérifie que le dossier Templates contient bien `charte.pdf` et `checklist.xlsx`
5. Crée l'arborescence `Nom_Prenom/Documents`, `Projets`, `Archives`
6. Génère le fichier `bienvenue.txt` personnalisé
7. Copie les fichiers modèles dans `Documents/`
8. Journalise toutes les opérations dans `log.txt` et les erreurs dans `errors.txt`

### Structure créée pour chaque utilisateur

```
Nom_Prenom/
├── Documents/
│   ├── charte.pdf
│   └── checklist.xlsx
├── Projets/
├── Archives/
└── bienvenue.txt
```

---

## 🚀 Lancer le script

```bash
./creation_utilisateur.sh <Prenom> <Nom> <Destination> <Templates>
```

### Exemple

```bash
./creation_utilisateur.sh Jean Dupont /home/employes /home/admin/Templates
```

---

## 📌 Paramètres

| Paramètre     | Description                                      | Exemple               |
|---------------|--------------------------------------------------|-----------------------|
| `Prenom`      | Prénom du nouvel utilisateur                     | `Jean`                |
| `Nom`         | Nom du nouvel utilisateur                        | `Dupont`              |
| `Destination` | Chemin du dossier où créer l'environnement       | `/home/employes`      |
| `Templates`   | Chemin du dossier contenant `charte.pdf` et `checklist.xlsx` | `/home/admin/Templates` |

---

## 🔧 Prérequis

- Système Linux avec Bash
- Les fichiers `charte.pdf` et `checklist.xlsx` doivent être présents dans le dossier Templates
- Droits d'écriture sur le dossier de destination

---

## 📁 Structure du dépôt

```
M122/
├── README.md
├── scripts/
│   ├── creation_utilisateur.sh      # Script principal
│   └── creation_utilisateur_test.sh # Script de test
├── documentation/
│   ├── rapport.md                   # Rapport de projet complet
│   └── manuel_utilisateur.md        # Manuel d'utilisation détaillé
├── diagramme/
│   ├── diagramme.drawio             # Diagramme de flux (source)
│   └── diagramme.drawio.png         # Diagramme de flux (export PNG)
└── logs/
    └── log.txt                      # Exemple de fichier de journalisation
```

---

## 📄 Fichier log

Le script génère deux fichiers de log dans le répertoire courant lors de l'exécution :

- `log.txt` — toutes les opérations réussies avec horodatage
- `errors.txt` — les erreurs rencontrées avec horodatage

Un exemple de log généré lors des tests est disponible dans [`logs/log.txt`](logs/log.txt).

---

## 👤 Auteur

**Romain Perez** — Module M122, 2026
