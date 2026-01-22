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

