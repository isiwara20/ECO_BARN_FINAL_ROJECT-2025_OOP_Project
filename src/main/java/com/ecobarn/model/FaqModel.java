package com.ecobarn.model;

import java.time.LocalDateTime;

public class FaqModel {
    private int faq_id;
    private String name, email, phonenumber, nic, question;
    private LocalDateTime date;

    public FaqModel() {}

    public FaqModel(int faq_id, String name, String email, String phonenumber, String nic, String question, LocalDateTime date) {
        this.faq_id = faq_id;
        this.name = name;
        this.email = email;
        this.phonenumber = phonenumber;
        this.nic = nic;
        this.question = question;
        this.date = date;
    }

    public int getFaq_id() { return faq_id; }
    public void setFaq_id(int faq_id) { this.faq_id = faq_id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhonenumber() { return phonenumber; }
    public void setPhonenumber(String phonenumber) { this.phonenumber = phonenumber; }

    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }

    public String getQuestion() { return question; }
    public void setQuestion(String question) { this.question = question; }

    public LocalDateTime getDate() { return date; }
    public void setDate(LocalDateTime date) { this.date = date; }
}
