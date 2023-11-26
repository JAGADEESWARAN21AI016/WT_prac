<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Multiplication Table Generator</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            text-align: center;
            margin: 20px;
        }
    </style>
</head>
<body>

<form method="post" action="">
    <label for="numberInput">Enter a number:</label>
    <input type="text" id="numberInput" name="number" required>
    <input type="submit" value="Generate Table">
</form>
<%
    int number;
    String numberParam = request.getParameter("number");
    if (numberParam != null && numberParam.matches("\\d+")) {
        number = Integer.parseInt(numberParam);
        out.println("<h2>Multiplication Table for : " + number + "</h2>");
        out.println("<table>");
        out.println("<tr><th>Multiplicand</th><th>Multiplier</th><th>Result</th></tr>");
        for (int i = 1; i <= 10; i++) {
            int result = number * i;
            out.println("<tr><td>" + number + "</td><td>" + i + "</td><td>" + result + "</td></tr>");
        }
        out.println("</table>");
    } else {
        out.println("<p>Please enter a valid number.</p>");
    }
%>
</body>
</html>
