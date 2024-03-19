package com.GymApplication.dmlOperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GymApplication.connections.DbConnections;
import com.GymApplication.models.Participant;

public class ParticipantOperations {

    private Connection connection = null;
    private PreparedStatement p_stmt;

    public ParticipantOperations() throws Exception {
        connection = DbConnections.getConnection();
    }

    public String addNewParticipant(Participant par) throws SQLException {
        String res = "Err";
        try {
            p_stmt = connection.prepareStatement("INSERT INTO Participant(participant_name, participant_age, participant_gender, batch_id) VALUES(?,?,?,?)");
            p_stmt.setString(1, par.getParticipantName());
            p_stmt.setInt(2, par.getParticipantAge());
            p_stmt.setString(3, par.getParticipantGender());
            p_stmt.setInt(4, par.getBatchId());

            int ch = p_stmt.executeUpdate();
            if (ch >= 1)
                res = "Success";

        } catch (Exception e) {
            res = "Err";
            System.out.println(e);
        }
        return res;
    }

    public List<Participant> getAllParticipants() throws SQLException {
        List<Participant> participants = new ArrayList<>();

        try {
            p_stmt = connection.prepareStatement("SELECT * FROM Participant");
            ResultSet resultSet = p_stmt.executeQuery();

            while (resultSet.next()) {
                Participant participant = new Participant();
                participant.setParticipantId(resultSet.getInt("participant_id"));
                participant.setParticipantName(resultSet.getString("participant_name"));
                participant.setParticipantAge(resultSet.getInt("participant_age"));
                participant.setParticipantGender(resultSet.getString("participant_gender"));
                participant.setBatchId(resultSet.getInt("batch_id"));

                participants.add(participant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return participants;
    }

    public String updateParticipant(int participantId, String updatedName, int updatedAge, String updatedGender, int updatedBatchId) throws SQLException {
        String res = "Err";
        try {
            p_stmt = connection.prepareStatement("UPDATE Participant SET participant_name=?, participant_age=?, participant_gender=?, batch_id=? WHERE participant_id=?");
            p_stmt.setString(1, updatedName);
            p_stmt.setInt(2, updatedAge);
            p_stmt.setString(3, updatedGender);
            p_stmt.setInt(4, updatedBatchId);
            p_stmt.setInt(5, participantId);

            int ch = p_stmt.executeUpdate();
            if (ch >= 1)
                res = "Success";

        } catch (Exception e) {
            res = "Err";
            System.out.println(e);
        }
        return res;
    }

   

    public void closeConnection() {
        try {
            if (p_stmt != null) {
                p_stmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public String deleteParticipant(int participantId) throws SQLException {
        String result = "Err";
        PreparedStatement p_stmt = null;

        try {
            // Use backticks if needed
            p_stmt = connection.prepareStatement("DELETE FROM Participant WHERE `participant_id` = ?");
            p_stmt.setInt(1, participantId);

            int affectedRows = p_stmt.executeUpdate();

            if (affectedRows >= 1) {
                result = "Success";
            }
        } catch (SQLException e) {
            result = "Err";
            e.printStackTrace();
            // Log the exception details or throw a custom exception
            throw new RuntimeException("Error deleting participant", e);
        } finally {
            // Close resources (if necessary)
            if (p_stmt != null) {
                p_stmt.close();
            }
        }

        return result;
    }
}
