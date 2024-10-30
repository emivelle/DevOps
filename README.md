# Projet DevOps  
**Auteur**: Tom Avenel  
**Année académique**: 2023 / 2024  

---

## Contexte de l’atelier  

Afin d'accélérer le **time-to-market** d’une application et d’améliorer sa qualité, un **déploiement continu** via conteneurs et CI/CD est proposé, en suivant le modèle **Infrastructure-as-Code** (IaC).

---

## Présentation du projet  

### Contexte
Le projet cible une application multi-composants (par exemple, une application Web) à productiviser dans un cadre **DevOps**. Elle pourra être une application existante du groupe ou celle fournie en exemple. Le formateur incarnera tous les rôles externes, notamment celui de client final.

### Contraintes  
Plusieurs contraintes initiales sont identifiées et pourront évoluer selon les retours utilisateurs :

- **Déploiement au plus tôt** : Une version de production est requise en urgence pour capter le marché.
- **Auto-scaling** : Le projet doit supporter une montée en charge dès la 2e itération, car une adoption rapide est anticipée.
- **Zero-downtime** : Le client exige une disponibilité continue, sans interruption de service lors des mises à jour.

---

## Partie DevOps

Le projet se conformera aux pratiques DevOps selon les axes techniques suivants :

### Environnements à déployer  
Pour le déploiement des conteneurs, un **cluster Kubernetes** sera mis en place. Initialement, un unique nœud Kubernetes sur une machine virtuelle via **Minikube** suffira. En parallèle, un **environnement de test/staging** sera établi, avec soit un second cluster Kubernetes limité, soit un orchestrateur Docker-Compose.

### Isolation par conteneurs  
Chaque composant métier sera isolé dans des conteneurs Docker, stockés soit sur Docker Hub, soit dans une **registry privée**.

### Infrastructure as Code (IaC)  
Tous les déploiements seront rendus reproductibles via des fichiers de code et de configuration (ex: YAML). **Ansible** sera employé pour automatiser l’installation et la configuration (Docker, Kubernetes, stack applicative), sans provisionner les OS. L’utilisation de **Terraform** est optionnelle pour gérer les ressources.

L’ensemble du code (scripts, configurations, etc.) devra être versionné dans un dépôt partagé.

### Intégration continue (CI)  
Un pipeline CI/CD sera mis en place pour garantir l’intégrité des images déployées via des tests automatiques, analyses de code, génération et publication des artefacts de production. Ce pipeline inclura la génération d’une image Docker à partir des commits.

Le pipeline pourra être exécuté via un orchestrateur CI/CD tel que **Jenkins**, **GitLab**, ou un service SaaS (Bitbucket, GitLab Cloud, GitHub). La configuration du pipeline devra également être scriptée (fichiers YAML).

- Documentation pour Jenkins avec Docker en IaC : [Jenkins Documentation](https://www.jenkins.io/doc/book/pipeline/docker/)

### Déploiement continu (CD)  
Une fois les composants générés, un déploiement sur la plateforme sera assuré. En bonus, un modèle GitOps pourra être mis en place via **FluxCD** ou **ArgoCD** pour déployer automatiquement les configurations de production depuis le dépôt Git.

### Zero-downtime  
Le modèle de déploiement devra garantir une **disponibilité continue**. L’utilisation de **Flagger** est envisagée pour minimiser les interruptions.

### Observabilité  
La **surveillance** de l’infrastructure et des composants applicatifs sera réalisée avec **Prometheus** et **Grafana**. **Prometheus** surveillera les composants, et **Grafana** affichera les tableaux de bord de monitoring.

Pour récupérer les sondes Docker, **cAdvisor** sera employé pour transmettre les informations à Prometheus.  
- Exemples de dashboards Grafana : [Exemple de Dashboard](https://grafana.com/grafana/dashboards/179-docker-prometheus-monitoring/)

### Logging centralisé  
Pour assurer une **corrélation des logs** en cas de problème, une stack **ELK** sera mise en place. Le tracing (ex: Zipkin, OpenTelemetry) ne sera pas implémenté dans le cadre de ce projet.

---

## Résultat attendu  
Les livrables du projet incluent :

1. Un **document décrivant les éléments DevOps** mis en place, résumant les principes et leur implémentation.
2. Un ou plusieurs **dépôts de code** pour la gestion des applications métier et de la configuration des infrastructures.
3. Un **rapport de projet détaillé** pour la soutenance finale.

---
