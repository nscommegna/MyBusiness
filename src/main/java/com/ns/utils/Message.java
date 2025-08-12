package com.ns.utils;

public class Message {
    private String value;
    private MessageType type;

    public Message(String value, MessageType type) {
        this.value = value;
        this.type = type;
    }

    public Message() {

    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public MessageType getType() {
        return type;
    }

    public void setType(MessageType type) {
        this.type = type;
    }

    public Message createErrorMessage(){
        return new Message("Qualcosa è andato storto",MessageType.ERROR);
    }
}
