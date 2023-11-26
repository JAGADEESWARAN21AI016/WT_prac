from flask import Flask, render_template, request

app = Flask(__name__)

class BMICalculator:
    def __init__(self):
        self.weight = None
        self.height = None
        self.bmi = None
        self.category = None

    def calculate_bmi(self):
        if self.weight is not None and self.height is not None:
            # Calculate BMI using the formula: BMI = weight (kg) / (height (m) * height (m))
            self.bmi = self.weight / (self.height * self.height)
            self.determine_category()

    def determine_category(self):
        if self.bmi < 18.5:
            self.category = "Underweight"
        elif 18.5 <= self.bmi < 24.9:
            self.category = "Normal Weight"
        elif 25 <= self.bmi < 29.9:
            self.category = "Overweight"
        else:
            self.category = "Obese"

bmi_calculator = BMICalculator()

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        # Retrieve user input from the form
        bmi_calculator.weight = float(request.form['weight'])
        bmi_calculator.height = float(request.form['height'])
        bmi_calculator.calculate_bmi()

    return render_template('index.html', bmi_calculator=bmi_calculator)

if __name__ == '__main__':
    app.run(debug=True)
