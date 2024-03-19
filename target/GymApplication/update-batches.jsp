
<%@ page import="java.util.List" %>
<%@ page import="com.GymApplication.models.Batch" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Batches</title>
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
        <h2>Update Batches</h2>

       <% 
List<Batch> batches = (List<Batch>) request.getAttribute("batches");
System.out.println("Batches: " + batches); // Add this line for debugging
if (batches != null && !batches.isEmpty()) { %>
<!-- ... rest of your code ... -->


            <!-- Display batches in a table -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Time</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Batch batch : batches) { %>
                        <tr>
                            <td><%= batch.getBatchId() %></td>
                            <td><%= batch.getBatchName() %></td>
                            <td><%= batch.getBatchTime() %></td>
                            <td><a href="#" onclick="showUpdateForm('<%= batch.getBatchId() %>', '<%= batch.getBatchName() %>', '<%= batch.getBatchTime() %>')" class="btn btn-primary">Update</a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>

            <!-- Update form -->
            <div id="updateForm" class="update-form" style="display: none;">
                <form action="update-batch-handler" method="post">
                    <!-- Add hidden field for batch ID -->
                    <input type="hidden" id="updateBatchId" name="updateBatchId" value="">
                    
                    <!-- Add form fields for update -->
                    <div class="form-group">
                        <label for="updateBatchName">Name:</label>
                        <input type="text" id="updateBatchName" name="updateBatchName" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="updateBatchTime">Time:</label>
                        <input type="text" id="updateBatchTime" name="updateBatchTime" class="form-control" required>
                    </div>
                    
                    <button type="submit" class="btn btn-success">Update Batch</button>
                </form>
            </div>

        <% } else { %>
            <p>No batches found.</p>
        <% } %>
    </div>

    <!-- Bootstrap JS and Popper.js (for Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- Your custom script to handle update form display -->
    <script>
        function showUpdateForm(batchId, batchName, batchTime) {
            // Set values in the update form based on the batch details
            document.getElementById("updateBatchId").value = batchId;
            document.getElementById("updateBatchName").value = batchName;
            document.getElementById("updateBatchTime").value = batchTime;

            // Display the update form
            document.getElementById("updateForm").style.display = "block";
        }
    </script>

</body>
</html>
