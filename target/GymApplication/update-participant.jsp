<%@ page import="java.util.List" %>
<%@ page import="com.GymApplication.models.Participant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Participants</title>
    <!-- Include Bootstrap CSS -->
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
    </style>
</head>
<body>
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
                            <td><a href="#" onclick="showUpdateForm('<%= participant.getParticipantId() %>')" class="btn btn-primary">Update</a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Update form -->
            <div id="updateForm" class="update-form" style="display: none;">
                <form action="update-participant-handler" method="post">
                    <!-- Add hidden field for participant ID -->
                    <input type="hidden" id="updateId" name="updateId" value="">
                    
                    <!-- Add form fields for update -->
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
                            <!-- Add more options if needed -->
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
        document.getElementById("updateName").value = name; // Set the initial value
        document.getElementById("updateAge").value = age; // Set the initial value
        document.getElementById("updateGender").value = gender; // Set the initial value
        document.getElementById("updateBatchId").value = batchId; // Set the initial value

        // Display the update form
        document.getElementById("updateForm").style.display = "block";
    }

    </script>

</body>
</html>
