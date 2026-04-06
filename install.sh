#!/bin/bash
echo "-------------------------------------------------------"
echo "   🚀 Installation de Fortress360 Rebranded            "
echo "-------------------------------------------------------"

# Initialisation Swarm si nécessaire
if [ "$(docker info --format '{{.Swarm.LocalNodeState}}')" != "active" ]; then
    docker swarm init
fi

echo "[*] Déploiement des services via GHCR..."
sudo docker stack deploy -c compose.yml fortress360

echo "✅ Stack déployée. Vérifiez l'état avec : sudo docker service ls"
