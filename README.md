# 🖥️ M122 — Automatisation de la création d'environnement utilisateur

Script Bash qui automatise la préparation de l'environnement de travail d'un nouvel employé : création des dossiers, génération du fichier de bienvenue et copie des fichiers modèles.

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
Prenom_Nom/
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
- Les fichiers `charte.pdf` et `checklist.xlsx` présents dans le dossier Templates
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
    └── log.txt                      # Exemple de journalisation
```

---

## 📄 Journalisation

Le script génère `log.txt` (opérations réussies) et `errors.txt` (erreurs) dans le répertoire courant. Un exemple est disponible dans [`logs/log.txt`](logs/log.txt).

> Pour plus de détails, consulter le [manuel utilisateur](documentation/manuel_utilisateur.md).

---

## 👤 Auteur

**Romain Perez** — Module M122, 2026
