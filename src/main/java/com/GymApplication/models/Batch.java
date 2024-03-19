package com.GymApplication.models;

import java.util.List;

public class Batch {
    private int batchId;
    private String batchName;
    private String batchTime;
    private List<Participant> participants;

    // Constructors, getters, and setters

    public Batch() {
        // Default constructor
    }

    public Batch(String batchName, String batchTime) {
        this.batchName = batchName;
        this.batchTime = batchTime;
    }

    // Getters and setters

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public String getBatchTime() {
        return batchTime;
    }

    public void setBatchTime(String batchTime) {
        this.batchTime = batchTime;
    }

    public List<Participant> getParticipants() {
        return participants;
    }

    public void setParticipants(List<Participant> participants) {
        this.participants = participants;
    }
}
