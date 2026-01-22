#  DigitalBank – Plateforme de Gestion et Monitoring Bancaire

## Description du projet

Ce projet a pour objectif de concevoir et déployer une **plateforme no-code / low-code de gestion des données bancaires et de monitoring de sécurité** pour l’entreprise fictive **DigitalBank**.

La plateforme permet :
- La visualisation des clients, comptes et transactions
- La détection et l’alerte des activités frauduleuses
- La gestion des accès utilisateurs via un système RBAC
- Le monitoring de la sécurité et des performances
- La génération de rapports automatisés


##  Membres du groupe et rôles

| Nom                     | Rôle dans le projet                        |
|---------- --------------|--------------------------------------------|
| Cylia AIRA              | Backend & Base de données (Supabase) et Ml |
| Rania Chahinez Merzougui| Sécurité, RBAC & RLS                       |
| Kahina Brahini          |  Dashboards & Visualisation                |




## Architecture technique

### Vue globale de l’architecture

Utilisateurs
    |
    v
Frontend / Dashboards
( Grafana)
    |   
    v
API Layer
(Supabase REST API + Auth)
    |
    v
Base de données PostgreSQL
(Customers, Accounts, Transactions)
|
+--> Automatisation (supabase)
|
+--> Monitoring & Logs (Grafana / ELK)



##  Technologies utilisées

### Backend / API
- **Supabase**
  - PostgreSQL
  - Authentification (Email + MFA)
  - API REST auto-générée
  - Row Level Security (RLS)

### Frontend / Visualisation
- **Grafana** : Monitoring système et applicatif , Dashboards analytiques


### Automatisation
- **n8n** ou **Make.com**

### Sécurité
- RBAC (Role-Based Access Control)
- RLS PostgreSQL
- Audit logs


##  Prérequis

- Compte **Supabase** 
- Navigateur web
- Git
- render 
- Python 3.10+ (pour l’API IA)

---

## Installation (étape par étape)

1. Créer un projet Supabase
2. Importer le schéma SQL fourni (tables clients, comptes, transactions)
3. Activer l’authentification Email / Password 
4. Activer la MFA
5. Ajouter les rôles utilisateurs (admin, analyst, customer_service, customer)
6. Activer Row Level Security (RLS)
7. Créer les policies RLS pour chaque rôle
8. Connecter Grafana à la base Supabase et prometheus


##  Configuration et déploiement

### Sécurité
- MFA activée pour les utilisateurs sensibles
- Accès contrôlé par rôles
- Accès aux données restreint via RLS

### déploiement
- deployement sur render 

### API
- Utilisation des API REST ( Postman ) auto-générées de Supabase
- Accès sécurisé par JWT

### Dashboards
- Filtres par date, client, type de transaction



## Guide utilisateur

### Rôle : Administrateur
- Gestion des utilisateurs et des rôles
- Accès complet aux données
- Consultation des logs d’audit

### Rôle : Analyste de sécurité
- Visualisation des transactions
- Accès aux alertes de fraude
- Analyse des comportements suspects

### Rôle : Service client
- Recherche de clients
- Consultation des comptes et transactions
- Blocage / déblocage de cartes

### Rôle : Client
- Consultation de ses propres comptes
- Consultation de ses transactions uniquement





