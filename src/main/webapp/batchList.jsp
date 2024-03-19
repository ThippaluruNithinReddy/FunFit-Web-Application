<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.GymApplication.models.Batch" %>
<%@ page import="java.util.List" %>
<%@ page import="com.GymApplication.dmlOperations.BatchOperations" %>

<%
    BatchOperations batchOperations = null;
    List<Batch> batchList = null;

    try {
        batchOperations = new BatchOperations();
        batchList = batchOperations.getAllBatches();
        pageContext.setAttribute("batchList", batchList);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (batchOperations != null) {
            batchOperations.closeConnection();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Batch List</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add a gradient background */
        body {
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
        }
        /* Add some animation */
        @keyframes example {
            0% {background-color: red;}
            25% {background-color: yellow;}
            50% {background-color: blue;}
            100% {background-color: green;}
        }
        /* Apply the animation to the table */
        table {
            animation-name: example;
            animation-duration: 4s;
        }
        /* Different pattern for table */
        .table {
            border-collapse: separate;
            border-spacing: 0 15px;
        }
        .table th {
            background: #fff;
        }
        .table th, .table td {
            border: none;
        }
         h2 {
            color: #807fc0;
        }

        .container {
            margin-top: 50px;
        }

        .navbar {
            background: radial-gradient(circle, #ff8040, #c0c0c0);
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-nav {
            animation: fadeInUp 1.5s ease-out;
            margin-top: 10px;
        }

        .nav-item {
            opacity: 0;
            animation: fadeInUp 1.5s forwards;
            margin-right: 20px;
        }

        .nav-link {
            color: #fff;
            background: none;
            padding: 0;
            margin-right: 10px;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .nav-link svg {
            fill: #fff;
            width: 24px;
            height: 24px;
            margin-right: 5px;
        }

        .nav-link:hover {
            color: #ffcc80;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>


	<div class="container">
        <h2>ZumbaSync: Effortless Participant and Batch Management</h2>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="batch.html">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <!-- Add SVG path data here -->
                            </svg>
                            Add Batch
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="participant.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <!-- Add SVG path data here -->
                            </svg>
                            Add Participant
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="batchList.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <!-- Add SVG path data here -->
                            </svg>
                            Batch List
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="update-participant">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <!-- Add SVG path data here -->
                            </svg>
                            Update Participant
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        
    </div>

    <h2>Batch List</h2>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Batch ID</th>
                <th>Batch Name</th>
                <th>Batch Time</th>
                <th>Action</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="batch" items="${batchList}">
                <tr>
                    <td><c:out value="${batch.batchId}" /></td>
                    <td><c:out value="${batch.batchName}" /></td>
                    <td><c:out value="${batch.batchTime}" /></td>
                    <td>
                        <a href="#" class="btn btn-primary" onclick="showUpdateForm('${batch.batchId}', '${batch.batchName}', '${batch.batchTime}')">Update</a>
                    </td>
                    <td>
                        <a href="#" class="btn btn-danger" onclick="deleteBatch('${batch.batchId}')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Update form -->
    <div id="updateForm" class="update-form" style="display: none;">
        <form action="update-batch" method="post">
            <input type="hidden" id="updateId" name="updateId" value="">
            <div class="form-group">
                <label for="updateName">Batch Name:</label>
                <input type="text" id="updateName" name="updateName" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="updateTime">Batch Time:</label>
                <input type="text" id="updateTime" name="updateTime" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Update Batch</button>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showUpdateForm(batchId, batchName, batchTime) {
            // Set values in the update form based on the batch ID
            document.getElementById("updateId").value = batchId;
            document.getElementById("updateName").value = batchName;
            document.getElementById("updateTime").value = batchTime;

            // Display the update form
            document.getElementById("updateForm").style.display = "block";
        }

        function deleteBatch(batchId) {
            if (confirm("Are you sure you want to delete this batch?")) {
                // Redirect to the delete-batch servlet with the batchId parameter
                window.location.href = "delete-batch?batchId=" + batchId;
            }
        }
    </script>

</body>
</html>
