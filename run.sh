
# Démarrer MongoDB avec Docker 
echo "Starting MongoDB..."
docker-compose up -d db

# Attendre que MongoDB soit prêt
echo "Waiting for MongoDB to be ready..."
sleep 10

# Démarrer l'application Express
echo "Starting Express API..."
node server.js