package com.GymApplication.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GymApplication.dmlOperations.ParticipantOperations;
import com.GymApplication.models.Participant;

@WebServlet("/update-participant")
public class UpdateParticipantsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ParticipantOperations participantOperations = null;
		try {
			participantOperations = new ParticipantOperations();
		} catch (Exception e) {
			e.printStackTrace();
		}
        try {
            // Retrieve the list of participants from the database
            List<Participant> participants = participantOperations.getAllParticipants();

            // Set the list as a request attribute to be accessed in the JSP page
            request.setAttribute("participants", participants);

            // Forward the request to the update-participants.html page
            request.getRequestDispatcher("/update-participant.jsp").forward(request, response);
            

        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving participants");
        }
    }
}
