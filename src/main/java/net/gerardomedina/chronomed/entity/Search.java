package net.gerardomedina.chronomed.entity;


public class Search {
    private String type;
    private String parameter;

    public Search() {
    }

    public Search(String parameter) {
        this.parameter = parameter;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
