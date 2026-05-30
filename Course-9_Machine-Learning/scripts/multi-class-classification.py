# write your function here and then execute this cell
import numpy as np
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
from sklearn.multiclass import OneVsOneClassifier, OneVsRestClassifier
from sklearn.preprocessing import OneHotEncoder, OrdinalEncoder, StandardScaler


def obesity_risk_pipeline(data_path, test_size=0.2):
    # your code here
    # Import Dataset
    data = pd.read_csv(data_path)

    # Models
    preprocessor = ColumnTransformer(
        [
            (
                "scaler",
                StandardScaler(),
                data.select_dtypes(include=["float64"]).columns,
            ),
            (
                "featuresEncoder",
                OneHotEncoder(sparse_output=False, drop="first"),
                data.drop("NObeyesdad", axis=1)
                .select_dtypes(include=["object"])
                .columns,
            ),
            ("targetEncoder", OrdinalEncoder(), ["NObeyesdad"]),
        ]
    )
    LR = LogisticRegression(max_iter=1000)
    model_ovo = OneVsOneClassifier(LR)
    model_ovr = OneVsRestClassifier(LR)

    # Data
    prep_data = preprocessor.fit_transform(data)
    X = prep_data[:, :-1]
    y = prep_data[:, -1]

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=test_size, random_state=42, stratify=y
    )

    # Predictions
    y_pred_ovo = model_ovo.fit(X_train, y_train).predict(X_test)
    y_pred_ova = model_ovr.fit(X_train, y_train).predict(X_test)

    # Evaluation metrics
    print("===== Evaluation Metrics =====")
    print("One-vs-All (OvA) Strategy")
    print(f"Accuracy: {np.round(100*accuracy_score(y_test, y_pred_ova),2)}%")
    print(" ")
    print("One-vs-One (OvO) Strategy")
    print(f"Accuracy: {np.round(100*accuracy_score(y_test, y_pred_ovo),2)}%")


file_path = "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/GkDzb7bWrtvGXdPOfk6CIg/Obesity-level-prediction-dataset.csv"
obesity_risk_pipeline(file_path, test_size=0.20)
