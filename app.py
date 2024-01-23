from flask import Flask, render_template, request
import pandas as pd
from qiskit import QuantumCircuit
from sklearn.metrics import mean_squared_error, accuracy_score
from tabulate import tabulate
import numpy as np

app = Flask(__name__)

# Maksimum hasil yang ditampilkan per halaman
RESULTS_PER_PAGE = 10

def load_data(file_path):
    data = pd.read_csv(file_path)
    return data

def search_food_by_calories(data, target_calories):
    result = data[data['calories'] <= target_calories]
    return result[['id', 'name', 'calories']]

def quantum_search(data_qubits, target_qubit, num_iterations):
    n = len(data_qubits)

    qc = QuantumCircuit(n+1, n)

    qc.h(range(n+1))

    for _ in range(num_iterations):
        qc = brute_force_quantum_search(data_qubits, target_qubit, 1)
        qc.h(data_qubits)

    qc.measure(data_qubits, range(n))

    return qc

def brute_force_quantum_search(data_qubits, target_qubit, num_iterations):
    n = len(data_qubits)

    qc = QuantumCircuit(n+1, n)

    qc.h(data_qubits)

    for _ in range(num_iterations):
        qc.x(target_qubit)
        qc.mct(list(data_qubits), target_qubit)  # Convert data_qubits to a list
        qc.x(target_qubit)

        qc.h(data_qubits)
        qc.x(data_qubits)
        qc.h(data_qubits[-1])
        qc.mct(list(data_qubits[:-1]), data_qubits[-1])  # Convert data_qubits[:-1] to a list
        qc.h(data_qubits[-1])
        qc.x(data_qubits)
        qc.h(data_qubits)

    qc.measure(data_qubits, range(n))

    return qc


def process_measurement_counts(counts):
    binary_string = max(counts, key=counts.get)
    return int(binary_string, 2)

# Calculate mean squared error
def calculate_mse(true_labels, predicted_labels):
    return mean_squared_error(true_labels, predicted_labels)

# Calculate root mean squared error
def calculate_rmse(true_labels, predicted_labels):
    return mean_squared_error(true_labels, predicted_labels, squared=False)

# Calculate accuracy
def calculate_accuracy(true_labels, predicted_labels):
    return accuracy_score(true_labels, predicted_labels)

# Calculate metrics
def calculate_metrics(true_labels, predicted_labels):
    mse = calculate_mse(true_labels, predicted_labels)
    rmse = calculate_rmse(true_labels, predicted_labels)
    accuracy = calculate_accuracy(true_labels, predicted_labels)
    return mse, rmse, accuracy

# Print summary table
def print_summary_table(model_name, mse, rmse, accuracy, data_qubits, target_qubit, num_iterations):
    headers = ["Metric", "Value"]
    data = [
        ["Mean Squared Error (MSE)", mse],
        ["Root Mean Squared Error (RMSE)", rmse],
        ["Accuracy", accuracy],
        ["Data Qubits", str(list(data_qubits))],
        ["Target Qubit", target_qubit],
        ["Number of Iterations", num_iterations]
    ]
    table = tabulate(data, headers, tablefmt="grid")
    print(f"==================================================")
    print(model_name)
    print(f"==================================================")
    print(table)
    print(f"==================================================")

# ... (existing code)

@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST':
        target_calories = float(request.form['target_calories'])
        page = int(request.args.get('page', 1))
        data = load_data('nutrition.csv')
        result = search_food_by_calories(data, target_calories)

        if not result.empty:
            # Assuming you have true labels for your search results, replace 'true_labels' with your actual labels
            true_labels = np.random.randint(2, size=len(result))

            # Assuming 'predicted_labels' is obtained from your quantum search, replace it with your predicted labels
            predicted_labels = np.random.randint(2, size=len(result))

            # Quantum model configuration
            data_qubits = range(5)  # Replace with the actual qubits used in your model
            target_qubit = 5  # Replace with the actual target qubit used in your model
            num_iterations = 3  # Replace with the actual number of iterations used in your model

            # Calculate metrics
            mse, rmse, accuracy = calculate_metrics(true_labels, predicted_labels)

            # Print summary
            summary_text = print_summary_table("Quantum Search Model", mse, rmse, accuracy, data_qubits, target_qubit, num_iterations)

            return render_template('index.html', result=result, page=page, mse=mse, rmse=rmse, accuracy=accuracy, summary=summary_text)
        else:
            return render_template('index.html', no_result=True)

    return render_template('index.html', result=None)

# ... (existing code)

if __name__ == "__main__":
    app.run(debug=True)
