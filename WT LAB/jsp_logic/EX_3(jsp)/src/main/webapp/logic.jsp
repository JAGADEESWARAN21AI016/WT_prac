<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Greeting Based on Time</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .greeting-container {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .morning {
            color: #FFA500; /* Orange color for morning */
        }

        .afternoon {
            color: #008000; /* Green color for afternoon */
        }

        .evening {
            color: #4B0082; /* Indigo color for evening */
        }
    </style>
</head>
<body>

<div class="greeting-container">
    <%
        int hourOfDay = java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY);
        String greetingMessage;

        if (hourOfDay >= 6 && hourOfDay < 12) {
            greetingMessage = "Good morning!";
            out.println("<h1 class='morning'>" + greetingMessage + "</h1>");
        } else if (hourOfDay >= 12 && hourOfDay < 18) {
            greetingMessage = "Good afternoon!";
            out.println("<h1 class='afternoon'>" + greetingMessage + "</h1>");
        } else {
            greetingMessage = "Good evening!";
            out.println("<h1 class='evening'>" + greetingMessage + "</h1>");
        }
    %>
</div>

</body>
</html>
