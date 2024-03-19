<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.GymApplication.models.Batch" %>
<%@ page import="com.GymApplication.dmlOperations.BatchOperations" %>

<%
    // Fetching all batches for the dropdown
    BatchOperations batchOpr = new BatchOperations();
    List<Batch> batches = batchOpr.getAllBatches();

    // Set the list of batches as an attribute in the request
    request.setAttribute("batches", batches);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Participant</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(to right, #30CFD0, #330867);
            color: #fff;
            padding: 20px;
            font-family: 'Arial', sans-serif;
            animation: fadeIn 1s ease-out; /* Add fade-in animation */
        }

        h2 {
            color: #007bff;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            margin-top: 10px;
            display: block;
        }

        input,
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Add Participant</h2>

        <form action="participant" method="post">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" required><br>

            <label for="age">Age:</label>
            <input type="number" class="form-control" id="age" name="age" required><br>

            <label for="gender">Gender:</label>
            <select class="form-control" id="gender" name="gender" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <!-- Add more options if needed -->
            </select><br>

            <label for="batchId">Batch:</label>
            <select class="form-control" id="batchId" name="batchId" required>
                <!-- Fetch batch IDs dynamically from the Batch table -->
                <c:forEach var="batch" items="${batches}">
                    <option value="${batch.batchId}">${batch.batchId} - ${batch.batchName}</option>
                </c:forEach>
            </select><br>

            <button type="submit" class="btn btn-primary">Add Participant</button>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
