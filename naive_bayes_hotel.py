import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.preprocessing import LabelEncoder
import numpy as np

# ------------------------------------------------------------------
# Load your data
# (Built by joining Booking_Fact -> Customer, Room -> Room_Details,
#  and Payment, exactly as defined in schema.sql / populate.sql)
# ------------------------------------------------------------------
# df = pd.read_sql("SELECT ... FROM Booking_Fact JOIN ...", connection)

# Data extracted from the Hotel_Management case study (populate.sql)
data = {
    'Booking_ID': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010,
                    1011, 1012, 1013, 1014, 1015, 1016, 1017, 1018, 1019, 1020],
    'Age': [36, 41, 34, 38, 31, 33, 46, 29, 51, 43,
            48, 35, 61, 32, 44, 37, 63, 36, 106, 56],
    'Gender': ['Female', 'Male', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female',
               'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female', 'Male', 'Female'],
    'Payment_Mode': ['Credit Card', 'Debit Card', 'Cash', 'UPI/Online', 'Credit Card',
                      'Credit Card', 'Cash', 'Debit Card', 'UPI/Online', 'Credit Card',
                      'Credit Card', 'Debit Card', 'Cash', 'Credit Card', 'UPI/Online',
                      'Credit Card', 'Debit Card', 'Credit Card', 'Cash', 'UPI/Online'],
    'Capacity': [1, 2, 4, 4, 1, 2, 2, 5, 1, 2,
                 3, 2, 4, 1, 2, 2, 3, 2, 4, 1],
    'Price_Per_Night': [80, 140, 250, 600, 80, 140, 200, 280, 85, 150,
                         350, 160, 290, 90, 210, 160, 370, 220, 650, 90],
    'Number_of_Days': [2, 3, 4, 2, 1, 5, 2, 3, 2, 4,
                        1, 3, 2, 1, 5, 2, 3, 4, 2, 1],
    'Total_Amount': [160, 420, 1000, 1200, 80, 700, 400, 840, 170, 600,
                      350, 480, 580, 90, 1050, 320, 1110, 880, 1300, 90]
}

df = pd.DataFrame(data)

# Target variable: High_Spender = 1 if the booking's Total_Amount is above
# the median spend, 0 otherwise (mirrors "Animal_Engaged" in the reference)
median_spend = df['Total_Amount'].median()
df['High_Spender'] = (df['Total_Amount'] > median_spend).astype(int)

# Data preprocessing for data mining
print("Dataset Info:")
print(df.info())
print("\nMissing values:")
print(df.isnull().sum())

# Convert categorical variables to numerical using LabelEncoder for better handling
le_gender = LabelEncoder()
le_payment = LabelEncoder()

df['Gender_encoded'] = le_gender.fit_transform(df['Gender'])
df['Payment_Mode_encoded'] = le_payment.fit_transform(df['Payment_Mode'])

print(f"\nGender encoding: {dict(zip(le_gender.classes_, le_gender.transform(le_gender.classes_)))}")
print(f"Payment Mode encoding: {dict(zip(le_payment.classes_, le_payment.transform(le_payment.classes_)))}")

# Features and target variable (more comprehensive feature set for data mining)
X = df[['Age', 'Gender_encoded', 'Payment_Mode_encoded', 'Capacity', 'Price_Per_Night', 'Number_of_Days']]
y = df['High_Spender']

print(f"\nFeature matrix shape: {X.shape}")
print(f"Target variable distribution:\n{y.value_counts()}")

# Split the dataset into training and testing
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42, stratify=y
)

print(f"\nTraining set size: {X_train.shape[0]}")
print(f"Testing set size: {X_test.shape[0]}")

# Create and train Naive Bayes classifier
model = GaussianNB()
model.fit(X_train, y_train)

# Predictions
y_pred = model.predict(X_test)
y_pred_proba = model.predict_proba(X_test)

# Evaluate the model
accuracy = accuracy_score(y_test, y_pred)
print(f'\nAccuracy: {accuracy:.4f}')

print("\nClassification Report:")
print(classification_report(y_test, y_pred, target_names=['Low Spender', 'High Spender']))

print("\nConfusion Matrix:")
print(confusion_matrix(y_test, y_pred))

# Additional metrics for data mining analysis
print(f"\nPrediction probabilities for test samples:")
for i, proba in enumerate(y_pred_proba):
    print(f"Sample {i+1}: Low Spender={proba[0]:.3f}, High Spender={proba[1]:.3f}")

# Feature importance analysis (for Bayesian interpretation)
print(f"\nClass priors: {model.class_prior_}")
print("Feature means per class:")
for i, class_name in enumerate(['Low Spender', 'High Spender']):
    print(f"  {class_name}: {model.theta_[i]}")
