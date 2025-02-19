# E-Commerce API

## 📌 Description

Cette API RESTful permet de gérer un système de e-commerce avec des fonctionnalités pour gérer les produits, les clients et les commandes. Elle est développée avec **Node.js**, **Express** et **MongoDB**, et s'exécute dans des conteneurs **Docker**.

## 🚀 Fonctionnalités

- **Gestion des produits** : Création, lecture, mise à jour et suppression des produits.
- **Gestion des clients** : Création, mise à jour et récupération des informations des clients.
- **Gestion des commandes** : Création et suivi des commandes des clients.
- **API RESTful** : Routes structurées sous `/api/products`, `/api/customers`, `/api/orders`.
- **Base de données MongoDB** : Stockage des données avec **Mongoose**.
- **Déploiement avec Docker** : Conteneurisation de l'API et de la base de données.

## 🛠️ Installation et Exécution

### 📥 Prérequis

- [Node.js](https://nodejs.org/) >= 18.x
- [Docker](https://www.docker.com/)
- [MongoDB](https://www.mongodb.com/)

### 📌 Cloner le projet

```bash
git clone https://github.com/ton-repo/ecommerce-api.git
cd ecommerce-api
```

### ⚙️ Configuration

Créer un fichier `.env` à la racine du projet avec les variables suivantes :

```
PORT=5000
MONGO_URI=mongodb://mongodb:27017/ecommerce
```

### 🏗️ Construire et exécuter avec Docker

#### 1️⃣ **Démarrer MongoDB**

```bash
docker run -d --name mongodb -p 27017:27017 mongo:latest
```

#### 2️⃣ **Construire l'image de l'API**

```bash
docker build -t ecommerce-api .
```

#### 3️⃣ **Lancer l'API**

```bash
docker run -d --name ecommerce-api --network host -p 5001:5001 ecommerce-api:latest
```

#### 4️⃣ **Vérifier les conteneurs actifs**

```bash
docker ps
```

### 🔎 Tester l'API

Une fois l'API démarrée, tester les routes avec `test.sh` :

```bash
bash test.sh
```

Ou utiliser **Postman** pour tester les routes :

- **Produits** : `GET http://localhost:5001/api/products`
- **Clients** : `GET http://localhost:5001/api/customers`
- **Commandes** : `GET http://localhost:5001/api/orders`

## 📂 Structure du Projet

```
.
├── config/
│   ├── db.js  # Connexion MongoDB
│
├── models/
│   ├── Product.js
│   ├── Customer.js
│   ├── Order.js
│
├── routes/
│   ├── products.js
│   ├── customers.js
│   ├── orders.js
│
├── server.js  # Point d'entrée de l'application
├── Dockerfile  # Configuration de l'image
├── test.sh  # Script de test des endpoints
├── README.md
```

## 📌 Problèmes courants et solutions

### ❌ **Erreur de connexion à MongoDB (`ECONNREFUSED 127.0.0.1:27017`)**

1. Vérifier si le conteneur MongoDB tourne :
   ```bash
   docker ps
   ```
2. Si MongoDB ne tourne pas, relancer :
   ```bash
   docker run -d --name mongodb -p 27017:27017 mongo:latest
   ```
3. Modifier `MONGO_URI` dans `.env` pour pointer vers `mongodb` au lieu de `localhost` :
   ```
   MONGO_URI=mongodb://mongodb:27017/ecommerce
   ```

### ❌ **Le conteneur ecommerce-api ne démarre pas (`Name already in use`)**

Supprimer l'ancien conteneur et le relancer :
```bash
docker stop ecommerce-api
docker rm ecommerce-api
docker run -d --name ecommerce-api --network host -p 5001:5001 ecommerce-api:latest
```

## 📜 Licence

Ce projet est sous licence **MIT**. Vous êtes libre de l'utiliser et de le modifier selon vos besoins.

---

🚀 **Développé avec Node.js, Express et MongoDB sous Docker !**
