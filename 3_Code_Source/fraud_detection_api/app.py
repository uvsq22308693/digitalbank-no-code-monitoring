from flask import Flask, request, jsonify
import joblib
import numpy as np
import os

app = Flask(__name__)

# Charger l'encodeur et le modèle
encoder = joblib.load('onehot_encoder.pkl')
model = joblib.load('random_forest_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json
    # data['features'] doit être : [amount, merchant_category, hour_of_day, day_of_week]
    amount = data['features'][0]
    merchant_category = data['features'][1]
    hour_of_day = data['features'][2]
    day_of_week = data['features'][3]

    # Encoder seulement merchant_category
    merchant_encoded = encoder.transform([[merchant_category]])  # 2D pour sklearn

    # Convertir les numériques en 2D pour hstack
    X_numeric = np.array([[amount, hour_of_day, day_of_week]])

    # Combiner les colonnes numériques avec l'encodé
    X_model = np.hstack([X_numeric, merchant_encoded])

    # Debug : afficher la forme des données
    print("X_model shape:", X_model.shape)
    print("X_model:", X_model)

    # Prédiction
    prediction = model.predict(X_model)
    fraud_score = model.predict_proba(X_model)[0][1]

    return jsonify({
        'is_fraud': bool(prediction[0]),
        'fraud_score': float(fraud_score)
    })

#if __name__ == '__main__':
    #app.run(host='0.0.0.0', port=5000)
if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))  # 5000 si pas défini
    app.run(host='0.0.0.0', port=port)
