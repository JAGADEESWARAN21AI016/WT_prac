public class BMICalculatorBean {
    private double weight;
    private double height;
    private double bmi;
    private String category;

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getBmi() {
        // Calculate BMI using the formula: BMI = weight (kg) / (height (m) * height (m))
        bmi = weight / (height * height);
        determineCategory();
        return bmi;
    }

    public String getCategory() {
        return category;
    }

    private void determineCategory() {
        if (bmi < 18.5) {
            category = "Underweight";
        } else if (bmi < 24.9) {
            category = "Normal Weight";
        } else if (bmi < 29.9) {
            category = "Overweight";
        } else {
            category = "Obese";
        }
    }
}
