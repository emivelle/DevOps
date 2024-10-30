étape :
Création du pod grafana : minikube kubectl -- apply -f grafana-pod.yml
Création du service grafana : minikube kubectl -- apply -f grafana-service.yml
Création de la configmap (pour le fichier de config prometheus) : kubectl create configmap prometheus-config --from-file=prometheus.yml=C:\Users\kevin\Documents\ESGI\Cours\Devops\Projet\prometheus.yml --dry-run=client -o yaml | kubectl apply -f -
Création du pod prometheus : minikube kubectl -- apply -f prometheus-pod.yml
Création du service prometheus : minikube kubectl -- apply -f prometheus-service.yml


Il faudra juste changer le chemin d'accès au fichier prometheus.yml en fonction de la où se situe le fichier