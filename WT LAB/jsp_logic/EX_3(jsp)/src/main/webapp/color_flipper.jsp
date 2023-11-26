<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Color Flipper</title>
    <style>
        body {
            text-align: center;
            padding: 50px;
            font-size: 24px;
        }
    </style>
</head>
<body>

    <h1>Color Flipper</h1>

    <form method="post" action="">
        <input type="submit" value="Flip Color">
    </form>

    <%-- Java code to generate a random hex color code --%>
    <%
        String currentColor = (String) session.getAttribute("currentColor");

        if (currentColor == null) {
            // Generate a random hex color code
            currentColor = String.format("#%06X", (int) (Math.random() * 0xFFFFFF + 1));
            session.setAttribute("currentColor", currentColor);
        }

        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Generate a new random hex color code
            currentColor = String.format("#%06X", (int) (Math.random() * 0xFFFFFF + 1));
            session.setAttribute("currentColor", currentColor);
        }
    %>

    <div style="background-color: <%=currentColor%>; color: white; padding: 20px; margin-top: 20px;">
        <p>The current color is: <%=currentColor%></p>
    </div>

</body>
</html>
