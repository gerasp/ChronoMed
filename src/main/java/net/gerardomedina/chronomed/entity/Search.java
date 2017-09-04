package net.gerardomedina.chronomed.entity;

/**
 * Created by gerardo on 04.09.17.
 */
public class Search {
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
}
