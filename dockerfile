# Dockerfile pour phpMyAdmin
FROM phpmyadmin/phpmyadmin

# Configuration de phpMyAdmin pour se connecter à MySQL
ENV PMA_HOST=db-svc-test.test.svc.cluster.local