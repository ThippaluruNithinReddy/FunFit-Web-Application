package com.GymApplication.dmlOperations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GymApplication.connections.DbConnections;
import com.GymApplication.models.Batch;
import com.GymApplication.models.Participant;

public class BatchOperations {
    private Connection connection = null;

    public BatchOperations() throws Exception {
        connection = DbConnections.getConnection();
    }

    public String addNewBatch(Batch batch) {
        String result = "Err";
        try (PreparedStatement pstmt = connection.prepareStatement("INSERT INTO Batch(batch_name, batch_time) VALUES (?, ?)")) {
            pstmt.setString(1, batch.getBatchName());
            pstmt.setString(2, batch.getBatchTime());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected >= 1) {
                result = "Success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Batch> getAllBatches() throws SQLException {
        List<Batch> batches = new ArrayList<>();

        try (PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Batch");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Batch batch = new Batch();
                batch.setBatchId(rs.getInt("batch_id"));
                batch.setBatchName(rs.getString("batch_name"));
                batch.setBatchTime(rs.getString("batch_time"));

                batches.add(batch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return batches;
    }

    public List<Batch> getBatchesWithParticipants() throws SQLException {
        List<Batch> batchesWithParticipants = new ArrayList<>();

        try (PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Batch");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Batch batch = new Batch();
                batch.setBatchId(rs.getInt("batch_id"));
                batch.setBatchName(rs.getString("batch_name"));
                batch.setBatchTime(rs.getString("batch_time"));

                List<Participant> participants = getParticipantsForBatch(batch.getBatchId());
                batch.setParticipants(participants);

                batchesWithParticipants.add(batch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return batchesWithParticipants;
    }

    public List<Participant> getParticipantsForBatch(int batchId) throws SQLException {
        List<Participant> participants = new ArrayList<>();

        try (PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Participant WHERE batch_id = ?");
             ResultSet rs = pstmt.executeQuery()) {

            pstmt.setInt(1, batchId);

            while (rs.next()) {
                Participant participant = new Participant();
                participant.setParticipantId(rs.getInt("participant_id"));
                participant.setParticipantName(rs.getString("participant_name"));
                participant.setParticipantAge(rs.getInt("participant_age"));
                participant.setParticipantGender(rs.getString("participant_gender"));
                participant.setBatchId(rs.getInt("batch_id"));

                participants.add(participant);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return participants;
    }

    public String updateBatch(int batchId, String updatedBatchName, String updatedBatchTime) {
        String result = "Err";
        try (PreparedStatement pstmt = connection.prepareStatement(
                "UPDATE Batch SET batch_name = ?, batch_time = ? WHERE batch_id = ?")) {
            pstmt.setString(1, updatedBatchName);
            pstmt.setString(2, updatedBatchTime);
            pstmt.setInt(3, batchId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected >= 1) {
                result = "Success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public String deleteBatch(int batchId) {
        String result = "Err";
        try (PreparedStatement pstmt = connection.prepareStatement(
                "DELETE FROM Batch WHERE batch_id = ?")) {
            pstmt.setInt(1, batchId);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected >= 1) {
                result = "Success";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Close the connection when the BatchOperations object is no longer needed
    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Batch getBatchById(int batchId) throws SQLException {
        Batch batch = null;

        try (PreparedStatement pstmt = connection.prepareStatement("SELECT * FROM Batch WHERE batch_id = ?")) {
            pstmt.setInt(1, batchId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    batch = new Batch();
                    batch.setBatchId(rs.getInt("batch_id"));
                    batch.setBatchName(rs.getString("batch_name"));
                    batch.setBatchTime(rs.getString("batch_time"));
                }
            }
        }

        return batch;
    }

}
