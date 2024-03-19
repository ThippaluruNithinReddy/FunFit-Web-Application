package com.GymApplication.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.ParticipantOperations;


@WebServlet("/delete-participant")
public class DeleteParticipantServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String participantIdString = request.getParameter("participantId");

        if (participantIdString != null && !participantIdString.isEmpty()) {
            int participantId = Integer.parseInt(participantIdString);

            // Call the deleteParticipant method
            ParticipantOperations participantOperations = null;
			try {
				participantOperations = new ParticipantOperations();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // Replace with your actual class
            try {
                String result = participantOperations.deleteParticipant(participantId);
                if ("Success".equals(result)) {
                    response.sendRedirect("update-participant"); // Redirect to the participants page after deletion
                } else {
                    // Handle error, e.g., show an error message
                    response.getWriter().println("Error deleting participant.");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle SQLException, e.g., show an error message
                response.getWriter().println("Error deleting participant.");
            }
        } else {
            // Handle invalid or missing participantId parameter, e.g., show an error message
            response.getWriter().println("Invalid or missing participantId parameter.");
        }
    }
}

