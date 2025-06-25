package com.ecobarn.model;

public class trackorderModel {
    private String orderId;
    private String email;
    private String status;

    public trackorderModel(String orderId, String email, String status) {
        this.orderId = orderId;
        this.email = email;
        this.status = status;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getEmail() {
        return email;
    }

    public String getStatus() {
        return status;
    }


    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setStatus(String status) {
        this.status = status;
    }

 
}
