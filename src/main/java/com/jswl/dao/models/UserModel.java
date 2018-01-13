package com.jswl.dao.models;

public class UserModel {
    private Integer id;

    private String name;

    private String telphone;

    private String visit;

    private String clientwill;

    private String source;

    private String advicetype;

    private String visitDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getVisit() {
        return visit;
    }

    public void setVisit(String visit) {
        this.visit = visit == null ? null : visit.trim();
    }

    public String getClientwill() {
        return clientwill;
    }

    public void setClientwill(String clientwill) {
        this.clientwill = clientwill == null ? null : clientwill.trim();
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public String getAdvicetype() {
        return advicetype;
    }

    public void setAdvicetype(String advicetype) {
        this.advicetype = advicetype == null ? null : advicetype.trim();
    }

    public String getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(String visitDate) {
        this.visitDate = visitDate == null ? null : visitDate.trim();
    }
}