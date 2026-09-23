package com.indianewsdesk.entity;

import jakarta.persistence.*;

/**
 * JPA ENTITY — maps to `newspapers` table in MySQL.
 */
@Entity
@Table(name = "newspapers")
public class Newspaper {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String language;

    @Column(nullable = false)
    private String state;

    @Column(name = "all_states", columnDefinition = "TEXT")
    private String allStates;

    @Column(name = "website_url", nullable = false)
    private String websiteUrl;

    @Column(name = "epaper_url", nullable = false)
    private String epaperUrl;

    @Column(nullable = false)
    private String founded;

    @Column(name = "free_epaper")
    private boolean freeEpaper;

    @Column(name = "region")
    private String region;

    // ── Constructors ─────────────────────────────────────────────
    public Newspaper() {}

    public Newspaper(Long id, String name, String language, String state,
                     String allStates, String websiteUrl, String epaperUrl,
                     String founded, boolean freeEpaper, String region) {
        this.id = id; this.name = name; this.language = language;
        this.state = state; this.allStates = allStates;
        this.websiteUrl = websiteUrl; this.epaperUrl = epaperUrl;
        this.founded = founded; this.freeEpaper = freeEpaper;
        this.region = region;
    }

    // ── Builder ──────────────────────────────────────────────────
    public static Builder builder() { return new Builder(); }

    public static class Builder {
        private Long id; private String name, language, state, allStates;
        private String websiteUrl, epaperUrl, founded, region;
        private boolean freeEpaper;

        public Builder id(Long id)               { this.id = id; return this; }
        public Builder name(String v)            { this.name = v; return this; }
        public Builder language(String v)        { this.language = v; return this; }
        public Builder state(String v)           { this.state = v; return this; }
        public Builder allStates(String v)       { this.allStates = v; return this; }
        public Builder websiteUrl(String v)      { this.websiteUrl = v; return this; }
        public Builder epaperUrl(String v)       { this.epaperUrl = v; return this; }
        public Builder founded(String v)         { this.founded = v; return this; }
        public Builder freeEpaper(boolean v)     { this.freeEpaper = v; return this; }
        public Builder region(String v)          { this.region = v; return this; }

        public Newspaper build() {
            return new Newspaper(id, name, language, state, allStates,
                    websiteUrl, epaperUrl, founded, freeEpaper, region);
        }
    }

    // ── Getters & Setters ────────────────────────────────────────
    public Long   getId()          { return id; }
    public String getName()        { return name; }
    public String getLanguage()    { return language; }
    public String getState()       { return state; }
    public String getAllStates()   { return allStates; }
    public String getWebsiteUrl()  { return websiteUrl; }
    public String getEpaperUrl()   { return epaperUrl; }
    public String getFounded()     { return founded; }
    public boolean isFreeEpaper()  { return freeEpaper; }
    public String getRegion()      { return region; }

    public void setId(Long id)              { this.id = id; }
    public void setName(String v)           { this.name = v; }
    public void setLanguage(String v)       { this.language = v; }
    public void setState(String v)          { this.state = v; }
    public void setAllStates(String v)      { this.allStates = v; }
    public void setWebsiteUrl(String v)     { this.websiteUrl = v; }
    public void setEpaperUrl(String v)      { this.epaperUrl = v; }
    public void setFounded(String v)        { this.founded = v; }
    public void setFreeEpaper(boolean v)    { this.freeEpaper = v; }
    public void setRegion(String v)         { this.region = v; }
}
