package com.GymApplication.models;

public class Participant {
    private int participantId;
    private String participantName;
    private int participantAge;
    private String participantGender;
    private int batchId;

    // Constructors, getters, and setters

    public Participant() {
        // Default constructor
    }

    public Participant(String participantName, int participantAge, String participantGender, int batchId) {
        this.participantName = participantName;
        this.participantAge = participantAge;
        this.participantGender = participantGender;
        this.batchId = batchId;
    }

    // Getters and setters

    public int getParticipantId() {
        return participantId;
    }

    public void setParticipantId(int participantId) {
        this.participantId = participantId;
    }

    public String getParticipantName() {
        return participantName;
    }

    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }

    public int getParticipantAge() {
        return participantAge;
    }

    public void setParticipantAge(int participantAge) {
        this.participantAge = participantAge;
    }

    public String getParticipantGender() {
        return participantGender;
    }

    public void setParticipantGender(String participantGender) {
        this.participantGender = participantGender;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }
}

