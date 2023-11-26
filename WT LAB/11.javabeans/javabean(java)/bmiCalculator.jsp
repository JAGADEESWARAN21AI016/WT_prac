<%@ page import="your_package_name.BMICalculatorBean" %>
<jsp:useBean id="bmiCalculator" class="your_package_name.BMICalculatorBean" scope="session"/>
<%
    if (request.getMethod().equals("POST")) {
        double weight = Double.parseDouble(request.getParameter("weight"));
        double height = Double.parseDouble(request.getParameter("height"));
        bmiCalculator.setWeight(weight);
        bmiCalculator.setHeight(height);
        bmiCalculator.calculateBmi();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>BMI Calculator</title>
</head>
<body>
    <h2>BMI Calculator</h2>
    
    <form method="post" action="bmiCalculator.jsp">
        <label for="weight">Weight (kg): </label>
        <input type="text" name="weight" id="weight" value="<%= bmiCalculator.getWeight() %>" required/><br/>

        <label for="height">Height (m): </label>
        <input type="text" name="height" id="height" value="<%= bmiCalculator.getHeight() %>" required/><br/>

        <input type="submit" value="Calculate BMI"/>
        <input type="button" value="Reset" onclick="resetForm()"/>
    </form>

    <%-- Display the result if BMI is calculated --%>
    <c:if test="${not empty bmiCalculator.bmi}">
        <div class="result">
            <h2>BMI Result</h2>
            <p>Your BMI is: <%= bmiCalculator.getBmi() %></p>
            <p>Category: <%= bmiCalculator.getCategory() %></p>
        </div>
    </c:if>

    <script>
        function resetForm() {
            document.getElementById("weight").value = "";
            document.getElementById("height").value = "";
        }
    </script>
</body>
</html>
