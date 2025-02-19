

# URL de base de l'API
API_URL="http://localhost:5002"

# Fonction pour afficher les résultats des tests
print_result() {
    if [ $1 -eq 0 ]; then
        echo "✅ Success: $2"
    else
        echo "❌ Error: $2"
    fi
}

# Tester la création d'un produit
echo "Testing POST /api/products..."
PRODUCT_ID=$(curl -s -X POST "$API_URL/api/products" -H "Content-Type: application/json" -d '{
    "name": "Test Product",
    "description": "This is a test product",
    "price": 100,
    "stock": 10
}' | jq -r '._id')
print_result $? "Create Product"

# Tester la récupération de tous les produits
echo "Testing GET /api/products..."
curl -s -X GET "$API_URL/api/products" | jq
print_result $? "Get All Products"

# Tester la récupération d'un produit par ID
echo "Testing GET /api/products/$PRODUCT_ID..."
curl -s -X GET "$API_URL/api/products/$PRODUCT_ID" | jq
print_result $? "Get Product by ID"

# Tester la mise à jour d'un produit
echo "Testing PUT /api/products/$PRODUCT_ID..."
curl -s -X PUT "$API_URL/api/products/$PRODUCT_ID" -H "Content-Type: application/json" -d '{
    "price": 150
}' | jq
print_result $? "Update Product"

# Tester la suppression d'un produit
echo "Testing DELETE /api/products/$PRODUCT_ID..."
curl -s -X DELETE "$API_URL/api/products/$PRODUCT_ID" | jq
print_result $? "Delete Product"

# Tester la création d'un client
echo "Testing POST /api/customers..."
CUSTOMER_ID=$(curl -s -X POST "$API_URL/api/customers" -H "Content-Type: application/json" -d '{
    "name": "Test Customer",
    "email": "test@example.com",
    "password": "password123",
    "address": "123 Test St"
}' | jq -r '._id')
print_result $? "Create Customer"

# Tester la récupération de tous les clients
echo "Testing GET /api/customers..."
curl -s -X GET "$API_URL/api/customers" | jq
print_result $? "Get All Customers"

# Tester la création d'une commande
echo "Testing POST /api/orders..."
ORDER_ID=$(curl -s -X POST "$API_URL/api/orders" -H "Content-Type: application/json" -d '{
    "customerId": "'"$CUSTOMER_ID"'",
    "products": [
        {"productId": "'"$PRODUCT_ID"'", "quantity": 2}
    ]
}' | jq -r '._id')
print_result $? "Create Order"

# Tester la récupération de toutes les commandes
echo "Testing GET /api/orders..."
curl -s -X GET "$API_URL/api/orders" | jq
print_result $? "Get All Orders"

# Tester la suppression d'une commande
echo "Testing DELETE /api/orders/$ORDER_ID..."
curl -s -X DELETE "$API_URL/api/orders/$ORDER_ID" | jq
print_result $? "Delete Order"

# Tester la suppression d'un client
echo "Testing DELETE /api/customers/$CUSTOMER_ID..."
curl -s -X DELETE "$API_URL/api/customers/$CUSTOMER_ID" | jq
print_result $? "Delete Customer"