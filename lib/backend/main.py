from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import numpy as np

app = FastAPI(debug=True)

loaded_model = joblib.load('multi_output_svm_model.pkl')

class InputData(BaseModel):
    symptoms : list[int]


class PredictionResult(BaseModel):
    prediction: dict

@app.post("/predict", response_model=PredictionResult)
async def predict(data: InputData):
    symptoms = data.symptoms
    input_features = np.array(symptoms).reshape(1, -1)
    prediction = loaded_model.predict(input_features).tolist()
    print(prediction)
    condition_names = [
    "Bipolar disorder",
    "Schizophrenia",
    "Depression",
    "Anxiety disorder",
    "PTSD"
]
    response = {}
    for i, condition in enumerate(condition_names):
        response[condition] = prediction[0][i]

    filtered_response = {key: value for key, value in response.items() if value == 1}

    return {"prediction": filtered_response}
