<%@ page import="java.util.List" %>
<%@ page import="com.GymApplication.models.Participant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Participants</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(to right, #30CFD0, #330867);
            color: #fff;
            padding: 20px;
            font-family: 'Arial', sans-serif;
        }

        h2 {
            color: #FFFB46;
        }

        table {
            background-color: rgba(255, 255, 255, 0.8);
            animation: fadeIn 1s ease-out; /* Add fade-in animation */
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        .update-form {
            margin-top: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px;
            border-radius: 10px;
            animation: slideInUp 1s ease-out; /* Add slide-in-up animation */
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideInUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
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
    <div class="container">
        <h2>Update Participants</h2>

        <% List<Participant> participants = (List<Participant>) request.getAttribute("participants");
        if (participants != null) { %>

            <!-- Display participants in a table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Batch ID</th>
                        <th>Action</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Participant participant : participants) { %>
                        <tr>
                            <td><%= participant.getParticipantId() %></td>
                            <td><%= participant.getParticipantName() %></td>
                            <td><%= participant.getParticipantAge() %></td>
                            <td><%= participant.getParticipantGender() %></td>
                            <td><%= participant.getBatchId() %></td>
                            <td>
                                <a href="#" onclick="showUpdateForm('<%= participant.getParticipantId() %>', '<%= participant.getParticipantName() %>', '<%= participant.getParticipantAge() %>', '<%= participant.getParticipantGender() %>', '<%= participant.getBatchId() %>')" class="btn btn-primary">Update</a>
                            </td>
                            <td>
                                <a href="#" onclick="deleteParticipant('<%= participant.getParticipantId() %>')" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Update form -->
            <div id="updateForm" class="update-form" style="display: none;">
                <form action="update-participant" method="post">
                    <input type="hidden" id="updateId" name="updateId" value="">
                    <div class="form-group">
                        <label for="updateName">Name:</label>
                        <input type="text" id="updateName" name="updateName" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="updateAge">Age:</label>
                        <input type="number" id="updateAge" name="updateAge" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="updateGender">Gender:</label>
                        <select id="updateGender" name="updateGender" class="form-control" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="updateBatchId">Batch ID:</label>
                        <input type="number" id="updateBatchId" name="updateBatchId" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-success">Update Participant</button>
                </form>
            </div>

        <% } else { %>
            <p>No participants found.</p>
        <% } %>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showUpdateForm(participantId, name, age, gender, batchId) {
            // Set values in the update form based on the participant ID
            document.getElementById("updateId").value = participantId;
            document.getElementById("updateName").value = name;
            document.getElementById("updateAge").value = age;
            document.getElementById("updateGender").value = gender;
            document.getElementById("updateBatchId").value = batchId;

            // Display the update form
            document.getElementById("updateForm").style.display = "block";
        }

        function deleteParticipant(participantId) {
            if (confirm("Are you sure you want to delete this participant?")) {
                // Redirect to the delete-participant servlet with the participantId parameter
                window.location.href = "delete-participant?participantId=" + participantId;
            }
        }
    </script>

</body>
</html>
